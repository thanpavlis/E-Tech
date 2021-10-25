package com.example.Eshop.services.impl;

import com.example.Eshop.dto.CartDto;
import com.example.Eshop.dto.CartProductDto;
import com.example.Eshop.dto.PDFInfoDto;
import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.Orders;
import com.example.Eshop.entities.User;
import com.example.Eshop.services.OrderService;
import com.example.Eshop.services.ProductService;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SuccessPaymentService {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private EmailSenderService emailService;

    @Autowired
    private PDFCreatorService pdfService;

    @Value("${domain-name}")
    String domainName;

    private String getRoot(HttpSession session) {
        String path = session.getServletContext().getRealPath("/");
        path = path.substring(0, path.lastIndexOf("\\target"));//gia na paw sto root folder
        return (path);
    }

    private String getPath(HttpSession session, String filename) {//pairnw to real path tou server ston opoio tha apothikeuontai ta pdf entos tou project
        String path = getRoot(session);
        path += "\\src\\main\\webapp\\orders\\" + filename + ".pdf";
        return (path);
    }

    private PDFInfoDto extractJSONData(String json) {
        String line, city, country_code, postal_code;
        JSONObject paymentInfo = new JSONObject(json);
        //id
        String payid = paymentInfo.get("id").toString();
        payid = payid.substring(6, payid.length());
        //payer->payer_info->shipping_address
        JSONObject addressInfo = paymentInfo.getJSONObject("payer").getJSONObject("payer_info").getJSONObject("shipping_address");
        //address
        line = addressInfo.get("line1").toString();
        city = addressInfo.get("city").toString();
        country_code = addressInfo.get("country_code").toString();
        postal_code = addressInfo.get("postal_code").toString();
        //current datetime
        DateTimeFormatter orderDateTime = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime now = LocalDateTime.now();
        return (new PDFInfoDto(payid, (line + " " + city + " " + postal_code + " " + country_code), orderDateTime.format(now)));
    }

    public void makeOrder(HttpSession session, String paymentInfoJson) throws UnsupportedEncodingException {
        updateDBStock(session);//enhmerwsh tou stock ths bashs
        PDFInfoDto pdfinfo = extractJSONData(paymentInfoJson);//dedomena apo to json tou paypal pou xreiazontai sto pdf
        pdfService.createPDF(session, pdfinfo, getRoot(session), getPath(session, pdfinfo.getOrderID()));//export pdf invoice
        insertDBOrder(session, pdfinfo.getOrderID(), pdfinfo.getOrderDateTime());//insert tou order sthn bash
        sendEmail(session, pdfinfo);//apostolh email ston pelath
        emptyCart(session);//adeiasma tou cart 
    }

    private void emptyCart(HttpSession session) {
        ((CartDto) session.getAttribute("cart")).clearCart();
    }

    private void sendEmail(HttpSession session, PDFInfoDto pdfinfo) throws UnsupportedEncodingException {
        try {
            UserDto user = (UserDto) session.getAttribute("user");
            //emailService.sendEmailWithAttachment(user.getEmail(), "Order: " + filename, "<html><body style='font-size: 20px;'>Mr/Ms " + user.getFname() + " " + user.getLname() + " your order with code <span style='color:#FF0000'>" + filename + "</span> has successfully completed ! <br> Thank you !</body></html>", getRoot(session) + "\\src\\main\\webapp\\orders\\" + filename + ".pdf");
            emailService.sendEmailWithAttachment(user.getEmail(), "Order: " + pdfinfo.getOrderID(), makeEmailBody(session, pdfinfo), getRoot(session) + "\\src\\main\\webapp\\orders\\" + pdfinfo.getOrderID() + ".pdf"
            );
        } catch (MessagingException ex) {
            Logger.getLogger(SuccessPaymentService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String makeEmailBody(HttpSession session, PDFInfoDto pdfinfo) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        UserDto user = (UserDto) session.getAttribute("user");
        StringBuilder sb = new StringBuilder();
        sb.append("<html>\n");
        sb.append("<head>\n");
        sb.append("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
        sb.append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
        sb.append("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
        sb.append("<body>\n");
        sb.append("    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n");
        sb.append("        <tr>\n");
        sb.append("            <td align=\"center\" style=\"background-color: #eeeeee;\" bgcolor=\"#eeeeee\">\n");
        sb.append("                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:800px;\">\n");
        sb.append("                    <tr>\n");
        sb.append("                        <td align=\"center\" valign=\"top\" style=\"font-size:0; padding: 35px;\" bgcolor=\"#F44336\">\n");
        sb.append("                            <div\n");
        sb.append("                                style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\">\n");
        sb.append("                                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n");
        sb.append("                                    style=\"max-width:300px;\">\n");
        sb.append("                                    <tr>\n");
        sb.append("                                        <td align=\"left\" valign=\"top\"\n");
        sb.append("                                            style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;\"\n");
        sb.append("                                            class=\"mobile-center\">\n");
        sb.append("                                            <a href=").append(domainName).append(">\n");
        sb.append("                                                <h1\n");
        sb.append("                                                    style=\"font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;\">\n");
        sb.append("                                                    E-tech</h1>\n");
        sb.append("                                            </a>\n");
        sb.append("                                        </td>\n");
        sb.append("                                    </tr>\n");
        sb.append("                                </table>\n");
        sb.append("                            </div>\n");
        sb.append("                            <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\"\n");
        sb.append("                                class=\"mobile-hide\">\n");
        sb.append("                            </div>\n");
        sb.append("                        </td>\n");
        sb.append("                    </tr>\n");
        sb.append("                    <tr>\n");
        sb.append("                        <td align=\"center\" style=\"padding: 35px 35px 20px 35px; background-color: #ffffff;\"\n");
        sb.append("                            bgcolor=\"#ffffff\">\n");
        sb.append("                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n");
        sb.append("                                style=\"max-width:100%;\">\n");
        sb.append("                                <tr>\n");
        sb.append("                                    <td align=\"center\"\n");
        sb.append("                                        style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\">\n");
        sb.append("                                        <img src=\"https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png\"\n");
        sb.append("                                            width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" /><br>\n");
        sb.append("                                        <h2\n");
        sb.append("                                            style=\"font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\">\n");
        sb.append("                                            Thank you for your order ! </h2>\n");
        sb.append("                                    </td>\n");
        sb.append("                                </tr>\n");
        sb.append("                                <tr>\n");
        sb.append("                                    <td align=\"left\" style=\"padding-top: 50px;\">\n");
        sb.append("                                        <table cellspacing=\"0\" cellpadding=\"0\" border=\"1\" width=\"100%\">\n");
        sb.append("                                            <tr>\n");
        sb.append("                                                <td width=\"20%\" align=\"left\" bgcolor=\"#eeeeee\"\n");
        sb.append("                                                    style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\n");
        sb.append("                                                    #Order Code:</td>\n");
        sb.append("                                                <td width=\"80%\" align=\"right\" bgcolor=\"#eeeeee\"\n");
        sb.append("                                                    style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\n");
        sb.append("                                                    ").append(pdfinfo.getOrderID()).append(" </td>\n");
        sb.append("                                            </tr>\n");
        sb.append("                                        </table>\n");
        sb.append("                                        <table cellspacing=\"0\" cellpadding=\"0\" border=\"1\" width=\"100%\">\n");
        sb.append("                                            <tr>\n");
        sb.append("                                                <td width=\"50%\" align=\"center\" bgcolor=\"#eeeeee\"\n");
        sb.append("                                                    style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\n");
        sb.append("                                                    Name </td>\n");
        sb.append("                                                <td width=\"10%\" align=\"center\" bgcolor=\"#eeeeee\"\n");
        sb.append("                                                    style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\n");
        sb.append("                                                    Qty </td>\n");
        sb.append("                                                <td width=\"20%\" align=\"center\" bgcolor=\"#eeeeee\"\n");
        sb.append("                                                    style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\n");
        sb.append("                                                    Price </td>\n");
        sb.append("                                                <td width=\"20%\" align=\"center\" bgcolor=\"#eeeeee\"\n");
        sb.append("                                                    style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">\n");
        sb.append("                                                    Total </td>\n");
        sb.append("                                            </tr>\n");
        for (CartProductDto product : cart.getProducts()) {
            sb.append("<tr>\n");
            sb.append("<td width=\"50%\" align=\"center\"\n");
            sb.append("style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 510; line-height: 24px; padding: 10px;\">\n");
            sb.append(product.getName()).append("</td>\n");
            sb.append("<td width=\"10%\" align=\"center\"\n");
            sb.append("style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 510; line-height: 24px; padding: 10px;\">\n");
            sb.append(product.getQuantity()).append("</td>\n");
            sb.append("<td width=\"20%\" align=\"center\"\n");
            sb.append("style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 510; line-height: 24px; padding: 10px;\">\n");
            sb.append(String.format("%.2f", product.getPrice())).append(" €</td>\n");
            sb.append("<td width=\"20%\" align=\"center\"\n");
            sb.append("style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 510; line-height: 24px; padding: 10px;\">\n");
            sb.append(String.format("%.2f", product.getTotal())).append(" €</td>\n");
            sb.append("</tr>\n");
        }
        sb.append(" </table>\n");
        sb.append("                                    </td>\n");
        sb.append("                                </tr>\n");
        sb.append("                                    <td align=\"left\" style=\"padding-top: 20px;\">\n");
        sb.append("                                        <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">\n");
        sb.append("                                            <tr>\n");
        sb.append("                                                <td width=\"75%\" align=\"left\"\n");
        sb.append("                                                    style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\">\n");
        sb.append("                                                    Total Amount</td>\n");
        sb.append("                                                <td width=\"25%\" align=\"right\"\n");
        sb.append("                                                    style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\">\n");
        sb.append(String.format("%.2f", cart.getTotalAmount())).append(" €</td>\n");
        sb.append("                                            </tr>\n");
        sb.append("                                        </table>\n");
        sb.append("                                    </td>\n");
        sb.append("                                </tr>\n");
        sb.append("                            </table>\n");
        sb.append("                        </td>\n");
        sb.append("                    </tr>\n");
        sb.append("                    <tr>\n");
        sb.append("                        <td align=\"center\" height=\"100%\" valign=\"top\" width=\"100%\"\n");
        sb.append("                            style=\"padding: 35px 35px 35px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\n");
        sb.append("                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n");
        sb.append("                                style=\"max-width:660px;\">\n");
        sb.append("                                <tr>\n");
        sb.append("                                    <td align=\"center\" valign=\"top\" style=\"font-size:0;\">\n");
        sb.append("                                        <div\n");
        sb.append("                                            style=\"display:inline-block; max-width:50%; min-width:240px; vertical-align:top; width:100%;\">\n");
        sb.append("                                            <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n");
        sb.append("                                                style=\"max-width:300px;\">\n");
        sb.append("                                                <tr>\n");
        sb.append("                                                    <td align=\"left\" valign=\"top\"\n");
        sb.append("                                                        style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;\">\n");
        sb.append("                                                        <p style=\"font-weight: 800;\">Shipping Address</p>\n");
        sb.append("                                                        <p>").append(user.getFname()).append(" ").append(user.getLname()).append("<br>").append(pdfinfo.getAddress()).append("\n");
        sb.append("                                                            <br>").append(user.getEmail()).append("<br>").append(user.getPhone()).append("\n");
        sb.append("                                                        </p>\n");
        sb.append("                                                    </td>\n");
        sb.append("                                                </tr>\n");
        sb.append("                                            </table>\n");
        sb.append("                                        </div>\n");
        sb.append("                                        <div\n");
        sb.append("                                            style=\"display:inline-block; max-width:50%; min-width:240px; vertical-align:top; width:100%;\">\n");
        sb.append("                                            <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n");
        sb.append("                                                style=\"max-width:300px;\">\n");
        sb.append("                                                <tr>\n");
        sb.append("                                                    <td align=\"left\" valign=\"top\"\n");
        sb.append("                                                        style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;\">\n");
        sb.append("                                                        <p style=\"font-weight: 800;\">Order Details:</p>\n");
        sb.append("                                                        <p>Date: ").append(pdfinfo.getOrderDateTime()).append("<br>Payment: PAYPAL<br>Transport:ACS\n");
        sb.append("                                                        </p>\n");
        sb.append("                                                    </td>\n");
        sb.append("                                                </tr>\n");
        sb.append("                                            </table>\n");
        sb.append("                                        </div>\n");
        sb.append("                                    </td>\n");
        sb.append("                                </tr>\n");
        sb.append("                            </table>\n");
        sb.append("                        </td>\n");
        sb.append("                    </tr>\n");
        sb.append("                    <tr>\n");
        sb.append("                        <td align=\"center\" style=\"padding: 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\n");
        sb.append("                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n");
        sb.append("                                style=\"max-width:700px;\">\n");
        sb.append("                                <tr>\n");
        sb.append("                                    <td align=\"center\"> <img\n");
        sb.append("                                            src=\"https://img.icons8.com/color/48/000000/google-maps-new.png\"\n");
        sb.append("                                            width=\"50\" height=\"50\" style=\"display: block; border: 0px;\" /> </td>\n");
        sb.append("                                </tr>\n");
        sb.append("                                <tr>\n");
        sb.append("                                    <td align=\"center\"\n");
        sb.append("                                        style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px; padding: 5px 0 10px 0;\">\n");
        sb.append("                                        <p\n");
        sb.append("                                            style=\"font-size: 14px; font-weight: 800; line-height: 18px; color: #333333;\">\n");
        sb.append("                                            105 64, Oμόνοια 39,<br> Αθήνα 105 64 <br> 210-1234567</p>\n");
        sb.append("                                    </td>\n");
        sb.append("                                </tr>\n");
        sb.append("                            </table>\n");
        sb.append("                        </td>\n");
        sb.append("                    </tr>\n");
        sb.append("                </table>\n");
        sb.append("            </td>\n");
        sb.append("        </tr>\n");
        sb.append("    </table>\n");
        sb.append("</body>\n");
        sb.append("</html>");
        return (sb.toString());
    }

    private void updateDBStock(HttpSession session) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        for (CartProductDto product : cart.getProducts()) {
            productService.updateProductStock(product);
        }
    }

    private void insertDBOrder(HttpSession session, String filename, String orderdate) {
        try {
            //stoixeia xrhsth
            UserDto user = (UserDto) session.getAttribute("user");
            Orders order = new Orders();
            order.setPdfurl("./orders/" + filename + ".pdf");
            //settarisma hmeromhnias
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            order.setOrderdate(formatter.parse(orderdate + ":00"));
            //settarisma xrhsth
            User u = new User();
            u.setId(user.getId());
            order.setUserId(u);
            orderService.insertOrder(order);//insert ston pinaka orders
        } catch (ParseException ex) {
            Logger.getLogger(SuccessPaymentService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

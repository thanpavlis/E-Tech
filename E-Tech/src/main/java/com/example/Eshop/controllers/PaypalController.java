package com.example.Eshop.controllers;

import com.example.Eshop.services.impl.PaypalService;
import com.example.Eshop.services.impl.SuccessPaymentService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PaypalController {

    @Autowired
    private PaypalService paypalService;

    @Autowired
    private SuccessPaymentService successPaymentService;

    @Value("${domain-name}")
    String domainName;

    public static final String SUCCESS_URL = "pay/success";
    public static final String CANCEL_URL = "pay/cancel";

    @PostMapping("/pay")
    @ResponseBody
    public String payment(@RequestParam("price") double price) {
        try {
            Payment payment = paypalService.createPayment(price, "EUR",
                    "PAYPAL", "ORDER", "",
                    domainName + "/" + CANCEL_URL, domainName + "/" + SUCCESS_URL);
            System.out.println("\n\n\n\n\n\n\nMPIKE STIN PAYPAL");
            for (Links link : payment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    System.out.println("\n\n\n\n\n\n\n" + link.getHref());
                    return (link.getHref());
                }
            }
        } catch (PayPalRESTException ex) {
            System.out.println(ex.getMessage());
        }
        return (domainName);
    }

    @GetMapping(CANCEL_URL)
    public String cancelPay(HttpSession session) {
        session.setAttribute("payment", false);
        return ("redirect:/products");
    }

    @GetMapping(SUCCESS_URL)
    public String successPay(HttpSession session, @RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) throws UnsupportedEncodingException {
        try {
            Payment payment = paypalService.executePayment(paymentId, payerId);
            synchronized (this) {
                successPaymentService.makeOrder(session, payment.toJSON());
            }
            if (payment.getState().equals("approved")) {
                session.setAttribute("payment", true);
                return ("redirect:/products");
            }
        } catch (PayPalRESTException ex) {
            System.out.println(ex.getMessage());
        }
        return ("index");
    }

}

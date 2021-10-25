package com.example.Eshop.services.impl;

import com.example.Eshop.dto.CartDto;
import com.example.Eshop.dto.CartProductDto;
import com.example.Eshop.dto.PDFInfoDto;
import com.example.Eshop.dto.UserDto;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.VerticalAlignment;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

@Service
public class PDFCreatorService {

    public void createPDF(HttpSession session, PDFInfoDto pdfinfo, String root, String filepath) {
        try {
            CartDto cart = (CartDto) session.getAttribute("cart");
            UserDto user = (UserDto) session.getAttribute("user");
            //dhmiourgia pdf
            PdfWriter pdfWriter = new PdfWriter(filepath);
            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
            Document document = new Document(pdfDocument);
            pdfDocument.setDefaultPageSize(PageSize.A4);
            //gia na grafei ellhnika sto pdf
            PdfFontFactory.register(root + "\\src\\main\\resources\\static\\fonts\\OpenSans-Regular.ttf", "greek");
            PdfFont greekFont = PdfFontFactory.createRegisteredFont("greek", PdfEncodings.CP1253, PdfFontFactory.EmbeddingStrategy.FORCE_EMBEDDED);
            document.setFont(greekFont);
            //settarisma logo
            Image img1 = new Image(ImageDataFactory.create(root + "\\src\\main\\resources\\static\\images\\logo3.png"));
            img1.scaleToFit(150, 100);
            img1.setHorizontalAlignment(HorizontalAlignment.LEFT);
            //prwtos pinakas
            float columnWidth[] = {280, 280};
            Table table = new Table(columnWidth);
            table.addCell(new Cell().add(img1)
                    .setMarginTop(15f)
                    .setFontSize(20f)
                    .setBorder(Border.NO_BORDER)
                    .setTextAlignment(TextAlignment.LEFT)
            );
            table.addCell(new Cell().add(new Paragraph("INVOICE"))
                    .setTextAlignment(TextAlignment.RIGHT)
                    .setMarginTop(15f)
                    .setFontSize(20f)
                    .setBorder(Border.NO_BORDER)
                    .setMarginRight(10f)
            );
            //deuteros pinakas 
            float colWidth[] = {280, 280};
            Table customerInfoTable = new Table(colWidth);
            customerInfoTable.addCell(new Cell(0, 2).add(new Paragraph("Order Informations").setBold())
                    .setBackgroundColor(new DeviceRgb(63, 169, 279))
                    .setTextAlignment(TextAlignment.CENTER)
                    .setFontColor(new DeviceRgb(255, 255, 255))
                    .setFontSize(14f)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph("SHIPPING ADRESS").setBold())
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderBottom(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph("No: ").add(new Paragraph(pdfinfo.getOrderID()).setBold())).setWidth(250)
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setBorderBottom(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph(user.getFname() + " " + user.getLname()).setWidth(250))
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderTop(Border.NO_BORDER)
                    .setBorderBottom(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph("Date: " + pdfinfo.getOrderDateTime()))
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setBorderBottom(Border.NO_BORDER)
                    .setBorderTop(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph(pdfinfo.getAddress()).setWidth(250))
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderBottom(Border.NO_BORDER)
                    .setBorderTop(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph("Payment: PAYPAL"))
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setBorderBottom(Border.NO_BORDER)
                    .setBorderTop(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph(user.getEmail()).setWidth(250))
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderBottom(Border.NO_BORDER)
                    .setBorderTop(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph("Transport: ACS").setWidth(250))
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setBorderBottom(Border.NO_BORDER)
                    .setBorderTop(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph(user.getPhone().substring(0, 3) + " " + user.getPhone().substring(3, 6) + " " + user.getPhone().substring(6, 10)).setWidth(250))
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderTop(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            customerInfoTable.addCell(new Cell().add(new Paragraph("").setWidth(250))
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setBorderTop(Border.NO_BORDER)
                    .setFontSize(11f)
            );
            //tritos pinakas
            float itemInfoColwidth[] = {300, 60, 100, 100};
            Table itemInfoTable = new Table(itemInfoColwidth);
            itemInfoTable.setFontSize(11);
            itemInfoTable.addHeaderCell(new Cell(0, 4).add(new Paragraph("Items Description").setBold())
                    .setBackgroundColor(new DeviceRgb(63, 169, 279))
                    .setTextAlignment(TextAlignment.CENTER)
                    .setFontColor(new DeviceRgb(255, 255, 255))
                    .setFontSize(14f)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
            );
            //sthles pinaka san header wsta an allaxei h selida na epanalambanontai
            itemInfoTable.addHeaderCell(new Cell().add(new Paragraph("Name"))
                    .setBackgroundColor(new DeviceRgb(63, 169, 279))
                    .setFontColor(new DeviceRgb(255, 255, 255))
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setTextAlignment(TextAlignment.CENTER)
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
            );
            itemInfoTable.addHeaderCell(new Cell().add(new Paragraph("Qty"))
                    .setBackgroundColor(new DeviceRgb(63, 169, 279))
                    .setFontColor(new DeviceRgb(255, 255, 255))
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setTextAlignment(TextAlignment.CENTER)
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
            );
            itemInfoTable.addHeaderCell(new Cell().add(new Paragraph("Price"))
                    .setBackgroundColor(new DeviceRgb(63, 169, 279))
                    .setFontColor(new DeviceRgb(255, 255, 255))
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setTextAlignment(TextAlignment.CENTER)
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
            );
            itemInfoTable.addHeaderCell(new Cell().add(new Paragraph("Total"))
                    .setBackgroundColor(new DeviceRgb(63, 169, 279))
                    .setFontColor(new DeviceRgb(255, 255, 255))
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setTextAlignment(TextAlignment.CENTER)
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
            );
            for (CartProductDto p : cart.getProducts()) {
                itemInfoTable.addCell(new Cell().add(new Paragraph(p.getName()).setWidth(290))
                        .setTextAlignment(TextAlignment.LEFT)
                        .setVerticalAlignment(VerticalAlignment.MIDDLE)
                        .setBorderLeft(Border.NO_BORDER)
                        .setBorderRight(Border.NO_BORDER)
                        .setFontSize(10f));
                itemInfoTable.addCell(new Cell().add(new Paragraph(String.valueOf(p.getQuantity())))
                        .setTextAlignment(TextAlignment.CENTER)
                        .setVerticalAlignment(VerticalAlignment.MIDDLE)
                        .setBorderLeft(Border.NO_BORDER)
                        .setBorderRight(Border.NO_BORDER));
                itemInfoTable.addCell(new Cell().add(new Paragraph(String.format("%.2f €", p.getPrice())))
                        .setTextAlignment(TextAlignment.CENTER)
                        .setVerticalAlignment(VerticalAlignment.MIDDLE)
                        .setBorderLeft(Border.NO_BORDER)
                        .setBorderRight(Border.NO_BORDER));
                itemInfoTable.addCell(new Cell().add(new Paragraph(String.format("%.2f €", p.getTotal())))
                        .setTextAlignment(TextAlignment.CENTER)
                        .setVerticalAlignment(VerticalAlignment.MIDDLE)
                        .setBorderLeft(Border.NO_BORDER)
                        .setBorderRight(Border.NO_BORDER));
            }
            itemInfoTable.addCell(new Cell().add(new Paragraph(""))
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER));
            itemInfoTable.addCell(new Cell().add(new Paragraph(""))
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER));
            itemInfoTable.addCell(new Cell().add(new Paragraph("Total Amount:"))
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
                    .setTextAlignment(TextAlignment.CENTER)
            );
            itemInfoTable.addCell(new Cell().add(new Paragraph(String.valueOf(String.format("%.2f €", cart.getTotalAmount()))).setBold())
                    .setTextAlignment(TextAlignment.CENTER)
                    .setVerticalAlignment(VerticalAlignment.MIDDLE)
                    .setBorderLeft(Border.NO_BORDER)
                    .setBorderRight(Border.NO_BORDER)
            );
            document.add(new Paragraph("\n"));
            document.add(table);
            document.add(new Paragraph("\n"));
            document.add(customerInfoTable);
            document.add(new Paragraph("\n"));
            document.add(itemInfoTable);
            //kleisimo rown
            document.flush();
            document.close();
            pdfDocument.close();
            pdfWriter.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(SuccessPaymentService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(SuccessPaymentService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

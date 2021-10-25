package com.example.Eshop.controllers;

import com.example.Eshop.entities.Orders;
import com.example.Eshop.entities.Product;
import com.example.Eshop.models.SmsRequest;
import com.example.Eshop.services.BrandService;
import com.example.Eshop.services.CategoryService;
import com.example.Eshop.services.OrderService;
import com.example.Eshop.services.ProductService;
import com.example.Eshop.services.impl.SmsService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private SmsService smsService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor ste = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, ste);
    }

    @GetMapping("/stock")
    public String showStock(ModelMap modelMap, HttpSession session) {
        List<Product> products = productService.getAllProducts();
        modelMap.addAttribute("products", products);
        if (session.getAttribute("transaction") != null) {
            modelMap.addAttribute("transaction", session.getAttribute("transaction"));
            session.removeAttribute("transaction");
        }
        return ("/admin/stock");
    }

    @GetMapping("/delete-product")
    public String deleteProduct(@RequestParam("id") int id) {
        productService.deleteProduct(id);
        return ("redirect:/stock");
    }

    @GetMapping("/orders")
    public String showOrders(ModelMap modelMap) {
        List<Orders> orders = orderService.getAllOrders();
        modelMap.addAttribute("orders", orders);
        return ("/admin/orders");
    }

    @GetMapping("/delete-order")
    public String deleteOrder(@RequestParam("id") int id) {
        orderService.deleteOrder(id);
        return ("redirect:/orders");
    }

    @PostMapping("/orderShipped")
    @ResponseBody
    public boolean orderShipped(@RequestParam("orderId") int id,
            @RequestParam("orderNumber") String orderNumber,
            @RequestParam("customersPhone") String customersPhone) {
        if (orderService.orderShipped(id)) {
            SmsRequest smsRequest = new SmsRequest("+30" + customersPhone, "Η παραγγελία σας με αριθμό " + orderNumber + " έχει αποσταλλεί με την ACS Courier και είναι καθοδόν. Σας ευχαριστούμε ! 🙂 🙂 🙂");
            smsService.sendSms(smsRequest);
            return (true);
        }
        return (false);
    }

    @GetMapping("/edit-product")
    public String editProduct(@Param(value = "id") int id, ModelMap mm) {
        Product product = productService.getProductById(id);
        if (product != null) {
            mm.addAttribute("product", product);
            mm.addAttribute("action", "update-product");
            mm.addAttribute("brands", brandService.getAllBrands());
            mm.addAttribute("categories", categoryService.getAllCategories());
            return ("/admin/admin-product-page");
        }
        return ("redirect:/error");
    }

    @GetMapping("/new-product")
    public String newProduct(ModelMap mm) {
        Product product = new Product();
        mm.addAttribute("product", product);
        mm.addAttribute("title", "Add a new product in stock . . .");
        mm.addAttribute("brands", brandService.getAllBrands());
        mm.addAttribute("categories", categoryService.getAllCategories());
        mm.addAttribute("action", "insert-product");
        return ("/admin/admin-product-page");
    }

    @PostMapping("/insert-product")
    public String insertProduct(@Valid @ModelAttribute("product") Product product, BindingResult theBindingResult, HttpSession session, ModelMap mm) throws ParseException {
        boolean valid = !(theBindingResult.hasErrors());
        if (product.getEndDate() != null) {
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date today = new Date();
            Date todayWithZeroTime = formatter.parse(formatter.format(today));
            if (product.getEndDate().equals(todayWithZeroTime) || product.getEndDate().after(todayWithZeroTime)) {
                if (product.getDiscount() < 1) {
                    valid = false;
                    mm.addAttribute("discount_error", "Discount can't be lower than 1% !!");
                }
            }
        }
        if (!valid) {
            mm.addAttribute("brands", brandService.getAllBrands());
            mm.addAttribute("categories", categoryService.getAllCategories());
            return ("/admin/admin-product-page");
        }
        productService.saveNewProduct(product);
        session.setAttribute("transaction", "Product added successfully !");
        return ("redirect:/stock");
    }

    @PostMapping("/update-product")
    public String updateProduct(@Valid @ModelAttribute("product") Product product, BindingResult theBindingResult, HttpSession session, ModelMap mm) throws ParseException {
        boolean valid = !(theBindingResult.hasErrors());
        if (product.getEndDate() != null) {
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date today = new Date();
            Date todayWithZeroTime = formatter.parse(formatter.format(today));
            if (product.getEndDate().equals(todayWithZeroTime) || product.getEndDate().after(todayWithZeroTime)) {
                if (product.getDiscount() < 1) {
                    valid = false;
                    mm.addAttribute("discount_error", "Discount can't be lower than 1% !!");
                }
            }
        }
        if (!valid) {
            mm.addAttribute("brands", brandService.getAllBrands());
            mm.addAttribute("categories", categoryService.getAllCategories());
            return ("/admin/admin-product-page");
        }
        productService.updateProduct(product);
        session.setAttribute("transaction", "Product updated successfully !");
        return ("redirect:/stock");
    }
}

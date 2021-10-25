package com.example.Eshop.controllers.api;

import com.example.Eshop.dto.CartDto;
import com.example.Eshop.dto.CartProductDto;
import com.example.Eshop.entities.Product;
import com.example.Eshop.services.ProductService;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private ProductService productService;

    @GetMapping("/addProductToCart/{price}/{id}")
    public boolean addProductToCart(HttpSession session, @PathVariable("id") String idString, @PathVariable("price") double price) {
        int id = Integer.parseInt(idString);
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new CartDto());
            session.setMaxInactiveInterval(-1);
        }
        Product p = productService.getProductById(id);//fernw to proion pou thelw na balw sto kalathi
        CartProductDto cp = new CartProductDto(p.getId(), p.getName(), price, p.getStock(), p.getImageList().get(0).getUrl());
        CartDto cart = (CartDto) session.getAttribute("cart");//pairnw to cart     
        boolean add = cart.addToCart(cp);//prosthiki sto kalathi
        if (!add) {//yparxei hdh
            return (false);
        }
        return (true);
    }

    @GetMapping("/numberOfProductsInCart")
    public int numberOfProductsInCart(HttpSession session) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        if (cart == null) {
            return (0);
        } else {
            return (cart.getNumberOfProducts());
        }
    }

    @GetMapping("/getCart")
    public ResponseEntity<?> getCart(HttpSession session) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        return (new ResponseEntity(cart, HttpStatus.OK));
    }

    @GetMapping("/updateQuantity/{id}/{quantity}")//poio id tha enhmerwsw kai me ti quantity erxetai apo to front
    public boolean updateQuantity(HttpSession session, @PathVariable("id") int id, @PathVariable("quantity") int quantity) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        return (cart.updateQuantity(id, quantity));
    }

    @GetMapping("/deleteProduct/{id}")
    public int deleteProduct(HttpSession session, @PathVariable("id") int id) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        return (cart.deleteProduct(id));//epistrefw ton arithmo twn proiontwn sto kalathi
    }

    @GetMapping("/clearCart")
    public boolean clearCart(HttpSession session) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        return (cart.clearCart());
    }

    @GetMapping("/checkProductsWithStock")
    public ResponseEntity<?> checkProductsWithStock(HttpSession session) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        HashMap<Integer, Product> productsDB = productService.getProductsByIds(cart.getProductsIds());//ta proionta apo thn bash me to enhmerwmeno stock
        return (new ResponseEntity<>(cart.checkProductsWithStock(productsDB), HttpStatus.OK));
    }

}

package com.example.Eshop.controllers;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.Product;
import com.example.Eshop.entities.Rating;
import com.example.Eshop.services.ProductService;
import com.example.Eshop.services.RatingService;
import com.example.Eshop.services.UserService;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private RatingService ratingService;

    @Autowired
    private UserService userService;

    @GetMapping("/products")
    public String showProducts(@RequestParam(name = "category", required = false) String category,
            @RequestParam(name = "favourites", required = false) String favourites,
            @RequestParam(name = "newArrivals", required = false) String newArrivals,
            Model m, HttpSession session) {
        List<Product> products = null;
        if ("true".equals(favourites)) {
            if (session.getAttribute("user") != null) {
                UserDto userDto = (UserDto) session.getAttribute("user");
                products = userService.getFavouriteProducts(userDto.getId());
            } else {
                return "redirect:/login";
            }
        } else if ("true".equals(newArrivals)) {
            products = productService.getNewArrivals();
        } else {
            products = (category == null) ? productService.getAllProducts() : productService.getProductsByCategoryId(category);
        }
        List<Product> promotions = productService.getPromotions();
        if (!promotions.isEmpty()) {
            m.addAttribute("promotions", promotions);
        }
        m.addAttribute("products", products);
        List<String> brands = productService.getBrandsPerPage(products);
        m.addAttribute("brands", brands);
        m.addAttribute("max_price", productService.getMaxPriceByIds(products));
        m.addAttribute("ratings", ratingService.findAllProductsAvgRating());
        if (session.getAttribute("payment") != null) {
            m.addAttribute("payment", (boolean) session.getAttribute("payment"));
            session.removeAttribute("payment");
        }
        return ("products");
    }

    @GetMapping("/product-page")
    public String showProduct(HttpSession session, @RequestParam("id") int id, ModelMap modelMap) {
        Product product = productService.getProductById(id);
        if (product != null) {
            modelMap.addAttribute("productImages", product.getImageList());
            modelMap.addAttribute("product", product);
            modelMap.addAttribute("comments", product.getCommentList());
            modelMap.addAttribute("rating", ratingService.findAvgRatingByProductId(id));
            if (session.getAttribute("user") != null) {
                UserDto userDto = (UserDto) session.getAttribute("user");
                List<Product> products = userService.getFavouriteProducts(userDto.getId());
                for (Product productItem : products) {
                    if (productItem.getId() == id) {
                        modelMap.addAttribute("favourite", true);
                    }
                }
                List<Rating> ratings = userService.getUserRatings(userDto.getId());
                for (Rating rating : ratings) {
                    if (rating.getProduct().getId() == id) {
                        modelMap.addAttribute("userRating", rating.getRatingNum());
                    }
                }
            }
            return ("product");
        }
        return ("redirect:/error");
    }

}

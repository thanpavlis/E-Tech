package com.example.Eshop.controllers;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.Rating;
import com.example.Eshop.services.RatingService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product-page")
public class RatingController {

    @Autowired
    private RatingService ratingService;

    @PostMapping("/saveRating")
    public String saveRating(HttpSession session, @RequestParam("rating") int usersRating, @RequestParam("productId") int productId) {
        if (session.getAttribute("user") != null) {
            UserDto userDto = (UserDto) session.getAttribute("user");
            Rating rating = ratingService.setRatingDetails(usersRating, userDto.getId(), productId);
            ratingService.save(rating);
            return ("redirect:/product-page?id=" + productId);
        }
        return ("redirect:/login");
    }

}

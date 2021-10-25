package com.example.Eshop.controllers;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.services.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/checkIfUserIsLoggedIn")
    @ResponseBody
    public boolean checkIfUserIsLoggedIn(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return (false);
        }
        return (true);
    }

    @GetMapping("/checkIfRoleAdmin")
    @ResponseBody
    public boolean checkIfRoleAdmin(HttpSession session) {
        if (session.getAttribute("user") != null) {
            UserDto user = (UserDto) session.getAttribute("user");
            if (user.getRole().equals("ROLE_ADMIN")) {
                return (true);
            }
        }
        return (false);
    }

    @PostMapping("/saveFavourite")
    @ResponseBody
    public boolean saveUserFavouriteProduct(HttpSession session, @RequestParam("proId") int productId) {
        if (session.getAttribute("user") != null) {
            UserDto userDto = (UserDto) session.getAttribute("user");
            userService.saveFavourites(userDto, productId);
            return (true);
        }
        return (false);
    }

    @PostMapping("/removeFavourite")
    @ResponseBody
    public boolean removeUserFavouriteProduct(HttpSession session, @RequestParam("proId") int productId) {
        if (session.getAttribute("user") != null) {
            UserDto userDto = (UserDto) session.getAttribute("user");
            userService.removeFavourites(userDto, productId);
            return (true);
        }
        return (false);
    }
}

package com.example.Eshop.controllers;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionHandlerController implements ErrorController {

    @RequestMapping("/error")
    public String handleError() {
        //do something like logging
        return "page-not-found";
    }
}

package com.example.Eshop.services.impl;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.User;
import com.example.Eshop.services.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        String usersEmail = authentication.getName();
        User user = userService.findByEmail(usersEmail);

        boolean hasUserRole = authentication.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));
        String userRole = null;
        if (hasUserRole) {
            userRole = "ROLE_ADMIN";
        } else {
            userRole = "ROLE_USER";
        }

        if ("ROLE_ADMIN".equals(userRole)) {
            response.sendRedirect("orders");
        } else {
            response.sendRedirect("products");
        }

    }

}

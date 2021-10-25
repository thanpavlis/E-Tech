package com.example.Eshop.services.impl;

import com.example.Eshop.exceptions.UserIsNotEnabledException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
        if (exception instanceof UserIsNotEnabledException) {
            System.out.println("Forwarding.... account not enabled");
            request.getSession().setAttribute("failureMessage", "UserIsNotEnabledException");
        } else { //if (exception instanceof UsernameNotFoundException)
            System.out.println("Forwarding.... wrong credentials");
            request.getSession().setAttribute("failureMessage", "UsernameNotFoundException");
        }
        response.sendRedirect("login");
    }

}

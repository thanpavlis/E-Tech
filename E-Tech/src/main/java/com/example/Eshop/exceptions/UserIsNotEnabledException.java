package com.example.Eshop.exceptions;

import org.springframework.security.core.AuthenticationException;

public class UserIsNotEnabledException extends AuthenticationException {
    
    public UserIsNotEnabledException(String errorMessage) {
        super(errorMessage);
    }
    
}
package com.example.Eshop.services.impl;

import com.example.Eshop.entities.Role;
import com.example.Eshop.entities.User;
import com.example.Eshop.exceptions.UserIsNotEnabledException;
import com.example.Eshop.repositories.UserRepository;
import com.example.Eshop.services.UserService;
import java.util.ArrayList;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomAuthenticationProviderService implements AuthenticationProvider {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        UsernamePasswordAuthenticationToken authenticationToken = null;
        String email = authentication.getName();
        String password = authentication.getCredentials().toString();
        User user = userRepository.findByEmail(email);
        if (user != null) {
            System.out.println(user.getEnabled());
            if (email.equals(user.getEmail()) && BCrypt.checkpw(password, user.getPassword()) && user.getEnabled()) {
                Collection<GrantedAuthority> grantedAuthorities = getGrantedAuthorities(user);
                authenticationToken = new UsernamePasswordAuthenticationToken(
                        userService.loadUserByUsername(email), password, grantedAuthorities);
            }
            if (!user.getEnabled()) {
                throw (new UserIsNotEnabledException("User's account is not enabled"));
            }
        } else {
            throw (new UsernameNotFoundException("Email " + email + " not found"));
        }
        return (authenticationToken);
    }

    private Collection<GrantedAuthority> getGrantedAuthorities(User user) {
        Collection<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        for (Role role : user.getRoleList()) {
            if (role.getRoleName().equals("ROLE_ADMIN")) {
                grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
            }
            if (role.getRoleName().equals("ROLE_USER")) {
                grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));
            }
        }
        return (grantedAuthorities);
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}

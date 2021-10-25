package com.example.Eshop.config;

import com.example.Eshop.services.impl.CustomAuthenticationProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private AuthenticationSuccessHandler authenticationSuccessHandler;

    @Autowired
    private AuthenticationFailureHandler authenticationFailureHandler;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    private CustomAuthenticationProviderService authenticationProviderService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProviderService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers(
                "/",
                "/js/**",
                "/css/**",
                "/images/**",
                "/fonts/**",
                "/register",
                "/process-register-form",
                "/forgot-password**",
                "/reset_password**",
                "/api/cart/**",
                "/error",
                "/products**",
                "/product-page**",
                "/checkIfUserIsLoggedIn",
                "/checkIfRoleAdmin",
                "/checkIfEmailAlreadyExists/**",
                "/verify**")
                .permitAll()
                .antMatchers("/add-new-brand/**", "/insert-product", "/new-product", "/edit-product**", "/update-product**", "/product-page/removeComment", "/stock", "/delete-product**", "/orders", "/orders/**", "/delete-order").hasRole("ADMIN")
                .antMatchers("/product-page/**", "/customer-service**").hasAnyRole("ADMIN", "USER")
                .antMatchers("/pay", "/pay/**", "/saveFavourite**", "/removeFavourite**").hasRole("USER")
                .anyRequest().authenticated()
                .and()
                .csrf().disable().cors()
                .and()
                .formLogin()
                .loginPage("/login")
                .usernameParameter("email")
                .passwordParameter("password")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/")
                .successHandler(authenticationSuccessHandler)
                .failureHandler(authenticationFailureHandler)
                .permitAll()
                .and()
                .rememberMe()
                .tokenValiditySeconds(2592000)
                .key("AbcdefghiJklmNoPqRstUvXyz")
                .userDetailsService(userDetailsService)
                .and()
                .logout()
                .invalidateHttpSession(true)
                .clearAuthentication(true)
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/products")
                .permitAll()
                .and().httpBasic();
    }

}

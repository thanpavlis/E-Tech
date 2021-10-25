package com.example.Eshop.services;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.Product;
import com.example.Eshop.entities.Rating;
import com.example.Eshop.entities.User;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.mail.MessagingException;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User saveFavourites(UserDto userDto, int productId);

    void removeFavourites(UserDto userDto, int productId);

    User getUserById(int id);

    List<Product> getFavouriteProducts(int id);

    List<Rating> getUserRatings(int id);

    void save(User user) throws UnsupportedEncodingException, MessagingException;

    User findByEmail(String email);

    boolean verify(String verificationCode);

    boolean updateResetPasswordToken(String token, String email) throws UnsupportedEncodingException, MessagingException;

    User getByResetPasswordToken(String token);

    void updatePassword(User customer, String newPassword);

}

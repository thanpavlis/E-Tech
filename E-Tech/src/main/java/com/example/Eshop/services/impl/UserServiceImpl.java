package com.example.Eshop.services.impl;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.Product;
import com.example.Eshop.entities.Rating;
import com.example.Eshop.entities.Role;
import com.example.Eshop.entities.User;
import com.example.Eshop.repositories.RoleRepository;
import com.example.Eshop.repositories.UserRepository;
import com.example.Eshop.services.ProductService;
import com.example.Eshop.services.UserService;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private EmailSenderService mailSenderService;

    @Autowired
    private HttpSession session;

    @Value("${domain-name}")
    String domainName;

    @Override
    public User getUserById(int id) {
        return userRepository.getById(id);
    }

    @Override
    public User saveFavourites(UserDto userDto, int productId) {
        User user = getUserById(userDto.getId());
        Product product = productService.getProductById(productId);
        for (Product prod : user.getProductList()) {
            if (prod.getId() == productId) {
                return null;
            }
        }
        user.getProductList().add(product);
        product.getUserList().add(user);
        System.out.println("\n\nn\n\n\n\n\n\n\\n\n\\n\n\n\\nnMPIKE");
        return userRepository.save(user);
    }

    @Override
    public void removeFavourites(UserDto userDto, int productId) {
        User user = getUserById(userDto.getId());
        Product product = productService.getProductById(productId);
        List<Product> productList = user.getProductList();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == productId) {
                user.getProductList().remove(i);
                break;
            }
        }
        List<User> users = product.getUserList();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getId() == userDto.getId()) {
                product.getUserList().remove(i);
                break;
            }
        }
        userRepository.saveAndFlush(user);
    }

    @Override
    public List<Product> getFavouriteProducts(int id) {
        User user = userRepository.getById(id);
        try {
            return user.getProductList();
        } catch (Exception ex) {
            System.out.println("\n\n\n\n\n\n" + ex.getLocalizedMessage());
            return null;
        }
    }

    @Override
    public List<Rating> getUserRatings(int id) {
        User user = userRepository.getById(id);
        try {
            return user.getRatingList();
        } catch (Exception ex) {
            System.out.println("\n\n\n\n\n\n" + ex.getLocalizedMessage());
            return null;
        }
    }

    @Override
    public void save(User user) throws UnsupportedEncodingException, MessagingException {
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        Role role = roleRepository.getById(2);
        user.setRoleList(new ArrayList<>());
        user.getRoleList().add(role);
        role.getUserList().add(user);
        String randomCode = RandomString.make(64);
        user.setVerificationCode(randomCode);
        user.setEnabled(false);
        userRepository.save(user);
        mailSenderService.sendVerificationEmail(user, domainName + "/verify?code=" + user.getVerificationCode());
    }

    @Override
    public boolean verify(String verificationCode) {
        User user = userRepository.findByVerificationCode(verificationCode);
        if (user == null || user.getEnabled()) {
            return false;
        } else {
            user.setVerificationCode(null);
            user.setEnabled(true);
            userRepository.save(user);
            return true;
        }
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public boolean updateResetPasswordToken(String token, String email) throws UnsupportedEncodingException, MessagingException {
        User user = userRepository.findByEmail(email);
        if (user != null) {
            user.setResetPasswordToken(token);
            mailSenderService.sendResetEmail(user, domainName + "/reset_password?token=" + token);
            userRepository.save(user);
            return (true);
        }
        return (false);
    }

    @Override
    public User getByResetPasswordToken(String token) {
        return (userRepository.findByResetPasswordToken(token));
    }

    @Override
    public void updatePassword(User customer, String newPassword) {
        String encodedPassword = passwordEncoder.encode(newPassword);
        customer.setPassword(encodedPassword);
        customer.setResetPasswordToken(null);
        userRepository.save(customer);
    }

    private List<GrantedAuthority> convertRolesToGrantedAuthorities(List<Role> roles) {
        List<GrantedAuthority> authorities = new ArrayList();
        for (Role role : roles) {
            GrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
            authorities.add(authority);
        }
        return authorities;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = findByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException("Invalid username");
        }
        List<GrantedAuthority> authorities = convertRolesToGrantedAuthorities(user.getRoleList());
        session.setAttribute("user", new UserDto(user.getId(), user.getEmail(), user.getFirstName(), user.getLastName(), user.getPhone(), authorities.get(0).toString()));
        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), user.getEnabled(), true, true, true, authorities);
    }
}

package com.example.Eshop.controllers;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.User;
import com.example.Eshop.services.UserService;
import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor ste = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, ste);
    }

    @GetMapping("/login")
    public String loginPage(HttpSession session, ModelMap modelMap) {
        if (((UserDto) session.getAttribute("user")) != null) {
            return ("redirect:products");
        }
        if (session.getAttribute("failureMessage") != null) {
            if (session.getAttribute("failureMessage").equals("UserIsNotEnabledException")) {
                modelMap.addAttribute("failureMessage", "Your account is not enabled! Check your email to verify your account.");
            } else if (session.getAttribute("failureMessage").equals("UsernameNotFoundException")) {
                modelMap.addAttribute("failureMessage", "You have entered an invalid username or password!");
            }
            session.removeAttribute("failureMessage");
        }
        return "login";
    }

    @GetMapping("/register")
    public String showForm(HttpSession session, ModelMap modelMap) {
        if (((UserDto) session.getAttribute("user")) != null) {
            return ("redirect:products");
        }
        modelMap.addAttribute("user", new User());
        return ("register");
    }

    @PostMapping("/process-register-form")
    public String processForm(@Valid @ModelAttribute("user") User user, BindingResult theBindingResult,
            @RequestParam(name = "confirmPassword", required = false) String confirmPassword,
            @RequestParam(name = "emailExists", required = false) String emailExists,
            ModelMap modelMap, RedirectAttributes redirectAttributes) throws UnsupportedEncodingException, MessagingException {
        if ("true".equals(emailExists)) {
            modelMap.addAttribute("emailExists", "Email already exists !!");
        }
        if (theBindingResult.hasErrors()) {
            try {
                if (confirmPassword != null && !user.getPassword().equals(confirmPassword)) {
                    modelMap.addAttribute("notMatching", "Not Matching");
                }
            } catch (Exception ex) {
                modelMap.addAttribute("notMatching", "Not Matching");
            }
            return "register";
        }
        if (confirmPassword != null && user.getPassword().equals(confirmPassword) && !"true".equals(emailExists)) {
            userService.save(user);
            redirectAttributes.addFlashAttribute("register", true);
            return "redirect:/login";
        }
        modelMap.addAttribute("notMatching", "Not Matching");
        return "register";
    }

    @GetMapping(value = {"/checkIfEmailAlreadyExists/{email}", "/checkIfEmailAlreadyExists/"})
    @ResponseBody
    public boolean checkIfEmailAlreadyExists(@PathVariable(name = "email", required = false) String email) {
        if (userService.findByEmail(email) != null) {
            return (true);
        }
        return (false);
    }

    @GetMapping("/verify")
    public String verifyUser(@Param("code") String code, ModelMap modelMap) {
        if (userService.verify(code)) {
            modelMap.addAttribute("verification", true);
        } else {
            modelMap.addAttribute("verification", false);
        }
        return "login";
    }

    @PostMapping("/forgot-password")
    @ResponseBody
    public boolean processForgotPassword(@RequestParam("email") String email) throws UnsupportedEncodingException, MessagingException {
        String token = RandomString.make(30);
        return (userService.updateResetPasswordToken(token, email));
    }

    @GetMapping("/reset_password")
    public String showResetPasswordForm(@Param(value = "token") String token, ModelMap modelMap) {
        User user = userService.getByResetPasswordToken(token);
        if (user != null) {
            modelMap.addAttribute("reset_token", token);
        } else {
            modelMap.addAttribute("reset_token", null);
        }
        return ("login");
    }

    @PostMapping("/reset_password")
    @ResponseBody
    public String processResetPassword(@RequestParam("token") String token, @RequestParam("password") String password) {
        User user = userService.getByResetPasswordToken(token);
        if (user != null) {
            userService.updatePassword(user, password);
            return ("true");
        }
        return ("false");
    }
}

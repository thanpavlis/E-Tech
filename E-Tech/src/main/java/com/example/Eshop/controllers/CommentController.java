package com.example.Eshop.controllers;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.Comment;
import com.example.Eshop.services.CommentService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/product-page")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping("/saveComment")
    public String saveComment(HttpSession session, @RequestParam("text") String text, @RequestParam("productId") int productId) {
        if (session.getAttribute("user") != null) {
            UserDto userDto = (UserDto) session.getAttribute("user");
            Comment comment = commentService.setCommentDetails(text, userDto, productId);
            commentService.save(comment);
            return "redirect:/product-page?id=" + productId;
        }
        return "redirect:/login";
    }

    @PostMapping("/removeComment")
    @ResponseBody
    public boolean removeComment(HttpSession session, @RequestParam("commentId") int commentId) {
        if (session.getAttribute("user") != null) {
            commentService.removeComment(commentId);
            return (true);
        }
        return (false);
    }

}

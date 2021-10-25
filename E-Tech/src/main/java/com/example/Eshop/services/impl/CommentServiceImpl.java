package com.example.Eshop.services.impl;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.Comment;
import com.example.Eshop.entities.Product;
import com.example.Eshop.entities.User;
import com.example.Eshop.repositories.CommentRepository;
import com.example.Eshop.services.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;
    
    @Override
    public void save(Comment comment) {
        commentRepository.save(comment);
    } 
    
    @Override
    public Comment setCommentDetails(String text, UserDto userDto, int productId) {
        long millis=System.currentTimeMillis();  
        java.sql.Date date = new java.sql.Date(millis);  
        Comment comment = new Comment(null, text, date);
        User user = new User();
        Product product = new Product(productId);
        user.setId(userDto.getId());
        comment.setUserId(user);
        comment.setProductId(product);
        return (comment);
    }
    
    @Override
    public void removeComment(int commentId) {
        commentRepository.deleteById(commentId);
    }
    
}

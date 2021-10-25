package com.example.Eshop.services;

import com.example.Eshop.dto.UserDto;
import com.example.Eshop.entities.Comment;

public interface CommentService {
    
    void save(Comment comment);
    
    Comment setCommentDetails(String text, UserDto userDto, int productId);
    
    void removeComment(int commentId);
    
}

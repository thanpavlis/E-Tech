package com.example.Eshop.repositories;

import com.example.Eshop.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    User findByEmail(String email);
 
    User findByVerificationCode(String verificationCode);
    
    User findByResetPasswordToken(String resetPasswordToken);
    
}

package com.example.Eshop.services.impl;

import com.example.Eshop.entities.Category;
import com.example.Eshop.repositories.CategoryRepository;
import com.example.Eshop.services.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List<Category> getAllCategories() {
        return (categoryRepository.findAll());
    }

}

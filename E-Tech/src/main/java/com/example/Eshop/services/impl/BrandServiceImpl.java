package com.example.Eshop.services.impl;

import com.example.Eshop.entities.Brand;
import com.example.Eshop.repositories.BrandRepository;
import com.example.Eshop.services.BrandService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class BrandServiceImpl implements BrandService {

    @Autowired
    private BrandRepository brandRepo;

    @Override
    public List<Brand> getAllBrands() {
        return (brandRepo.findAll());
    }

    @Override
    public int insertBrand(Brand brand) {
        return (brandRepo.save(brand).getId());
    }

}

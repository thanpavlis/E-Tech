package com.example.Eshop.services;

import com.example.Eshop.entities.Brand;
import java.util.List;

public interface BrandService {

    List<Brand> getAllBrands();

    int insertBrand(Brand brand);
}

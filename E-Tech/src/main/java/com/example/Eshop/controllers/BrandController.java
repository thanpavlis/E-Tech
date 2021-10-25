package com.example.Eshop.controllers;

import com.example.Eshop.entities.Brand;
import com.example.Eshop.services.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BrandController {

    @Autowired
    private BrandService brandService;

    @PostMapping("/add-new-brand/{brandName}")
    @ResponseBody
    public int addNewBrand(@PathVariable("brandName") String brandName, Model model) {
        return brandService.insertBrand(new Brand(brandName));
    }

}

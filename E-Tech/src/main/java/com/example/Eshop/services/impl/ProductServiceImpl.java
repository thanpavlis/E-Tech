package com.example.Eshop.services.impl;

import com.example.Eshop.dto.CartProductDto;
import com.example.Eshop.entities.Image;
import com.example.Eshop.entities.Product;
import com.example.Eshop.repositories.ProductRepository;
import com.example.Eshop.services.ImageService;
import com.example.Eshop.services.ProductService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ImageService imageService;

    @Override
    public List<Product> getAllProducts() {
        return (productRepository.findAll());
    }

    @Override
    public Product getProductById(int id) {
        if (productRepository.findById(id).isPresent()) {//an yparxei
            return (productRepository.getById(id));
        }
        return (null);
    }

    @Override
    public HashMap<Integer, Product> getProductsByIds(List<Integer> ids) {
        HashMap<Integer, Product> products = new HashMap<>();
        for (Product product : productRepository.findAllById(ids)) {//mapping id->product
            products.put(product.getId(), product);
        }
        return (products);
    }

    @Override
    public List<String> getBrandsPerPage(List<Product> products) {
        List<Integer> productIds = new ArrayList<>();
        for (Product product : products) {
            productIds.add(product.getId());
        }
        List<String> brands = productRepository.getBrandsPerPage(productIds);
        return (brands);
    }

    @Override
    public List<Product> getProductsByCategoryId(String category) {
        List<Product> products;
        switch (category) {
            case "1":
                products = productRepository.findByCategoryId(1);
                break;
            case "2":
                products = productRepository.findByCategoryId(2);
                break;
            case "3":
                products = productRepository.findByCategoryId(3);
                break;
            case "4":
                products = productRepository.findByCategoryId(4);
                break;
            case "5":
                products = productRepository.findByCategoryId(5);
                break;
            case "6":
                products = productRepository.findByCategoryId(6);
                break;
            case "7":
                products = productRepository.findByCategoryId(4);
                products.addAll(productRepository.findByCategoryId(5));
                products.addAll(productRepository.findByCategoryId(6));
                break;
            default:
                products = productRepository.findAll();
        }
        return (products);
    }

    @Override
    public int getMaxPriceByIds(List<Product> products) {
        if (products.size() > 0) {
            List<Integer> productIds = new ArrayList<>();
            for (Product product : products) {
                productIds.add(product.getId());
            }
            return (productRepository.getMaxPriceByIds(productIds));
        }
        return (0);
    }

    @Override
    public List<Product> getPromotions() {
        return (productRepository.getPromotions());
    }

    @Override
    public boolean updateProductStock(CartProductDto p) {
        Product dbProduct = productRepository.findById(p.getId()).get();
        int stock = (dbProduct.getStock() - p.getQuantity() <= 0) ? 0 : (dbProduct.getStock() - p.getQuantity());
        dbProduct.setStock(stock);
        productRepository.saveAndFlush(dbProduct);
        return (true);
    }

    @Override
    public List<Product> getNewArrivals() {
        return (productRepository.findNewArrivals());
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteById(id);
    }

    @Override
    public boolean updateProduct(Product product) {
        Product dbProduct = productRepository.getById(product.getId());
        dbProduct.setName(product.getName());
        dbProduct.setDescription(product.getDescription());
        dbProduct.setPrice(product.getPrice());
        dbProduct.setCategoryId(product.getCategoryId());
        dbProduct.setBrandId(product.getBrandId());
        dbProduct.setStock(product.getStock());
        dbProduct.setDiscount(product.getDiscount());
        dbProduct.setEndDate(product.getEndDate());
        dbProduct.setNewArrival(product.getNewArrival());
        for (Image image : product.getImageList()) {
            if (image.getId() == null && !image.getRemove()) {//nea eikona gia insert sth bash an den thn exei kanei remove
                Image newImage = new Image();
                newImage.setProductId(dbProduct);
                newImage.setUrl(image.getUrl());
                dbProduct.getImageList().add(newImage);
            } else if (image.getRemove()) {//afairesh eikonas an einai apo thn bash
                if (image.getId() != null) {
                    for (int i = 0; i < dbProduct.getImageList().size(); i++) {
                        if (dbProduct.getImageList().get(i).getId().intValue() == image.getId().intValue()) {//briskw thn eikona pou thelw na afairesw
                            imageService.deleteImageUsingId(image.getId());
                            break;
                        }
                    }
                }
            }
        }
        return (productRepository.saveAndFlush(dbProduct).getId() > 0);
    }

    @Override
    public boolean saveNewProduct(Product product) {
        List<Image> images = product.getImageList();//eikones gia insert
        List<Image> filteredImages = new ArrayList<>();//eikones gia insert 
        product.setImageList(null);
        int newProdId = productRepository.save(product).getId();//kanw insert to product kai pairnw to id 
        Product dbProduct = productRepository.getById(newProdId);//xanafernw to product gia na tou settarw tis eikones
        for (int i = 0; i < images.size(); i++) {
            if (!images.get(i).getRemove()) {//an den exei epilexei diagrafh
                filteredImages.add(images.get(i));
                filteredImages.get(filteredImages.size() - 1).setProductId(dbProduct);
            }
        }
        dbProduct.setImageList(filteredImages);
        return (productRepository.saveAndFlush(dbProduct).getId() > 0);
    }

}

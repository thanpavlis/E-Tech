package com.example.Eshop.services;

import com.example.Eshop.dto.CartProductDto;
import com.example.Eshop.entities.Product;
import java.util.HashMap;
import java.util.List;

public interface ProductService {

    List<Product> getAllProducts();

    Product getProductById(int id);

    boolean updateProductStock(CartProductDto p);

    HashMap<Integer, Product> getProductsByIds(List<Integer> ids);

    List<String> getBrandsPerPage(List<Product> products);

    List<Product> getProductsByCategoryId(String category);

    List<Product> getPromotions();

    List<Product> getNewArrivals();

    void deleteProduct(int id);

    int getMaxPriceByIds(List<Product> products);

    boolean updateProduct(Product product);

    boolean saveNewProduct(Product product);
}

package com.example.Eshop.repositories;

import com.example.Eshop.entities.Product;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(value = "SELECT brand.brand_name FROM brand\n"
            + "INNER JOIN product ON brand.id = product.brand_id\n"
            + "WHERE product.id in :ids\n"
            + "GROUP BY brand.brand_name", nativeQuery = true)
    List<String> getBrandsPerPage(@Param("ids") List<Integer> productIds);

    @Query(value = "SELECT * FROM product\n"
            + "WHERE category_id = :id", nativeQuery = true)
    List<Product> findByCategoryId(@Param("id") int categoryId);

    @Query(value = "SELECT * FROM product WHERE end_date >= CURDATE()", nativeQuery = true)
    List<Product> getPromotions();

    @Query(value = "SELECT * FROM product\n"
            + "WHERE new_arrival = 1", nativeQuery = true)
    List<Product> findNewArrivals();

    @Query(value = "select ceil(max(price)) from product where id in :ids", nativeQuery = true)
    int getMaxPriceByIds(@Param("ids") List<Integer> productIds);

}

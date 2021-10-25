package com.example.Eshop.repositories;

import com.example.Eshop.entities.Rating;
import com.example.Eshop.entities.RatingPK;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RatingRepository extends JpaRepository<Rating, RatingPK> {

    @Query(value = "SELECT product_id,ROUND(AVG(rating_num)) FROM rating GROUP BY product_id ORDER BY product_id ASC", nativeQuery = true)
    List<Object[]> findAllProductsAvgRating();

    @Query(value = "SELECT ROUND(AVG(rating_num)) FROM rating WHERE product_id=:id", nativeQuery = true)
    Integer findAvgRatingByProductId(@Param("id") int productId);

}

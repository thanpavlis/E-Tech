package com.example.Eshop.services;

import com.example.Eshop.entities.Rating;
import java.util.Map;

public interface RatingService {

    Map<Integer, String> findAllProductsAvgRating();

    Integer findAvgRatingByProductId(int id);

    void save(Rating rating);

    Rating setRatingDetails(int usersRating, int userId, int productId);

}

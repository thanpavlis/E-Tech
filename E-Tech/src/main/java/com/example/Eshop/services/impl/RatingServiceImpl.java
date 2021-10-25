package com.example.Eshop.services.impl;

import com.example.Eshop.entities.Rating;
import com.example.Eshop.entities.RatingPK;
import com.example.Eshop.repositories.RatingRepository;
import com.example.Eshop.services.RatingService;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class RatingServiceImpl implements RatingService {

    @Autowired
    private RatingRepository ratingRepo;

    @Override
    public Map<Integer, String> findAllProductsAvgRating() {
        List<Object[]> res = ratingRepo.findAllProductsAvgRating();
        Map<Integer, String> prodavg = new HashMap<>();
        res.stream().forEach((row) -> {
            int pid = (Integer) row[0];
            String rating_num = ((BigDecimal) row[1]).toString();
            prodavg.put(pid, rating_num);
        });
        return (prodavg);
    }

    @Override
    public Integer findAvgRatingByProductId(int id) {
        return (ratingRepo.findAvgRatingByProductId(id));
    }

    @Override
    public void save(Rating rating) {
        ratingRepo.save(rating);
    }

    @Override
    public Rating setRatingDetails(int usersRating, int userId, int productId) {
        RatingPK ratingPK = new RatingPK(productId, userId);
        Rating rating = new Rating(ratingPK, usersRating);
        return (rating);
    }

}

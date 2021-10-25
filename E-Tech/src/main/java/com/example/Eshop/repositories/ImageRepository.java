package com.example.Eshop.repositories;

import com.example.Eshop.entities.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface ImageRepository extends JpaRepository<Image, Integer> {

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM image WHERE id= :id", nativeQuery = true)
    void deleteImageUsingId(@Param("id") int imageId);
}

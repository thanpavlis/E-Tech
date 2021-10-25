package com.example.Eshop.services;

import com.example.Eshop.entities.Image;

public interface ImageService {

    Image getImageById(int id);

    boolean updateImage(Image image);

    void deleteImageUsingId(int id);

    void saveImage(Image image);
}

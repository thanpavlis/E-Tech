package com.example.Eshop.services.impl;

import com.example.Eshop.entities.Image;
import com.example.Eshop.repositories.ImageRepository;
import com.example.Eshop.services.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {

    @Autowired
    ImageRepository imageRepository;

    @Override
    public Image getImageById(int id) {
        return (imageRepository.getById(id));
    }

    @Override
    public boolean updateImage(Image image) {
        return (imageRepository.saveAndFlush(image).getId() > 0);
    }

    @Override
    public void deleteImageUsingId(int id) {
        imageRepository.deleteImageUsingId(id);
    }

    @Override
    public void saveImage(Image image) {
        imageRepository.save(image);
    }

}

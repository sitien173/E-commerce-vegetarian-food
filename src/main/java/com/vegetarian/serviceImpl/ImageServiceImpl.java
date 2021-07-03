package com.vegetarian.serviceImpl;

import com.vegetarian.dao.ImageDao;
import com.vegetarian.entity.Image;
import com.vegetarian.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageServiceImpl implements ImageService {
    @Autowired
    private ImageDao imageDao;
    @Override
    public void insert(List<Image> list, int productId) {
        imageDao.insert(list,productId);
    }

    @Override
    public List<Image> getAllImage(int productId) {
        return imageDao.getAllImage(productId);
    }

    @Override
    public boolean update(List<Image> list, int productId) {
        return imageDao.update(list,productId);
    }
}

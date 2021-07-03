package com.vegetarian.dao;

import com.vegetarian.entity.Image;

import java.util.List;

public interface ImageDao {
    void insert(List<Image> list,int productId);
    List<Image> getAllImage(int productId);
    boolean update(List<Image> list,int productId);
}

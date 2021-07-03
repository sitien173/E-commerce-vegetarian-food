package com.vegetarian.dao;

import com.vegetarian.entity.Product;

import java.util.List;

public interface ProductDao {
    int insert(Product product);
    List<Product> getAllProduct(int cateId);
    Product getProduct(int id);
    boolean update(Product product);
    boolean delete(int id);
}

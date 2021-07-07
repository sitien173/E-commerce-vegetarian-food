package com.vegetarian.dao;

import com.vegetarian.entity.Product;

import java.util.LinkedHashMap;
import java.util.List;

public interface ProductDao {
    int insert(Product product);
    List<Product> getAllProduct(int cateId);
    List<Product> getAllProductHighlight();
    List<Product> getAllProductBestSeller();
    List<Product> getAllProductSaleOff();
    List<Product> getProductSearchAjax(String text);
    int totalProduct();
    Product getProduct(int id);
    boolean update(Product product);
    boolean delete(int id);
    void updateQuantity(int quantity,int sold,int productId);
    void updateQuantityProduct(LinkedHashMap<Integer,Integer> list);


}

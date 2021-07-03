package com.vegetarian.service;

import com.vegetarian.entity.Category;

import java.util.List;

public interface CategoryService {
    void insert(Category category);
    List<Category> getAllCategory();
    Category getCategory(int id);
    boolean deleteCategory(int id);
    boolean updateCategory(Category category);
}

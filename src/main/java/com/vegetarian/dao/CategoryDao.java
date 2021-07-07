package com.vegetarian.dao;

import com.vegetarian.entity.Category;

import java.util.List;

public interface CategoryDao {
    void insert(Category categories);
    List<Category> getAllCategory();
    Category getCategory(int id);
    boolean deleteCategory(int id);
    boolean updateCategory(Category category);
    int totalCategories();
}

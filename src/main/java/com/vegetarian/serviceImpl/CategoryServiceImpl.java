package com.vegetarian.serviceImpl;

import com.vegetarian.dao.CategoryDao;
import com.vegetarian.entity.Category;
import com.vegetarian.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryDao categoryDao;
    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public List<Category> getAllCategory() {
        return categoryDao.getAllCategory();
    }

    @Override
    public Category getCategory(int id) {
        return categoryDao.getCategory(id);
    }

    @Override
    public boolean deleteCategory(int id) {
        return categoryDao.deleteCategory(id);
    }

    @Override
    public boolean updateCategory(Category category) {
        return categoryDao.updateCategory(category);
    }
}

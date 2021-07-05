package com.vegetarian.serviceImpl;

import com.vegetarian.dao.ImageDao;
import com.vegetarian.dao.ProductDao;
import com.vegetarian.entity.Product;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;
    @Autowired
    private ImageDao imageDao;

    @Override
    @Transactional(rollbackFor = SQLException.class)
    public void insert(Product product) {
        int key = productDao.insert(product);
        imageDao.insert(product.getImages(),key);
    }

    @Override
    public List<Product> getAllProduct(int cateId) {
        return productDao.getAllProduct(cateId);
    }

    @Override
    public List<Product> getAllProductHighlight() {
        return productDao.getAllProductHighlight();
    }

    @Override
    public List<Product> getAllProductBestSeller() {
        return productDao.getAllProductBestSeller();
    }

    @Override
    public List<Product> getAllProductByCategory(int cateID) {
        return productDao.getAllProduct(cateID);
    }

    @Override
    public Product getProduct(int id) {
        return productDao.getProduct(id);
    }

    @Override
    @Transactional(rollbackFor = SQLException.class)
    public boolean update(Product product) {
        // update product
        boolean check = productDao.update(product);
        // update image
       if(check)  check = imageDao.update(product.getImages(),product.getId());
       return check;
    }

    @Override
    public boolean delete(int id) {
        return productDao.delete(id);
    }
}

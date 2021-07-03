package com.vegetarian.api.admin;

import com.google.gson.Gson;
import com.vegetarian.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/api/categories")
public class AdminCategoriesManager {
    @Autowired
    private CategoryService categoryService;
    @RequestMapping(value = "/list",
            method = RequestMethod.GET,
            produces = "text/plain;charset=UTF-8")
    private String getAllCategory(){
        return new Gson().toJson(categoryService.getAllCategory());
    }

    @DeleteMapping("/delete/{id}")
    private ResponseEntity<?> edit(@PathVariable("id") int id){
        return categoryService.deleteCategory(id) ? ResponseEntity.ok().build() : ResponseEntity.badRequest().build();
    }
}

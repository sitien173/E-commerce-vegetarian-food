package com.vegetarian.controller.user;

import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/categories")
public class CategoryController {
    @Autowired
    private ProductService productService;
    @GetMapping(value = {"/{cateId}"})
    public String showViewCategory(@PathVariable("cateId") int cateId, Model model){
        model.addAttribute("products",productService.getAllProduct(cateId));
        return "category";
    }
}

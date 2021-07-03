package com.vegetarian.controller.admin;

import com.vegetarian.entity.Category;
import com.vegetarian.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/categories")
public class AdminCategoriesController {
    @Autowired
    private CategoryService categoryService;
    //    =========================== GET ================================
    @GetMapping("/list")
    private String showViewCategories(){
        return "admin/category_list";
    }

    @GetMapping("/add")
    private String showViewAdd(Model model){
        if(!model.containsAttribute("category")){
            model.addAttribute("category",new Category());
        }
        return "admin/category_add";
    }
    @GetMapping("/edit/{id}")
    private String edit(@PathVariable("id") int id,Model model){
        if(!model.containsAttribute("category")){
            model.addAttribute("category",categoryService.getCategory(id));
        }
        return "admin/category_edit";
    }

//    =========================== POST ================================


    @PostMapping("/add")
    private String add(@Valid @ModelAttribute("category") Category category,
                       BindingResult result,
                       Model model){
        if(result.hasErrors()) return "admin/category_add";
        categoryService.insert(category);
        model.addAttribute("info","add category success");
        return "admin/category_add";
    }
    @PostMapping("/edit")
    private String edit(@Valid @ModelAttribute("category") Category category,
                        BindingResult result,
                        Model model){
        if(result.hasErrors()) return "admin/category_edit";
        if(categoryService.updateCategory(category)){
            model.addAttribute("info","update success");
        }
        return "admin/category_edit";
    }
}

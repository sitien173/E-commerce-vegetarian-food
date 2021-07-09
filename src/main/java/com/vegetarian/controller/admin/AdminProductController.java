package com.vegetarian.controller.admin;

import com.vegetarian.entity.Image;
import com.vegetarian.entity.Product;
import com.vegetarian.service.CategoryService;
import com.vegetarian.service.ImageService;
import com.vegetarian.service.ProductService;
import com.vegetarian.serviceImpl.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private FileService fileService;

    @GetMapping("/list")
    private String showViewProduct(){
        return "admin/product_list";
    }

    @GetMapping("/add")
    private String showViewAddProduct(Model model){
        if(!model.containsAttribute("product")){
            model.addAttribute("product",new Product());
        }
        return "admin/product_add";
    }
    @GetMapping("/edit/{id}")
    private String showViewAddProduct(@PathVariable("id") int id, Model model){
        if(!model.containsAttribute("product")){
            model.addAttribute("product",productService.getProduct(id));
            model.addAttribute("listCategories",categoryService.getAllCategory());
            model.addAttribute("listImage", imageService.getAllImage(id));
        }
        return "admin/product_edit";
    }



    @RequestMapping(value = "/add",
                    method = RequestMethod.POST,
                    produces = "text/plain;charset=UTF-8",
                     consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    private String add(@Valid @ModelAttribute("product") Product product,
                       BindingResult result,
                       @RequestParam("file")MultipartFile[] files,
                       Model model){
        if(result.hasErrors()) return "admin/product_add";
        List<Image> imageList = new ArrayList<>();
        for(MultipartFile file : files){
            fileService.save(file);
            imageList.add(new Image("/disk/resources/img/upload/"+file.getOriginalFilename()));
        }
        product.setImages(imageList);
        productService.insert(product);
        model.addAttribute("listCategories",categoryService.getAllCategory());
        model.addAttribute("info","add product success");
        return "admin/product_add";
    }

    @RequestMapping(value = "/edit",
            method = RequestMethod.POST,
            produces = "text/plain;charset=UTF-8",
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    private String editForm(@Valid @ModelAttribute("product") Product product,
                       BindingResult result,
                       @RequestParam("file")MultipartFile[] files,
                       Model model){
        if(result.hasErrors()) return "admin/product_edit";
        List<Image> imageList = new ArrayList<>();
        for(MultipartFile file : files){
            fileService.save(file);
            imageList.add(new Image("/disk/resources/img/upload/"+file.getOriginalFilename()));
        }
        product.setImages(imageList);
        if(productService.update(product)){
            model.addAttribute("info","update product success");
        }
        return "admin/product_edit";
    }
}

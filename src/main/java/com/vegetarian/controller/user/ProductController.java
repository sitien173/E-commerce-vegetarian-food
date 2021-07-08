package com.vegetarian.controller.user;

import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @GetMapping("/{productId}")
    public String showViewProductInfo(@PathVariable("productId") int productId,
                                      @RequestParam(value = "messenger",required = false) String messenger,
                                      Model model){
        if(!model.containsAttribute("product")){
            if(messenger != null) model.addAttribute("info",messenger);
            model.addAttribute("product",productService.getProduct(productId));
        }
        return "product_info";
    }
}

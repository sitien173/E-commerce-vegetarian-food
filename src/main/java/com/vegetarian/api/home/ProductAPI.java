package com.vegetarian.api.home;

import com.google.gson.Gson;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/product")
public class ProductAPI {
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/highlight",
                    produces = "text/plain;charset=UTF-8",
                    method = RequestMethod.GET)
    public String getAllProductHighlight(){
        return new Gson().toJson(productService.getAllProductHighlight());
    }
    @RequestMapping(value = "/best-seller",
            produces = "text/plain;charset=UTF-8",
            method = RequestMethod.GET)
    public String getAllProductBestSeller(){
        return new Gson().toJson(productService.getAllProductBestSeller());
    }
    @RequestMapping(value = "/cate/{cateId}",
            produces = "text/plain;charset=UTF-8",
            method = RequestMethod.GET)
    public String getAllProductByCategory(@PathVariable("cateId") int cateId){
        return new Gson().toJson(productService.getAllProduct(cateId));
    }
}

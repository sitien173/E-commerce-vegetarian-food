package com.vegetarian.api.admin;

import com.google.gson.Gson;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/api/product")
public class AdminProductManager {
    @Autowired
    private ProductService productService;
    @RequestMapping(value = "/{cateId}",
                    method = RequestMethod.GET,
                    produces = "text/plain;charset=UTF-8")
    public String getAllProductByCategory(@PathVariable("cateId") int cateId){
        return new Gson().toJson(productService.getAllProduct(cateId));
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") int id,
                                    Model model){
        if(productService.delete(id)){
            model.addAttribute("info","delete success");
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().build();
    }
    @GetMapping("/total")
    public int getTotal(){
        return productService.totalProduct();
    }
}

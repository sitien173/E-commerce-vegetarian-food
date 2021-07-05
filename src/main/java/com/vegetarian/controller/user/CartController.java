package com.vegetarian.controller.user;

import com.vegetarian.entity.Invoice;
import com.vegetarian.entity.Item;
import com.vegetarian.entity.Product;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private ProductService productService;
    @GetMapping(value = {"","/"})
    private String showViewCart(){
        return "cart";
    }
    private void addNewItem(Item item,int productId,int quantity){
        Product product = productService.getProduct(productId);
        item.setProduct(product);
        item.setSubTotal((double) (product.getSalePrice() > 0.0 ? product.getSalePrice():product.getPrice()));
        item.setQuantity(quantity);
    }
    private void updateTotal(Invoice invoice){
        Double totalItem = invoice.getItems().stream().mapToDouble(Item::getSubTotal).sum();
        invoice.setSubTotal(totalItem);
        invoice.setTotal(totalItem);
    }
    @GetMapping("/addToCart/{productId}/{quantity}")
    @ResponseBody
    public ResponseEntity<?> addToCart(@PathVariable("productId") int productId,
                                       @PathVariable("quantity") int quantity,
                                       HttpSession session){
        Invoice invoice;
        if(session.getAttribute("invoice") == null){
            invoice = new Invoice();
            Item item = new Item();
            addNewItem(item,productId,quantity);
            invoice.getItems().add(item);
        }else{
            invoice = (Invoice) session.getAttribute("invoice");
            for (int i=0;i<invoice.getItems().size();i++){
                if(invoice.getItems().get(i).getProduct().getId() == productId){
                    invoice.getItems().get(i).setQuantity(invoice.getItems().get(i).getQuantity() + quantity);
                    invoice.getItems().get(i)
                            .setSubTotal((double) (invoice.getItems().get(i).getProduct().getSalePrice() > 0
                                    ? invoice.getItems().get(i).getQuantity()*invoice.getItems().get(i).getProduct().getSalePrice()
                                    : invoice.getItems().get(i).getQuantity()*invoice.getItems().get(i).getProduct().getPrice()));
                    updateTotal(invoice);
                    session.setAttribute("invoice",invoice);
                    return ResponseEntity.ok().build();
                }
            }
            Item item = new Item();
            addNewItem(item,productId,quantity);
            invoice.getItems().add(item);
        }
        updateTotal(invoice);
        session.setAttribute("invoice",invoice);
        return ResponseEntity.ok().build();
    }


    @DeleteMapping("/delete/{productId}")
    public ResponseEntity<?> deleteItem(@PathVariable("productId") int productId,
                                        @SessionAttribute("invoice") Invoice invoice){
        if(invoice.getItems().removeIf(item -> item.getProduct().getId() == productId)){
           updateTotal(invoice);
            return ResponseEntity.ok().build();
        } else return ResponseEntity.badRequest().build();
    }
    @GetMapping("/updateCart")
    public ResponseEntity<?> updateCart(@RequestParam("productId") int productId,
                                        @RequestParam("quantity") int quantity,
                                        @SessionAttribute("invoice") Invoice invoice){
       invoice.getItems().removeIf(item -> item.getQuantity() == 0);
       invoice.getItems().forEach(item -> {
                   if(item.getProduct().getId() == productId){
                       item.setQuantity(quantity);
                       item.setSubTotal((double) (item.getProduct().getSalePrice() > 0 ?
                               item.getProduct().getSalePrice()*quantity :
                               item.getProduct().getPrice()*quantity));
                   };
               });
       updateTotal(invoice);
       return ResponseEntity.ok().build();
    }
}

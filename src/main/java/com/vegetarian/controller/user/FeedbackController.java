package com.vegetarian.controller.user;

import com.vegetarian.entity.Feedback;
import com.vegetarian.entity.User;
import com.vegetarian.service.FeedbackService;
import com.vegetarian.service.InvoiceService;
import com.vegetarian.service.ProductService;
import com.vegetarian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequestMapping("/user/feedback")
public class FeedbackController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private FeedbackService feedbackService;
    @Autowired
    private InvoiceService invoiceService;
    @PostMapping(value = "/add",produces = "text/plain;charset=UTF-8")
    public String addFeedback(Principal principal,
                              @RequestParam("productId") int productId,
                              @RequestParam("rating") int rating,
                              @RequestParam("description") String description,
                              Model model){
        if(!invoiceService.checkUserPurchase(principal.getName(),productId)){
            model.addAttribute("messenger","Bạn chưa mua sản phẩm này");
            return "redirect:/product/"+productId;
        }
        Feedback feedback = new Feedback();
        feedback.setUser(userService.getUserByUserName(principal.getName()));
        feedback.setProduct(productService.getProduct(productId));
        feedback.setRated(rating);
        feedback.setComment(description);
        if(feedbackService.insert(feedback)) model.addAttribute("messenger","Gửi phản hồi thành công");
        else model.addAttribute("messenger","Gửi phản hồi thất bại");
        return "redirect:/product/" + productId;
    }
}

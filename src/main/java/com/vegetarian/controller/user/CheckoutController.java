package com.vegetarian.controller.user;

import com.vegetarian.entity.Invoice;
import com.vegetarian.entity.Product;
import com.vegetarian.service.InvoiceService;
import com.vegetarian.service.ProductService;
import com.vegetarian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.concurrent.atomic.AtomicBoolean;

@Controller
@RequestMapping("/user/checkout")
public class CheckoutController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private InvoiceService invoiceService;

    @GetMapping(value = {"","/"})
    public String showViewCheckout(Model model, @SessionAttribute(value = "invoice") Invoice invoice, Principal principal){
        invoice.setUser(userService.getUserByUserName(principal.getName()));
        model.addAttribute("invoice",invoice);
        return "user/checkout";
    }
    @RequestMapping(value = {"","/"},method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
    public String add(@Valid @ModelAttribute("invoice") Invoice invoice,
                      BindingResult result,
                      @RequestParam("checkoutMethod") String payMethod,
                      @SessionAttribute("invoice") Invoice invoice1,
                      HttpSession session,
                      Model model){
        if(result.hasErrors()) return "user/checkout";
        invoice.setPayMethod(payMethod);
        invoice.setItems(invoice1.getItems());
        AtomicBoolean check = new AtomicBoolean(true);
        invoice.getItems().forEach(item -> {
            Product product = productService.getProduct(item.getProduct().getId());
           if(product.getQuantity() < item.getQuantity()){
               check.set(false);
               model.addAttribute("info",String.format("Sản phẩm %s hiện còn %s sản phẩm",item.getProduct().getName(),product.getQuantity()));
               return;
           }});
        if(!check.get() || invoice1.getItems().size() <= 0) return "cart";
       int invoiceID = invoiceService.insertInvoice(invoice);
       model.addAttribute("info",String.format("Đặt hàng thành công: Mã đơn hàng %s Ngày tạo %s",invoiceID, LocalDateTime.now()));
       session.removeAttribute("invoice");
       return "user/invoice_info";
    }

}

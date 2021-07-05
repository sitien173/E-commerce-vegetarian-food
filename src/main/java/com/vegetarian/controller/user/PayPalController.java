package com.vegetarian.controller.user;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.vegetarian.entity.Invoice;
import com.vegetarian.entity.Product;
import com.vegetarian.service.InvoiceService;
import com.vegetarian.service.PayPalService;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.concurrent.atomic.AtomicBoolean;

@Controller
@RequestMapping("/user/payPal")
public class PayPalController {
    @Autowired
    private PayPalService paypalService;
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/checkout",
            method = RequestMethod.POST,
            produces = "text/plain;charset=UTF-8")
    public String payPalCheckout(@ModelAttribute("invoice") com.vegetarian.entity.Invoice invoice,
                                 HttpServletRequest request) {
        String successURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/user/payPal/review_payPal";
        String cancelURL =  request.getScheme() + "://"  + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/user/checkout/";
        String approvalLink = null;
        invoice.setPayMethod(request.getParameter("checkoutMethod"));
        Invoice iv = (Invoice) request.getSession().getAttribute("invoice");
        invoice.setItems(iv.getItems());
        try {
            approvalLink = paypalService.authorizePayment(invoice,successURL,cancelURL);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        return "redirect:" + approvalLink;
    }
    @GetMapping(value = "/review_payPal",produces = "text/plain;charset=UTF-8")
    public String reviewPayPal(@RequestParam("paymentId") String paymentId,
                               @RequestParam("PayerID") String PayerID,
                               Model model){
        try {
            Payment payment = paypalService.getPaymentDetail(paymentId);
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
            model.addAttribute("payer",payerInfo);
            model.addAttribute("transaction",transaction);
            model.addAttribute("shippingAddress",shippingAddress);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        return "user/review_payPal";
    }
    @GetMapping(value = "/review_payPal/checkout",produces = "text/plain;charset=UTF-8")
    public String getPayment(@RequestParam("paymentId") String paymentId,
                             @RequestParam("PayerID") String payerID,
                             @SessionAttribute("invoice") Invoice invoice,
                             Model model,
                             HttpSession session,
                             @SessionAttribute("invoice") Invoice invoice1) throws PayPalRESTException {
        invoice.setPayMethod("PAYPAL");
        AtomicBoolean check = new AtomicBoolean(true);
        invoice.getItems().forEach(item -> {
            Product product = productService.getProduct(item.getProduct().getId());
            if(product.getQuantity() < item.getQuantity()){
                check.set(false);
                model.addAttribute("info",String.format("Sản phẩm %s hiện còn %s sản phẩm",item.getProduct().getName(),product.getQuantity()));
                return;
            }});
        if(!check.get() || invoice1.getItems().size() <= 0) return "cart";
        int key = invoiceService.insertInvoice(invoice);
        if(key > 0){
            model.addAttribute("info",String.format("Đặt hàng thành công. Mã đơn hàng %s Ngày tạo %s",key, LocalDateTime.now()));
            session.removeAttribute("invoice");
        }else {
            model.addAttribute("info","Đặt hàng thất bại");
            return "cart";
        }
        return "redirect:/user/invoice/info";
    }
}
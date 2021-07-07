package com.vegetarian.api.admin;

import com.google.gson.Gson;
import com.vegetarian.entity.Invoice;
import com.vegetarian.entity.User;
import com.vegetarian.service.InvoiceService;
import com.vegetarian.service.ProductService;
import com.vegetarian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.method.P;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping("/admin/api/invoice")
public class AdminInvoiceManager {
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private UserService userService;
    @RequestMapping(value = {"","/"},method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
    public String getAllInvoice(){
        return new Gson().toJson(invoiceService.getAllInvoice());
    }
    @RequestMapping(value = "/list/{status}",method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
    public String getAllInvoice(@PathVariable("status") int status){
        return new Gson().toJson(invoiceService.getAllInvoiceByStatus(status));
    }
    @PostMapping(value = "/updateStatus/{id}/{status}")
    public ResponseEntity<?> updateStatus(@PathVariable("id") int id,@PathVariable("status") int status){
        if(invoiceService.updateStatus(status,id)) return ResponseEntity.ok().build();
        else return ResponseEntity.badRequest().build();
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteInvoice(@PathVariable("id") int id){
        if(invoiceService.delete(id)) return ResponseEntity.ok().build();
        else return ResponseEntity.badRequest().build();
    }
    @GetMapping("/total")
    public int getTotal(){
        return invoiceService.totalInvoice();
    }
    // get invoice realtime
    @RequestMapping(value = "/recently",method = RequestMethod.GET)
    public String getOrderRecently(){
        return new Gson().toJson(invoiceService.getTop10Recently());
    }
    // revenue
    @GetMapping("/total/{path}")
    public Double getTotalRevenue(@PathVariable String path){
        switch (path){
            case "revenue": {
                return invoiceService.getRevenue();
            }
            case "cod": {
                return invoiceService.getRevenueMethod("COD");
            }
            case "banking": {
                return invoiceService.getRevenueMethod("PAYPAL");
            }
        }
        return 0.0;
    }
    private String getMonth(int month){
        String monthTxt = null;
        switch (month){
            case 1: {
                monthTxt = "January";
                break;
            }
            case 2: {
                monthTxt = "February";
                break;
            }
            case 3: {
                monthTxt = "March";
                break;
            }
            case 4: {
                monthTxt = "April";
                break;
            }
            case 5: {
                monthTxt = "May";
                break;
            }
            case 6: {
                monthTxt = "June";
                break;
            }
            case 7: {
                monthTxt = "July";
                break;
            }
            case 8: {
                monthTxt = "August";
                break;
            }
            case 9 : {
                monthTxt = "September";
                break;
            }
            case 10 : {
                monthTxt = "October";
                break;
            }
            case 11: {
                monthTxt = "November";
                break;
            }
            case 12: {
                monthTxt = "December";
                break;
            }
        }
        return monthTxt;
    }
    // get top 10 highest billing
    @GetMapping(value = "/top10",produces = "text/plain;charset=UTF-8")
    public String getTop10(){
        return new Gson().toJson(invoiceService.getTop10());
    }

    // get top 10 user invoice
    @GetMapping(value = "/top10BestTotal",produces = "text/plain;charset=UTF-8")
    public String getTop10UserTotalHighest(){
        LinkedHashMap<String,Double> lhm = invoiceService.getTotalMoneyUsers();
        List<User> users = new ArrayList<>();
        List<Double> totalMoney = new ArrayList<>();
        lhm.forEach((key,val) -> {
            users.add(userService.getUserByUserName(key));
            totalMoney.add(val);
        });
        Object[] objects = new Object[]{users, totalMoney};
        return new Gson().toJson(objects);
    }

    @GetMapping("/revenue/{month}/{payMethod}")
    public Double getRevenueByMonth(@PathVariable("month") int month,@PathVariable("payMethod") String payMethod){
        return invoiceService.getRevenueMethod(getMonth(month),payMethod);
    }

    @GetMapping("/revenue/{month}")
    public Double getRevenueByMonth(@PathVariable int month){
        return invoiceService.getRevenueByMonth(getMonth(month));
    }
}

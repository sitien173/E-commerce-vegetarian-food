package com.vegetarian.api.admin;

import com.google.gson.Gson;
import com.vegetarian.entity.Invoice;
import com.vegetarian.service.InvoiceService;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.method.P;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;

@RestController
@RequestMapping("/admin/api/invoice")
public class AdminInvoiceManager {
    @Autowired
    private InvoiceService invoiceService;

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
}

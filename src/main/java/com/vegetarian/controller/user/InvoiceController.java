package com.vegetarian.controller.user;

import com.vegetarian.entity.Invoice;
import com.vegetarian.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user/invoice")
public class InvoiceController {
    @Autowired
    private InvoiceService invoiceService;
    @GetMapping("/info")
    public String showViewInfo(){
        return "user/invoice_info";
    }
    @RequestMapping(value = "/updateStatus/{id}/{stt}",
            method = RequestMethod.GET,
            produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public ResponseEntity<?> UpdateStatus(@PathVariable("id") int id, @PathVariable("stt") int stt){
        Invoice invoice = invoiceService.getInvoice(id);
        invoice.setStatus(stt);
        if(invoiceService.updateQuantityProduct(invoice)) return ResponseEntity.ok().build();
        return ResponseEntity.badRequest().build();
    }
}

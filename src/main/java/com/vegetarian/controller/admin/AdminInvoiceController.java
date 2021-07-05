package com.vegetarian.controller.admin;

import com.vegetarian.entity.Invoice;
import com.vegetarian.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/invoice")
public class AdminInvoiceController {
    @Autowired
    private InvoiceService invoiceService;
    @GetMapping(value = "/list")
    public String showViewInvoiceList(){
        return "admin/invoice_list";
    }
    @RequestMapping(value = "/info/{id}",produces = "text/plain;charset=UTF-8")
    public String showInfo(Model model, @PathVariable("id") int id){
        model.addAttribute("orderInfo",invoiceService.getInvoice(id));
        return "admin/invoice_info";
    }
    @RequestMapping(value = "/edit/{id}",produces = "text/plain;charset=UTF-8")
    public String showFormEdit(@PathVariable("id") int id,Model model){
        model.addAttribute("invoice",invoiceService.getInvoice(id));
        return "admin/invoice_edit";
    }
    @RequestMapping(value = "/update",method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
    public String updateOrder(@Valid @ModelAttribute Invoice invoice, BindingResult result,Model model) {
        if(result.hasErrors()) return "admin/invoice_edit";
        if(invoiceService.update(invoice)){
            model.addAttribute("info","Cập nhật thành công");
        }else  model.addAttribute("info","Cập nhật thất bại");
        return "redirect:/admin/invoice/edit/"+invoice.getId();
    }
}

package com.vegetarian.controller.admin;

import com.vegetarian.entity.Invoice;
import com.vegetarian.service.InvoiceService;
import com.vegetarian.ultil.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;

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

    @GetMapping("/revenue/export/excel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=revenue_" + LocalDateTime.now().toString() + ".xlsx";
        response.setHeader(headerKey, headerValue);
        // 3 đã giao hàng
        List<Invoice> invoiceList = invoiceService.getAllInvoiceByStatus(3);
        ExcelUtils excelExporter = new ExcelUtils(invoiceList);
        excelExporter.export(response);
    }
    private String getMonthTxt(int month){
       String  monthtxt = "";
        switch (month) {
            case 1:{
                monthtxt = "January";
                break;
            }case 2:{
                monthtxt = "Ferbuary";
                break;
            }
            case 3:{
                monthtxt = "March";
                break;
            }
            case 4:{
                monthtxt = "April";
                break;
            }
            case 5:{
                monthtxt = "May";
                break;
            }
            case 6:{
                monthtxt = "June";
                break;
            }
            case 7:{
                monthtxt = "July";
                break;
            }
            case 8:{
                monthtxt = "August";
                break;
            }
            case 9:{
                monthtxt = "September";
                break;
            }
            case 10:{
                monthtxt = "October";
                break;
            }
            case 11:{
                monthtxt = "November";
                break;
            }
            case 12:{
                monthtxt = "December";
                break;
            }default : monthtxt = "January";
        }
        return monthtxt;
    }
    @GetMapping("/revenue/export/excel/month/{month}")
    public void exportToExcelMonth(@PathVariable("month") int month, HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=revenue_month" + getMonthTxt(month) + ".xlsx";
        response.setHeader(headerKey, headerValue);
        // 3 đã giao hàng
        List<Invoice> invoiceList = invoiceService.getAllRevenueByMonth(getMonthTxt(month));
        ExcelUtils excelExporter = new ExcelUtils(invoiceList);
        excelExporter.export(response);
    }
}

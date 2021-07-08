package com.vegetarian.api.user;

import com.google.gson.Gson;
import com.vegetarian.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@RequestMapping("/user/api/invoice")
public class InvoiceAPI {
    @Autowired
    private InvoiceService invoiceService;

    @RequestMapping(value = "/{id}",
            method = RequestMethod.GET,
            produces = "text/plain;charset=UTF-8")
    public String getAllInvoiceById(@PathVariable("id") int id) {
        return new Gson().toJson(invoiceService.getInvoice(id));
    }

    @RequestMapping(value = "/list",
            method = RequestMethod.GET,
            produces = "text/plain;charset=UTF-8")
    public String getAllInvoiceByUsername(Principal principal) {
        return new Gson().toJson(invoiceService.getAllInvoiceByUsername(principal.getName()));
    }

    @RequestMapping(value = "/list/{status}",
            method = RequestMethod.GET,
            produces = "text/plain;charset=UTF-8")
    public String getAllInvoiceByUsernameAndStatus(@PathVariable("status") int status, Principal principal) {
        return new Gson().toJson(invoiceService.getAllInvoiceByStatus(status, principal.getName()));
    }
}

package com.vegetarian.service;

import com.vegetarian.entity.Invoice;

import java.util.LinkedHashMap;
import java.util.List;

public interface InvoiceService {
    int insertInvoice(Invoice invoice);
    List<Invoice> getAllInvoice();
    List<Invoice> getAllInvoiceByStatus(int status);
    List<Invoice> getAllInvoiceByStatus(int status,String username);
    List<Invoice> getAllInvoiceByUsername(String username);
    boolean updateStatus(int status,int invoiceId);
    Invoice getInvoice(int invoiceId);
    boolean delete(int id);
    boolean update(Invoice invoice);
    boolean updateQuantityProduct(Invoice invoice);
    int totalInvoice();
    Double getRevenue();
    Double getRevenueByMonth(String month);
    Double getRevenueMethod(String month,String payMethod);
    Double getRevenueMethod(String payMethod);
    List<Invoice> getTop10();
    LinkedHashMap<String,Double> getTotalMoneyUsers();
    List<Invoice> getTop10Recently();
}

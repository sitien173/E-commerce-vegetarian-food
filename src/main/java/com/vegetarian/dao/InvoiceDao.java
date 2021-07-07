package com.vegetarian.dao;

import com.vegetarian.entity.Invoice;

import java.util.LinkedHashMap;
import java.util.List;

public interface InvoiceDao {
    int insertInvoice(Invoice invoice);
    Invoice getInvoice(int invoiceId);
    List<Invoice> getAllInvoice();
    List<Invoice> getAllInvoiceByStatus(int status);
    List<Invoice> getAllInvoiceByStatus(int status,String username);
    List<Invoice> getAllInvoiceByUsername(String username);
    Double getRevenue();
    Double getRevenueByMonth(String month);
    Double getRevenueMethod(String month,String payMethod);
    Double getRevenueMethod(String payMethod);
    List<Invoice> getTop10();
    LinkedHashMap<String,Double> getTotalMoneyUsers();
    List<Invoice> getTop10Recently();
    int totalInvoice();
    boolean updateStatus(int status,int invoiceId);
    boolean delete(int id);
    boolean update(Invoice invoice);
}

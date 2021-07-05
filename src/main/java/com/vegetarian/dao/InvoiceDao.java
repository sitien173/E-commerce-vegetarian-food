package com.vegetarian.dao;

import com.vegetarian.entity.Invoice;

import java.util.List;

public interface InvoiceDao {
    int insertInvoice(Invoice invoice);
    Invoice getInvoice(int invoiceId);
    List<Invoice> getAllInvoice();
    List<Invoice> getAllInvoiceByStatus(int status);
    List<Invoice> getAllInvoiceByStatus(int status,String username);
    List<Invoice> getAllInvoiceByUsername(String username);
    boolean updateStatus(int status,int invoiceId);
    boolean delete(int id);
    boolean update(Invoice invoice);
}

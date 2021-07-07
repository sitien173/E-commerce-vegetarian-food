package com.vegetarian.serviceImpl;

import com.vegetarian.dao.InvoiceDao;
import com.vegetarian.dao.ItemDao;
import com.vegetarian.dao.ProductDao;
import com.vegetarian.entity.Invoice;
import com.vegetarian.service.InvoiceService;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
@Service
public class InvoiceServiceImpl implements InvoiceService {
    @Autowired
    private InvoiceDao invoiceDao;
    @Autowired
    private ItemDao itemDao;
    @Autowired
    private ProductDao productDao;
    @Override
    @Transactional(rollbackFor = SQLException.class)
    public int insertInvoice(Invoice invoice) {
        int key =  invoiceDao.insertInvoice(invoice);
        itemDao.insertItem(invoice.getItems(),key);
        // update quantity product and sold
        invoice.getItems().forEach(item -> productDao.updateQuantity(item.getProduct().getQuantity()-item.getQuantity(),item.getProduct().getSold() + item.getQuantity(),item.getProduct().getId()));
        return key;
    }

    @Override
    public List<Invoice> getAllInvoice() {
        return invoiceDao.getAllInvoice();
    }

    @Override
    public List<Invoice> getAllInvoiceByStatus(int status, String username) {
        return invoiceDao.getAllInvoiceByStatus(status,username);
    }

    @Override
    public boolean update(Invoice invoice) {
        return invoiceDao.update(invoice);
    }

    @Override
    @Transactional(rollbackFor = SQLException.class)
    public boolean updateQuantityProduct(Invoice invoice) {
        if(invoice.getStatus() == 5) {
            LinkedHashMap<Integer,Integer> lhm = new LinkedHashMap<>();
            invoice.getItems().forEach(item ->  lhm.put(item.getProduct().getId(),item.getQuantity() + item.getProduct().getQuantity()));
             productDao.updateQuantityProduct(lhm);
        }
        return invoiceDao.update(invoice);
    }

    @Override
    public boolean delete(int id) {
        return invoiceDao.delete(id);
    }

    @Override
    public boolean updateStatus(int status, int invoiceId) {
        return invoiceDao.updateStatus(status,invoiceId);
    }

    @Override
    public List<Invoice> getAllInvoiceByStatus(int status) {
        return invoiceDao.getAllInvoiceByStatus(status);
    }

    @Override
    public Invoice getInvoice(int invoiceId) {
        return invoiceDao.getInvoice(invoiceId);
    }

    @Override
    public List<Invoice> getAllInvoiceByUsername(String username) {
        return invoiceDao.getAllInvoiceByUsername(username);
    }

    @Override
    public int totalInvoice() {
        return invoiceDao.totalInvoice();
    }

    @Override
    public Double getRevenue() {
        return invoiceDao.getRevenue();
    }

    @Override
    public Double getRevenueByMonth(String month) {
        return invoiceDao.getRevenueByMonth(month);
    }

    @Override
    public Double getRevenueMethod(String month, String payMethod) {
        return invoiceDao.getRevenueMethod(month,payMethod);
    }

    @Override
    public Double getRevenueMethod(String payMethod) {
        return invoiceDao.getRevenueMethod(payMethod);
    }

    @Override
    public List<Invoice> getTop10() {
        return invoiceDao.getTop10();
    }

    @Override
    public LinkedHashMap<String, Double> getTotalMoneyUsers() {
        return invoiceDao.getTotalMoneyUsers();
    }

    @Override
    public List<Invoice> getTop10Recently() {
        return invoiceDao.getTop10Recently();
    }
}

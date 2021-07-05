package com.vegetarian.dao;

import com.vegetarian.entity.Item;

import java.util.List;

public interface ItemDao {
    void insertItem(List<Item> items,int invoiceId);
    List<Item> getAllItemByInvoiceId(int invoiceId);
}

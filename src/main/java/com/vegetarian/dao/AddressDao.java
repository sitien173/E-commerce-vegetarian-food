package com.vegetarian.dao;

import com.vegetarian.entity.Address;

import java.util.List;

public interface AddressDao {
    Address getAddressByUsername(String username);
    void insertAddress(Address address,String username);
}

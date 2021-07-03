package com.vegetarian.service;

import com.vegetarian.entity.Address;

public interface AddressService {
    Address getAddressByUsername(String username);
    void insertAddress(Address address,String username);
}

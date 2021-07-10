package com.vegetarian.service;

import com.vegetarian.entity.Address;

public interface AddressService {
    Address getAddressByUsername(String username);
    void insertAddress(Address address,String username);
    void updateAddress(Address address,String username);

}

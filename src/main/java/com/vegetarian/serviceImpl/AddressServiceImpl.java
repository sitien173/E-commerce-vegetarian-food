package com.vegetarian.serviceImpl;

import com.vegetarian.dao.AddressDao;
import com.vegetarian.entity.Address;
import com.vegetarian.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.Action;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressDao addressDao;

    @Override
    public Address getAddressByUsername(String username) {
        return addressDao.getAddressByUsername(username);
    }

    @Override
    public void insertAddress(Address address, String username) {
        addressDao.insertAddress(address,username);
    }

    @Override
    public void updateAddress(Address address, String username) {
        addressDao.updateAddress(address,username);
    }
}

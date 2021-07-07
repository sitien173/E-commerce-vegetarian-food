package com.vegetarian.api.home;

import com.vegetarian.entity.District;
import com.vegetarian.entity.Province;
import com.vegetarian.entity.Ward;
import com.vegetarian.service.DistrictService;
import com.vegetarian.service.ProvinceService;
import com.vegetarian.service.WardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/address")
public class AddressAPI {
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private DistrictService districtService;
    @Autowired
    private WardService wardService;
    @GetMapping("/province")
    private List<Province> getAllProvince(){
        return provinceService.getAllProvince();
    }
//    Get all district by province_id
    @GetMapping("/district/{id}")
    private List<District> getAllDistrictByProvinceId(@PathVariable("id") int provinceId){
        return districtService.getAllDistrict(provinceId);
    }
//    get all ward by district_id
    @GetMapping("/ward/{id}")
    private List<Ward> getAllWardByDistrictId(@PathVariable("id") int districtId){
        return wardService.getAllWardByDistrictId(districtId);
    }
}

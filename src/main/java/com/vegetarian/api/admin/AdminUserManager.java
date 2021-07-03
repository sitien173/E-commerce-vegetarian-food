package com.vegetarian.api.admin;

import com.google.gson.Gson;
import com.vegetarian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/api/user")
public class AdminUserManager {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list",
                    method = RequestMethod.GET,
                    produces = "text/plain;charset=UTF-8")
    public String getAllUser(){
        return new Gson().toJson(userService.getAllUser());
    }

    @DeleteMapping("/delete/{username}")
    public ResponseEntity<?> delete(@PathVariable("username") String username,
                                    Model model){
        if(userService.deleteUser(username)){
            model.addAttribute("info","delete success");
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().build();
    }
}

package com.vegetarian.controller.user;

import com.vegetarian.entity.User;
import com.vegetarian.service.UserService;
import com.vegetarian.serviceImpl.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.math.BigInteger;
import java.security.Principal;
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private FileService fileService;
    @GetMapping(value = "/user/edit",produces = "text/plain;charset=UTF-8")
    public String showViewInfo(Principal principal, Model model){
        model.addAttribute("user",userService.getUserByUserName(principal.getName()));
        return "user/user_info";
    }
    @PostMapping(value = "/user/update",
                produces = "text/plain;charset=UTF-8",
                consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String update(@Valid @ModelAttribute("user") User user,
                         BindingResult result,
                         @RequestParam("avt")MultipartFile file,
                         Model model){
        if(result.hasErrors()) return "user/user_info";
        if(!user.getAvatar().endsWith(file.getOriginalFilename())) fileService.save(file);
        user.setAvatar("/disk/resources/img/upload"+file.getOriginalFilename());
        if(userService.updateUser(user)) model.addAttribute("info","update success");
        return "user/user_info";
    }
}

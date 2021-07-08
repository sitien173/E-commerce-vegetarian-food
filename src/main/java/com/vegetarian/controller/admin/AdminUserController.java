package com.vegetarian.controller.admin;

import com.google.gson.Gson;
import com.vegetarian.entity.User;
import com.vegetarian.service.UserService;
import com.vegetarian.service.VerificationTokenService;
import com.vegetarian.serviceImpl.FileService;
import com.vegetarian.ultil.OnRegistrationCompleteEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.validation.Valid;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
    @Autowired
    private UserService userService;
    @Autowired
    private FileService fileService;
    @GetMapping("/list")
    public String showViewUser(){
        return "admin/user_list";
    }


    @GetMapping("/add")
    public String add(Model model){
        if(!model.containsAttribute("user")){
            model.addAttribute("user",new User());
        }
        return "admin/user_add";
    }
    @GetMapping("/edit/{username}")
    public String edit(@PathVariable("username") String username, Model model){
        model.addAttribute("user",userService.getUserByUserName(username.trim()));
        return "admin/user_edit";
    }

    //  Registration form
    @PostMapping(value = "/add",
            produces = "text/plain;charset=UTF-8",
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    private String registration(@Valid @ModelAttribute("user") User user,
                                BindingResult result,
                                @RequestParam("role") String role,
                                @RequestParam("avt") MultipartFile file,
                                Model model) throws SQLException {
        if(result.hasErrors()){
            return "admin/user_add";
        }
        fileService.save(file);
        Set<SimpleGrantedAuthority> authorizes = new HashSet<>();
        authorizes.add(new SimpleGrantedAuthority(role));
        user.setGrantedAuthorities(authorizes);
        user.setAvatar("/disk/resources/img/upload/" + file.getOriginalFilename());
        if(userService.insertUser(user)){
            model.addAttribute("info","add success");
        }else model.addAttribute("info","add failed");
        return "admin/user_add";
    }

    @RequestMapping(value = "/edit",
                    method = RequestMethod.POST,
                    produces = "text/plain;charset=UTF-8")
    public String editForm(@Valid @ModelAttribute("user") User user,
                           BindingResult result,
                           @RequestParam(value = "avt",required = false) MultipartFile file,
                           @RequestParam("role") String role,
                           Model model){
        if(result.hasErrors()){
            return "admin/user_edit";
        }
        fileService.save(file);
        Set<SimpleGrantedAuthority> authorizes = new HashSet<>();
        authorizes.add(new SimpleGrantedAuthority(role));
        user.setGrantedAuthorities(authorizes);
        user.setAvatar("/disk/resources/img/upload/" + file.getOriginalFilename());
        if(userService.updateUser(user)){
            model.addAttribute("info","update success");
        }else model.addAttribute("info","update failed");
        return "admin/user_edit";
    }
}

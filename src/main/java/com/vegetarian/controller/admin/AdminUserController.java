package com.vegetarian.controller.admin;

import com.vegetarian.entity.User;
import com.vegetarian.service.AddressService;
import com.vegetarian.service.UserService;
import com.vegetarian.service.WardService;
import com.vegetarian.serviceImpl.FileService;
import com.vegetarian.ultil.OnRegistrationCompleteEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
    @Autowired
    private WardService wardService;
    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    private AddressService addressService;
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
                                @RequestParam("avt") MultipartFile file,
                                Model model) throws SQLException {
        if(result.hasErrors()){
            return "admin/user_add";
        } else if(userService.getUserByeEmail(user.getEmail()) != null){
            result.rejectValue("email","error","Email da ton tai");
            return "admin/user_add";
        }else if(userService.getUserByPhone(user.getPhone()) != null){
            result.rejectValue("phone","error","SDT da ton tai");
            return "admin/user_add";
        }
        if(!file.isEmpty()){
            fileService.save(file);
            user.setAvatar("/disk/resources/img/upload/" + file.getOriginalFilename());
        }
        Set<SimpleGrantedAuthority> authorizes = new HashSet<>();
        authorizes.add(new SimpleGrantedAuthority("ROLE_USER"));
        user.setGrantedAuthorities(authorizes);
        if(userService.insertUser(user)){
            return "admin/user_list";
        }
        model.addAttribute("info","Đăng ký thất bại");
        return "admin/user_add";
    }

    @RequestMapping(value = "/update",
                    method = RequestMethod.POST,
                    produces = "text/plain;charset=UTF-8")
    public String editForm(@Valid @ModelAttribute("user") User user,
                           BindingResult result,
                           @RequestParam("sdt") String phone,
                           @RequestParam("mail") String email,
                           @RequestParam("pass") String pass,
                           @RequestParam(value = "avt") MultipartFile file,
                           Model model){
        user.getAddress().setWard(wardService.getWard(user.getAddress().getWard().getWardId()));
        if(result.hasErrors()){
            return "admin/user_edit";
        }else if(!user.getEmail().equals(email)){
            if(userService.getUserByeEmail(email) != null) {
                user.setEmail(email);
                result.rejectValue("email", "error", "Email da ton tai");
                return "admin/user_edit";
            }
        }else if(!user.getPhone().equals(phone)){
            if(userService.getUserByPhone(phone) != null) {
                user.setPhone(phone);
                result.rejectValue("phone", "error", "SDT da ton tai");
                return "admin/user_edit";}
        }else if(!file.isEmpty() && !user.getAvatar().endsWith(file.getOriginalFilename())){
            fileService.save(file);
            user.setAvatar("/disk/resources/img/upload/" + file.getOriginalFilename());
        }
        user.setEnable(true);
        if(!pass.isEmpty()){
            String passEncode = encoder.encode(pass);
            user.setPassword(passEncode);
            if(userService.updateUser(user)){
                addressService.updateAddress(user.getAddress(),user.getUsername());
                model.addAttribute("info","update success");
            }else model.addAttribute("info","update failed");
        }else if(userService.updateUserNotPassword(user)){
            addressService.updateAddress(user.getAddress(),user.getUsername());
            model.addAttribute("info","update success");
        }else model.addAttribute("info","update failed");
        return "admin/user_edit";
    }
}

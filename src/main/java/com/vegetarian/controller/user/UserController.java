package com.vegetarian.controller.user;

import com.vegetarian.entity.User;
import com.vegetarian.entity.VerificationToken;
import com.vegetarian.service.AddressService;
import com.vegetarian.service.UserService;
import com.vegetarian.service.VerificationTokenService;
import com.vegetarian.service.WardService;
import com.vegetarian.serviceImpl.FileService;
import com.vegetarian.ultil.OnRegistrationCompleteEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.math.BigInteger;
import java.security.Principal;
import java.time.LocalDateTime;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private FileService fileService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    private WardService wardService;
    @Autowired
    private VerificationTokenService verificationTokenService;
    private String getAppUrl(HttpServletRequest request){
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
    @GetMapping(value = "/user/edit",produces = "text/plain;charset=UTF-8")
    public String showViewInfo(Principal principal, Model model){
        model.addAttribute("user",userService.getUserByUserName(principal.getName()));
        return "user/user_info";
    }
    @GetMapping("/user/change-password")
    public String showViewChangePassword(){
        return "user/change-password";
    }
    @PostMapping("/user/change-password")
    public String changePassword(@RequestParam("password") String password,
                                 @RequestParam("newPassword") String newPassword,
                                 Model model,
                                 Principal principal){
        User user = userService.getUserByUserName(principal.getName());
        if(encoder.matches(password,user.getPassword())){
            user.setPassword(encoder.encode(newPassword));
            user.setEnable(true);
            userService.updateUser(user);
            model.addAttribute("info","update success");
        }else model.addAttribute("info","old password in correct");
        return "user/change-password";
    }
    @PostMapping(value = "/user/update",
                produces = "text/plain;charset=UTF-8",
                consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String update(@Valid @ModelAttribute("user") User user,
                         BindingResult result,
                         @RequestParam("mail") String email,
                         @RequestParam("sdt") String phone,
                         @RequestParam("pass") String pass,
                         @RequestParam("avt")MultipartFile file,
                         HttpServletRequest request,
                         Model model){
        user.getAddress().setWard(wardService.getWard(user.getAddress().getWard().getWardId()));
        if(result.hasErrors()) return "user/user_info";
        boolean check = false;
        if(!encoder.matches(pass,user.getPassword())){
            result.rejectValue("password","error","Password incorrect");
            return "user/user_info";
        }else if(!user.getEmail().equals(email)){
            if(userService.getUserByeEmail(email) != null) {
                user.setEmail(email);
                result.rejectValue("email", "error", "Email da ton tai");
                return "user/user_info";
            }else {
                user.setEnable(false);
                user.setEmail(email);
                check = true; }
        }else if(!user.getPhone().equals(phone)){
            if(userService.getUserByPhone(phone) != null) {
                user.setEmail(phone);
                result.rejectValue("phone", "error", "SDT da ton tai");
                return "user/user_info";}else user.setPhone(phone);
        }else if(!file.isEmpty() && !user.getAvatar().endsWith(file.getOriginalFilename())){
            fileService.save(file);
            user.setAvatar("/disk/resources/img/upload/" + file.getOriginalFilename());
        }
        if(check){
            String appUrl = this.getAppUrl(request);
            String redirectLink = "/user/registration/accessToken";
            OnRegistrationCompleteEvent event = new OnRegistrationCompleteEvent(user,appUrl,redirectLink);
            verificationTokenService.sendVerificationToken(event);
            model.addAttribute("info","Please check your email and verify your account");
        }
        user.setPassword(encoder.encode(pass));
        if(userService.updateUser(user)) {
            addressService.updateAddress(user.getAddress(),user.getUsername());
            if(!check) model.addAttribute("info","Update success");
        }return "user/user_info";
    }

}


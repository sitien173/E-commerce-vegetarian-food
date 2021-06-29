package com.vegetarian.controller.user;

import com.vegetarian.entity.Address;
import com.vegetarian.entity.User;
import com.vegetarian.entity.VerificationToken;
import com.vegetarian.service.UserService;
import com.vegetarian.service.VerificationTokenService;
import com.vegetarian.service.WardService;
import com.vegetarian.ultil.OnRegistrationCompleteEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user/registration")
public class RegistrationController {
    @Autowired
    private UserService userService;
    @Autowired
    private WardService wardService;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private VerificationTokenService verificationTokenService;
    private String getAppUrl(HttpServletRequest request){
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }

    @GetMapping(value = {"/",""})
    private String showViewRegistration(@RequestParam(value = "messenger",required = false) String messenger, Model model) {
        if(!model.containsAttribute("user"))
            model.addAttribute("user",new User());
        if(messenger != null) model.addAttribute("messenger",messenger);
        return "user/registration";
    }


    //  Registration form
    @PostMapping(value = {"/",""},
            produces = "text/plain;charset=UTF-8",
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    private String registration(@Valid @ModelAttribute("user") User user,
                                BindingResult result,
                                @RequestParam("ward") int wardId,
                                @RequestParam("addr") String addr,
                                @RequestParam("avt") MultipartFile file,
                                HttpServletRequest request,
                                Model model) throws SQLException, IOException {
        if(result.hasErrors()) return "user/registration";
        Address address = new Address(addr,wardService.getWard(wardId));
        List<Address> addressList = new ArrayList<>();
        addressList.add(address);
        user.setAddress(addressList);
        if(file != null && !file.isEmpty()){
            String path = servletContext.getRealPath("/disk\\resources\\img\\user\\");
            String fileName = file.getOriginalFilename();
            file.transferTo(new File(path,fileName));
            String fileInsert = "disk/resources/img/user/" + fileName;
            user.setAvatar(fileInsert);
        }
        if(userService.insertUser(user)){
            String appUrl = this.getAppUrl(request);
            String redirectLink = "/user/registration/registrationConfirm";
            OnRegistrationCompleteEvent event = new OnRegistrationCompleteEvent(user,appUrl,redirectLink);
            verificationTokenService.sendVerificationToken(event);
            model.addAttribute("messenger","Please check your email and verify your account");
            return "user/waitConfirmAccount";
        }
        return "user/registration?messenger=registration%sfailed";
    }

    @GetMapping("/registrationConfirm")
    public String confirmRegistration(@RequestParam("token") String token,Model model) {
        VerificationToken verificationToken = verificationTokenService.getVerificationToken(token);
        if (verificationToken == null) {
            model.addAttribute("messenger","token does not exist");
            return "user/waitConfirmAccount";
        }
        User user = verificationToken.getUser();
        LocalDateTime localDateTime = LocalDateTime.now();
        if (!verificationToken.getExpiryDate().isBefore(localDateTime)) {
            model.addAttribute("messenger","token has expired");
            return "user/waitConfirmAccount";
        }
        user.setEnable(true);
        userService.updateUser(user);
        return "user/login";
    }


    @GetMapping("/resendRegistrationConfirm")
    public String resendRegistration(Model model,@RequestParam("token") String token,HttpServletRequest request){
        VerificationToken verificationToken = verificationTokenService.getVerificationToken(token);
        if(token != null){
            String appUrl = this.getAppUrl(request);
            String redirectLink = "/user/registration/registrationConfirm";
            OnRegistrationCompleteEvent event = new OnRegistrationCompleteEvent(verificationToken.getUser(), appUrl,redirectLink);
           if(verificationTokenService.resendVerificationToken(verificationToken,event)){
               model.addAttribute("messenger","Please check your email and verify your account");
           }else {
               model.addAttribute("messenger","token is not correct");
           }
        }
        return "user/waitConfirmAccount";
    }


}

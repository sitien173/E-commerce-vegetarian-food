package com.vegetarian.controller.user;

import com.vegetarian.entity.Address;
import com.vegetarian.entity.User;
import com.vegetarian.entity.VerificationToken;
import com.vegetarian.entity.Ward;
import com.vegetarian.service.UserService;
import com.vegetarian.service.VerificationTokenService;
import com.vegetarian.service.WardService;
import com.vegetarian.serviceImpl.FileService;
import com.vegetarian.ultil.OnRegistrationCompleteEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/user/registration")
public class RegistrationController {
    @Autowired
    private UserService userService;
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
                                @RequestParam("avt") MultipartFile file,
                                HttpServletRequest request,
                                Model model) throws SQLException{
        if(result.hasErrors()){
            return "user/registration";
        }
        FileService.save(file);
        Set<SimpleGrantedAuthority> authorizes = new HashSet<>();
        authorizes.add(new SimpleGrantedAuthority("ROLE_USER"));
        user.setGrantedAuthorities(authorizes);
        user.setAvatar("/disk/resources/img/upload/" + file.getOriginalFilename());
        if(userService.insertUser(user)){
            String appUrl = this.getAppUrl(request);
            String redirectLink = "/user/registration/accessToken";
            OnRegistrationCompleteEvent event = new OnRegistrationCompleteEvent(user,appUrl,redirectLink);
            verificationTokenService.sendVerificationToken(event);
            model.addAttribute("messenger","Please check your email and verify your account");
            return "user/wait-confirm-token";
        }
        return "user/registration";
    }

    @GetMapping("/accessToken")
    public String confirmRegistration(@RequestParam("token") String token,Model model) {
        VerificationToken verificationToken = verificationTokenService.getVerificationToken(token);
       if(verificationToken != null){
           verificationTokenService.deleteVerificationToken(verificationToken.getId(),verificationToken.getUser().getUsername());
           User user = verificationToken.getUser();
           LocalDateTime localDateTime = LocalDateTime.now();
           if (!verificationToken.getExpiryDate().isBefore(localDateTime)) {
               model.addAttribute("messenger","token has expired");
               model.addAttribute("requestToken","/user/registration/resendRegistrationConfirm");
               return "user/wait-confirm-token";
           }
           user.setEnable(true);
           userService.updateUser(user);
           Authentication authentication = new UsernamePasswordAuthenticationToken(user,null,user.getAuthorities());
           SecurityContextHolder.getContext().setAuthentication(authentication);
           return "redirect:/index";
       }
        return "user/wait-confirm-token";
    }

    @GetMapping("/resendRegistrationConfirm")
    public String resendRegistration(Model model,@RequestParam(value = "token",required = false) String token,HttpServletRequest request){
        VerificationToken verificationToken = verificationTokenService.getVerificationToken(token);
        if(token != null){
            String appUrl = this.getAppUrl(request);
            String redirectLink = "/user/registration/accessToken";
            OnRegistrationCompleteEvent event = new OnRegistrationCompleteEvent(verificationToken.getUser(), appUrl,redirectLink);
           if(verificationTokenService.resendVerificationToken(verificationToken,event)){
               model.addAttribute("messenger","Please check your email and verify your account");
           }else {
               model.addAttribute("requestToken","/user/registration/resendRegistrationConfirm");
               model.addAttribute("messenger","token is not correct");
           }
        }
        return "user/wait-confirm-token";
    }


}

package com.vegetarian.controller.user;

import com.vegetarian.entity.User;
import com.vegetarian.entity.VerificationToken;
import com.vegetarian.service.UserService;
import com.vegetarian.service.VerificationTokenService;
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
import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping("/user/registration")
public class RegistrationController {
    @Autowired
    private UserService userService;
    @Autowired
    private VerificationTokenService verificationTokenService;
    @Autowired
    private FileService fileService;


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
        }else if(userService.getUserByeEmail(user.getEmail()) != null){
            result.rejectValue("email","error","Email da ton tai");
            return "user/registration";
        }else if(userService.getUserByPhone(user.getPhone()) != null){
            result.rejectValue("phone","error","SDT da ton tai");
            return "user/registration";
        }
        fileService.save(file);
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
           if (!verificationToken.getExpiryDate().isBefore(LocalDateTime.now())) {
               model.addAttribute("messenger","token has expired");
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
}

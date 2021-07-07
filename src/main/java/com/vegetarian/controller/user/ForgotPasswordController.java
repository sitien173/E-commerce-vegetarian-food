package com.vegetarian.controller.user;

import com.vegetarian.entity.User;
import com.vegetarian.entity.VerificationToken;
import com.vegetarian.service.UserService;
import com.vegetarian.service.VerificationTokenService;
import com.vegetarian.ultil.OnRegistrationCompleteEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/user/forgotPassword")
public class ForgotPasswordController {
    @Autowired
    private UserService userService;
    @Autowired
    private VerificationTokenService verificationTokenService;

    private String getAppUrl(HttpServletRequest request){
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }

    @GetMapping(value = {"/",""})
    public String showViewForgotPassword(@RequestParam(value = "messenger",required = false) String messenger,Model model){
        if(messenger != null) model.addAttribute("messenger",messenger);
        return "user/forgot-password";
    }

    @GetMapping("/updatePassword")
    public String showViewUpdatePassword(){
        return "user/update-password";
    }

    @GetMapping("/accessToken")
    public String confirmToken(@RequestParam("token") String token,Model model){
        VerificationToken verificationToken = verificationTokenService.getVerificationToken(token);
        if(verificationToken != null){
            if(!verificationToken.getExpiryDate().isBefore(LocalDateTime.now())) {
                model.addAttribute("requestToken", "/user/forgotPassword/resendTokenForgotPassword");
                model.addAttribute("messenger", "token has expired");
                return "user/wait-confirm-token";
            }
        }else{
            model.addAttribute("messenger","token does not exist");
            return "user/wait-confirm-token";
        }
        return "user/update-password";
    }

    @PostMapping(value = {"/",""})
    public String sendPasswordToMail(@RequestParam("email") String email,
                                     HttpServletRequest request,
                                     Model model){
        User user = userService.getUserByeEmail(email);
        if(user == null){
            model.addAttribute("messenger","Email Not Found");
            return "/user/forgot-password";
        }
        String appUrl = this.getAppUrl(request);
        String redirectLink = "/user/forgotPassword/accessToken";
        OnRegistrationCompleteEvent event = new OnRegistrationCompleteEvent(user,appUrl,redirectLink);
        verificationTokenService.sendVerificationToken(event);
        model.addAttribute("messenger","We have sent the password to your mail. Please check your email");
        return "user/wait-confirm-token";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam("token") String token,@RequestParam("password") String password){
        VerificationToken verificationToken = verificationTokenService.getVerificationToken(token);
        User user = verificationToken.getUser();
        verificationTokenService.deleteVerificationToken(verificationToken.getId(),verificationToken.getUser().getUsername());
        if(user != null){
            user.setPassword(password);
            userService.updateUser(user);
            Authentication authentication = new UsernamePasswordAuthenticationToken(user,null,user.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
        }else return "user/update-password";
        return "redirect:/index";
    }
}

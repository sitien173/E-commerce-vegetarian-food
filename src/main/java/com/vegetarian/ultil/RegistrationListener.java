package com.vegetarian.ultil;

import com.vegetarian.entity.User;
import com.vegetarian.service.VerificationTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

@Component
public class RegistrationListener implements
        ApplicationListener<OnRegistrationCompleteEvent> {
    @Autowired
    private VerificationTokenService verificationTokenService;

    @Override
    public void onApplicationEvent(OnRegistrationCompleteEvent event) {
        this.confirmRegistration(event);
    }
    private void confirmRegistration(OnRegistrationCompleteEvent event) {
        User user = event.getUser();
        String token = UUID.randomUUID().toString();
        verificationTokenService.insertVerificationToken(user.getUsername(), token);
        String recipientAddress = user.getEmail();
        String subject = "Registration Confirmation";
        String confirmationUrl = event.getAppUrl() + event.getRedirectLink() + "?token=" + token;
        try {
            EmailUtils.sendMail(recipientAddress,subject,confirmationUrl);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.getMessage();
        }
    }
}

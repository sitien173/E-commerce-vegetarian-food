package com.vegetarian.ultil;

import com.vegetarian.entity.User;
import com.vegetarian.service.VerificationTokenService;
import com.vegetarian.serviceImpl.MailService;
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
    @Autowired
    private MailService mailService;

    @Override
    public void onApplicationEvent(OnRegistrationCompleteEvent event) {
        this.confirmRegistration(event);
    }
    private void confirmRegistration(OnRegistrationCompleteEvent event) {
        User user = event.getUser();
        String token = UUID.randomUUID().toString();
        verificationTokenService.insertVerificationToken(user.getUsername(), token);
        String recipientAddress = user.getEmail();
        String subject = "Confirmation Token";
        String confirmationUrl = event.getAppUrl() + event.getRedirectLink() + "?token=" + token;
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(confirmationUrl);
        mailService.sendMail(email);
    }
}

package com.vegetarian.service;

import com.vegetarian.entity.VerificationToken;
import com.vegetarian.ultil.OnRegistrationCompleteEvent;

public interface VerificationTokenService {
    void insertVerificationToken(String username,String token);
    VerificationToken getVerificationToken(String token);
    void sendVerificationToken(OnRegistrationCompleteEvent event);
    boolean deleteVerificationToken(int id,String username);
    boolean resendVerificationToken(VerificationToken verificationToken, OnRegistrationCompleteEvent event);
}

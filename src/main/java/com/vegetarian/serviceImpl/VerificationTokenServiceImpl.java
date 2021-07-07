package com.vegetarian.serviceImpl;

import com.vegetarian.dao.VerificationTokenDao;
import com.vegetarian.entity.VerificationToken;
import com.vegetarian.service.UserService;
import com.vegetarian.service.VerificationTokenService;
import com.vegetarian.ultil.OnRegistrationCompleteEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.sql.SQLException;

@Service
public class VerificationTokenServiceImpl implements VerificationTokenService {
    @Autowired
    private VerificationTokenDao verificationTokenDao;
    @Autowired
    private ApplicationEventPublisher eventPublisher;
    @Autowired
    private UserService userService;
    @Override
    public void insertVerificationToken(String username, String token) {
        verificationTokenDao.insertVerificationToken(username,token);
    }

    @Override
    public VerificationToken getVerificationToken(String token) {
        return verificationTokenDao.getVerificationToken(token);
    }

    @Override
    public void sendVerificationToken(OnRegistrationCompleteEvent event) {
        eventPublisher.publishEvent(event);
    }

    @Override
    public boolean deleteVerificationToken(int id, String username) {
        return verificationTokenDao.deleteVerificationToken(id,username);
    }

}

package com.vegetarian.dao;

import com.vegetarian.entity.VerificationToken;

public interface VerificationTokenDao {
    void insertVerificationToken(String username,String token);
    VerificationToken getVerificationToken(String token);
    boolean deleteVerificationToken(int id,String username);
}

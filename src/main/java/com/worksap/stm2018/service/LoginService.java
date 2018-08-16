package com.worksap.stm2018.service;

import com.worksap.stm2018.dto.LoginDto;

public interface LoginService {
    /**
     * check userName and password
     *
     * @param userName
     * @param password
     */
    LoginDto check(String userName, String password);
}

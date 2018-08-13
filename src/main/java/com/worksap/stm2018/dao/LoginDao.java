package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.LoginDto;

public interface LoginDao {
    /**
     * Get login information from userName
     *
     * @param userName
     */
    LoginDto getPassword(String userName);

}

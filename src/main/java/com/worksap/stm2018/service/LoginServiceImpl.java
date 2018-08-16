package com.worksap.stm2018.service;

import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.dao.LoginDao;
import com.worksap.stm2018.dto.LoginDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LoginServiceImpl implements LoginService{
    private LoginDao loginDao;

    @Autowired
    public LoginServiceImpl(DaoFactory daoFactory) {
        this.loginDao = daoFactory.getLoginDao();
    }

    @Override
    public LoginDto check(String userName, String password) {
        return loginDao.getPassword(userName);
    }
}

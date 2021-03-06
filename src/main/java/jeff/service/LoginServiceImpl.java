package jeff.service;

import jeff.dao.DaoFactory;
import jeff.dao.LoginDao;
import jeff.dto.LoginDto;
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

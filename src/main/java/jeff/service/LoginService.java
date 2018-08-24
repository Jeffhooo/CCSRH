package jeff.service;

import jeff.dto.LoginDto;

public interface LoginService {
    /**
     * check userName and password
     *
     * @param userName
     * @param password
     */
    LoginDto check(String userName, String password);
}

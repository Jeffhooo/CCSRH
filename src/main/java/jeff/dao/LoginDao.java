package jeff.dao;

import jeff.dto.LoginDto;

public interface LoginDao {
    /**
     * Get login information from userName
     *
     */
    LoginDto getPassword(String userName);

}

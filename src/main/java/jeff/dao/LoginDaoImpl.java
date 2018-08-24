package jeff.dao;

import jeff.dto.LoginDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class LoginDaoImpl implements LoginDao {
    private JdbcTemplate template;

    @Autowired
    public LoginDaoImpl(JdbcTemplate template) {
        this.template = template;
    }

    private static final String SQL = "select * from login where name = ?";

    @Override
    public LoginDto getPassword(String userName) {
        try {
            return DataAccessUtils.requiredSingleResult(template.query(SQL,
                    ps -> ps.setString(1, userName),
                    (rs, rowNum) -> new LoginDto(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4))));
        } catch (Exception e) {
            return null;
        }

    }
}

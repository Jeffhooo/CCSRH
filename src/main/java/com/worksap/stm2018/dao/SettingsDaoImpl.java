package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.CheckSettingsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;

@Component
public class SettingsDaoImpl implements SettingsDao {
    private JdbcTemplate template;
    private DataSource dataSource;

    private static final String SELECT_WORKDAYS_SETTINGS_SQL = "select settings_value from check_settings where settings_name = 'workDays'";
    private static final String SELECT_LANGUAGES_SETTINGS_SQL = "select settings_value from check_settings where settings_name = 'serviceLanguages'";
    private static final String UPDATE_LANGUAGES_SETTINGS_SQL = "update check_settings set settings_value = ? where settings_name = 'serviceLanguages'";
    private static final String UPDATE_WORKDAY_SETTINGS_SQL = "update check_settings set settings_value = ? where settings_name = 'workDays'";

    @Autowired
    public SettingsDaoImpl(JdbcTemplate template, DataSource dataSource) {
        this.template = template;
        this.dataSource = dataSource;
    }

    @Override
    public CheckSettingsDto getCheckSettings() {
        try {
            String[] workdays = (String[]) DataAccessUtils.requiredSingleResult(template.query(SELECT_WORKDAYS_SETTINGS_SQL, ps -> {},
                    (rs, rowNum) -> rs.getArray(1))).getArray();
            String[] languages = (String[]) DataAccessUtils.requiredSingleResult(template.query(SELECT_LANGUAGES_SETTINGS_SQL, ps -> {},
                    (rs, rowNum) -> rs.getArray(1))).getArray();
            return new CheckSettingsDto(workdays[0], languages);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void updateCheckSettings(CheckSettingsDto newSettings) {
        try {
            String[] workdays = new String[1];
            workdays[0] = newSettings.getWorkDays();
            Connection connection = dataSource.getConnection();
            Array workdaysArray = connection.createArrayOf("text", workdays);
            template.update(UPDATE_WORKDAY_SETTINGS_SQL, ps -> ps.setArray(1, workdaysArray));

            Array languagesArray = connection.createArrayOf("text", newSettings.getServiceLanguages());
            template.update(UPDATE_LANGUAGES_SETTINGS_SQL, ps -> ps.setArray(1, languagesArray));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

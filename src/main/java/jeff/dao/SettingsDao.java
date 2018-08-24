package jeff.dao;

import jeff.dto.CheckSettingsDto;

public interface SettingsDao {
    /**
     * get check settings
     *
     */
    CheckSettingsDto getCheckSettings();

    /**
     * update check settings
     *
     */
    void updateCheckSettings(CheckSettingsDto newSettings);
}

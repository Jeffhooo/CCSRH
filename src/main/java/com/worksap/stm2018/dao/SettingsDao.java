package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.CheckSettingsDto;

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

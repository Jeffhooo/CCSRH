package jeff.service;

import jeff.dto.CheckSettingsDto;
import jeff.dto.HolidayDto;
import jeff.vo.HolidayVo;

import java.util.List;

public interface SettingsService {
    /**
     * get check settings
     *
     */
    CheckSettingsDto getCheckSettings();

    /**
     * update check settings
     *
     */
    void updateCheckSettings(CheckSettingsDto checkSettingsDto);

    /**
     * get all holidays
     *
     */
    List<HolidayDto> getAllHolidays();

    /**
     * put new holiday
     *
     */
    void putNewHoliday(HolidayVo newHoliday);

    /**
     * delete holiday by id
     *
     */
    void deleteHolidayById(String holidayId);
}

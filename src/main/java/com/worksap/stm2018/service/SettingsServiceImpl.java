package com.worksap.stm2018.service;

import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.dao.HolidayDao;
import com.worksap.stm2018.dao.SettingsDao;
import com.worksap.stm2018.dto.CheckSettingsDto;
import com.worksap.stm2018.dto.HolidayDto;
import com.worksap.stm2018.util.NewIdUtil;
import com.worksap.stm2018.vo.HolidayVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SettingsServiceImpl implements SettingsService{
    private SettingsDao settingsDao;

    @Override
    public void putNewHoliday(HolidayVo newHoliday) {
        String newId = NewIdUtil.generateNewId(holidayDao.getHolidayIds());
        holidayDao.insertNewHoliday(new HolidayDto(
                newId,
                newHoliday.getName(),
                newHoliday.getPlace(),
                newHoliday.getBeginTime(),
                newHoliday.getEndTime()
        ));
    }

    @Override
    public void deleteHolidayById(String holidayId) {
        holidayDao.deleteById(holidayId);
    }

    private HolidayDao holidayDao;

    @Autowired
    public SettingsServiceImpl(DaoFactory daoFactory) {
        this.holidayDao = daoFactory.getHolidayDao();
        this.settingsDao = daoFactory.getSettingsDao();
    }

    @Override
    public CheckSettingsDto getCheckSettings() {
        return settingsDao.getCheckSettings();
    }

    @Override
    public void updateCheckSettings(CheckSettingsDto checkSettingsDto) {
        settingsDao.updateCheckSettings(checkSettingsDto);
    }

    @Override
    public List<HolidayDto> getAllHolidays() {
        return holidayDao.getAllHolidays();
    }
}

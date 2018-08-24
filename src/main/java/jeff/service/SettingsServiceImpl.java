package jeff.service;

import jeff.dao.ArrangementDao;
import jeff.dao.DaoFactory;
import jeff.dao.HolidayDao;
import jeff.dao.SettingsDao;
import jeff.dto.CheckSettingsDto;
import jeff.dto.HolidayDto;
import jeff.util.NewIdUtil;
import jeff.vo.HolidayVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SettingsServiceImpl implements SettingsService{
    private SettingsDao settingsDao;
    private HolidayDao holidayDao;
    private ArrangementDao arrangementDao;

    @Autowired
    public SettingsServiceImpl(DaoFactory daoFactory) {
        this.holidayDao = daoFactory.getHolidayDao();
        this.settingsDao = daoFactory.getSettingsDao();
        this.arrangementDao = daoFactory.getArrangementDao();
    }

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
        arrangementDao.deleteByPlace(
                newHoliday.getPlace(),
                newHoliday.getBeginTime(),
                newHoliday.getEndTime());
    }

    @Override
    public void deleteHolidayById(String holidayId) {
        holidayDao.deleteById(holidayId);
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

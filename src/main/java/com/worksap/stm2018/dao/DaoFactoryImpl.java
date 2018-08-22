package com.worksap.stm2018.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DaoFactoryImpl implements DaoFactory {
    private final ArrangementDao arrangementDao;
    private final ApplicationDao applicationDao;
    private final HolidayDao holidayDao;
    private final LoginDao loginDao;
    private final StaffDao staffDao;
    private final WorkHistoryDao workHistoryDao;
    private final SettingsDao settingsDao;


    @Autowired
    public DaoFactoryImpl(ArrangementDao arrangementDao,
                          ApplicationDao applicationDao,
                          HolidayDao holidayDao,
                          LoginDao loginDao,
                          StaffDao staffDao,
                          WorkHistoryDao workHistoryDao,
                          SettingsDao settingsDao) {
        this.arrangementDao = arrangementDao;
        this.applicationDao = applicationDao;
        this.holidayDao = holidayDao;
        this.loginDao = loginDao;
        this.staffDao = staffDao;
        this.workHistoryDao = workHistoryDao;
        this.settingsDao = settingsDao;
    }

    @Override
    public ApplicationDao getApplicationDao() {
        return applicationDao;
    }

    @Override
    public ArrangementDao getArrangementDao() {
        return arrangementDao;
    }

    @Override
    public HolidayDao getHolidayDao() {
        return holidayDao;
    }

    @Override
    public LoginDao getLoginDao() {
        return loginDao;
    }

    @Override
    public StaffDao getStaffDao() {
        return staffDao;
    }

    @Override
    public WorkHistoryDao getWorkHistoryDao() {
        return workHistoryDao;
    }

    @Override
    public SettingsDao getSettingsDao() {
        return settingsDao;
    }
}

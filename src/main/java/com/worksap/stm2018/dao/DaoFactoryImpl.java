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


    @Autowired
    public DaoFactoryImpl(ArrangementDao arrangementDao, ApplicationDao applicationDao, HolidayDao holidayDao,
                          LoginDao loginDao, StaffDao staffDao, WorkHistoryDao workHistoryDao) {
        this.arrangementDao = arrangementDao;
        this.applicationDao = applicationDao;
        this.holidayDao = holidayDao;
        this.loginDao = loginDao;
        this.staffDao = staffDao;
        this.workHistoryDao = workHistoryDao;
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
}

package com.worksap.stm2018.service;

import com.worksap.stm2018.dao.ApplicationDao;
import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.dao.HolidayDao;
import com.worksap.stm2018.dao.StaffDao;
import com.worksap.stm2018.dto.HolidayDto;
import com.worksap.stm2018.dto.StaffDto;
import com.worksap.stm2018.vo.ApplicationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class StaffServiceImpl implements StaffService {
    private StaffDao staffDao;
    private HolidayDao holidayDao;
    private ApplicationDao applicationDao;

    @Autowired
    public StaffServiceImpl(DaoFactory daoFactory) {
        this.staffDao = daoFactory.getStaffDao();
        this.holidayDao = daoFactory.getHolidayDao();
        this.applicationDao = daoFactory.getApplicationDao();
    }

    @Override
    public List<StaffDto> getAvailableStaffs(Timestamp beginTime, Timestamp endTime) {
        List<StaffDto> staffs = staffDao.list();
        List<HolidayDto> holidays = holidayDao.getHolidays(beginTime, endTime);
        List<ApplicationVo> applications = applicationDao.getAcceptedApplications(beginTime, endTime);

        Set<String> places = new HashSet<>();
        for(HolidayDto holiday : holidays) {
            places.add(holiday.getPlace());
        }

        Set<String> restStaffs = new HashSet<>();
        for(ApplicationVo application : applications) {
            restStaffs.add(application.getApplicantId());
        }

        List<StaffDto> remove = new ArrayList<>();
        for(StaffDto staff : staffs) {
            if(places.contains(staff.getPlace()) || restStaffs.contains(staff.getId())) {
                remove.add(staff);
            }
        }
        for(StaffDto staff : remove) {
            staffs.remove(staff);
        }
        return staffs;
    }
}

package jeff.service;

import jeff.util.NewIdUtil;
import jeff.util.TimeUtil;
import jeff.dao.*;
import jeff.dto.HolidayDto;
import jeff.dto.StaffDto;
import jeff.vo.ApplicationVo;
import jeff.vo.ArrangementVo;
import jeff.vo.StaffVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.*;

@Component
public class StaffServiceImpl implements StaffService {
    private StaffDao staffDao;
    private HolidayDao holidayDao;
    private ApplicationDao applicationDao;
    private ArrangementDao arrangementDao;

    @Autowired
    public StaffServiceImpl(DaoFactory daoFactory) {
        this.staffDao = daoFactory.getStaffDao();
        this.holidayDao = daoFactory.getHolidayDao();
        this.applicationDao = daoFactory.getApplicationDao();
        this.arrangementDao = daoFactory.getArrangementDao();
    }

    @Override
    public List<StaffDto> getAvailableStaffs(Timestamp beginTime, Timestamp endTime) {
        List<StaffDto> staffs = staffDao.list();
        List<HolidayDto> holidays = holidayDao.getHolidays(beginTime, endTime);
        List<ApplicationVo> applications = applicationDao.getAcceptedApplications(beginTime, endTime);

        Set<String> workedStaffs = new HashSet<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date(beginTime.getTime()));
        int beginHour = calendar.get(Calendar.HOUR);
        List<ArrangementVo> arrangementVos;
        if(beginHour == 8) {
            arrangementVos = arrangementDao.list(
                    TimeUtil.timestampAddHours(beginTime, 8),
                    TimeUtil.timestampAddHours(endTime, 7));
        } else {
            arrangementVos = arrangementDao.list(
                    TimeUtil.timestampAddHours(beginTime, -8),
                    TimeUtil.timestampAddHours(endTime, -7));
        }
        for(ArrangementVo arrangementVo : arrangementVos) {
            workedStaffs.add(arrangementVo.getStaffId());
        }


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
            if(places.contains(staff.getPlace())
                    || restStaffs.contains(staff.getId())
                    || workedStaffs.contains(staff.getId())) {
                remove.add(staff);
            }
        }
        for(StaffDto staff : remove) {
            staffs.remove(staff);
        }
        return staffs;
    }

    @Override
    public List<StaffDto> getAllStaffs() {
        return staffDao.list();
    }

    @Override
    public void put(StaffVo newStaff) {
        String newId = NewIdUtil.generateNewId(staffDao.getStaffsId());
        staffDao.insert(new StaffDto(
                newId,
                newStaff.getName(),
                newStaff.getPlace(),
                newStaff.getLanguage1(),
                newStaff.getLanguage2()
        ));
    }

    @Override
    public void deleteById(String staffId) {
        staffDao.deleteById(staffId);
    }
}

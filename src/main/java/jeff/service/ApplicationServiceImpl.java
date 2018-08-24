package jeff.service;

import jeff.util.TimeUtil;
import jeff.dao.ApplicationDao;
import jeff.dao.ArrangementDao;
import jeff.dao.DaoFactory;
import jeff.dao.StaffDao;
import jeff.entity.ApplicationEntity;
import jeff.entity.SubmitApplicationEntity;
import jeff.entity.TimetableEntity;
import jeff.vo.ApplicationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class ApplicationServiceImpl implements ApplicationService {
    private final ApplicationDao applicationDao;
    private final StaffDao staffDao;
    private final ArrangementDao arrangementDao;

    @Autowired
    public ApplicationServiceImpl(DaoFactory daoFactory) {
        this.staffDao = daoFactory.getStaffDao();
        this.applicationDao = daoFactory.getApplicationDao();
        this.arrangementDao = daoFactory.getArrangementDao();
    }

    @Override
    public List<ApplicationVo> getApplications(Date beginTime, Date endTime) {
        return applicationDao.list(new Timestamp(beginTime.getTime()), new Timestamp(endTime.getTime()));
    }

    @Override
    public void create(SubmitApplicationEntity newApplication) {
        String place = staffDao.getStaffPlace(newApplication.getStaffId());
        Timestamp begin;
        Timestamp end;
        if(place.equals("Asia/Tokyo") || place.equals("Asia/Seoul")) {
            begin = new Timestamp(TimeUtil.AddHours(new Date(TimeUtil.StringToTimestamp(
                    newApplication.getBeginTime()).getTime()), -1).getTime());
            end = new Timestamp(TimeUtil.AddHours(new Date(TimeUtil.StringToTimestamp(
                    newApplication.getEndTime()).getTime()), -1).getTime());
        } else {
            begin = TimeUtil.StringToTimestamp(newApplication.getBeginTime());
            end = TimeUtil.StringToTimestamp(newApplication.getEndTime());
        }
        applicationDao.put(new ApplicationVo.Builder().applicantId(newApplication.getStaffId())
                                                             .applicantName(staffDao.getStaffName(newApplication.getStaffId()))
                                                             .applyReason(newApplication.getApplyReason())
                                                             .beginTime(begin)
                                                             .endTime(end)
                                                             .build());
    }

    @Override
    public void accept(String applicationId, String comment) {
        ApplicationVo application= applicationDao.findById(applicationId);
        arrangementDao.deleteOfStaff(
                application.getApplicantId(),
                application.getBeginTime(),
                application.getEndTime());
        applicationDao.addResult(applicationId, "accept", comment);
    }

    @Override
    public void reject(String applicationId, String comment) {
        applicationDao.addResult(applicationId, "reject", comment);
    }

    @Override
    public TimetableEntity ApplicationsTimetable(String staffId, Date beginDate, Date endDate) {
        List<String> days = new ArrayList<>();
        TimeUtil.tableDays(days, beginDate);

        List<String> times = new ArrayList<>();
        String staffPlace = staffDao.getStaffPlace(staffId);
        TimeUtil.tableTimes("Staff", staffPlace, times);

        TimetableEntity timetable = new TimetableEntity();
        timetable.setDays(days);
        timetable.setTimes(times);

        List<String> content = new ArrayList<>();
        int workTimeOfPlace = TimeUtil.getWorkTime(staffPlace);

        Date beginWorkTime = TimeUtil.AddHours(beginDate, workTimeOfPlace);
        Date endWorkTime = TimeUtil.AddHours(beginWorkTime, 8);
        for(int i = 0; i < 14; i++) {
            List<ApplicationVo> applicationVos = applicationDao.listNotReject(
                    new Timestamp(beginWorkTime.getTime()),
                            new Timestamp(endWorkTime.getTime()));
            if(applicationVos.isEmpty()) {
                content.add("");
            } else {
                content.add(Integer.toString(applicationVos.size()));
            }
            beginWorkTime = (i%2 == 0)? TimeUtil.AddHours(beginWorkTime, 8) :
                    TimeUtil.AddHours(beginWorkTime, 16);
            endWorkTime = (i%2 == 0)? TimeUtil.AddHours(endWorkTime, 8) :
                    TimeUtil.AddHours(endWorkTime, 16);
        }
        timetable.setContent(content);
        return timetable;
    }

    @Override
    public List<ApplicationEntity> getStaffApplications(String staffId, Date beginTime, Date endTime) {
        String place = staffDao.getStaffPlace(staffId);
        List<ApplicationVo> applicationVos = applicationDao.find(staffId,
                new Timestamp(beginTime.getTime()),
                new Timestamp(endTime.getTime()));
        List<ApplicationEntity> applicationEntities = new ArrayList<>();
        for(ApplicationVo applicationVo : applicationVos) {
            Timestamp begin;
            Timestamp end;
            if(place.equals("Asia/Tokyo") || place.equals("Asia/Seoul")) {
                begin = new Timestamp(TimeUtil.AddHours(new Date(applicationVo.getBeginTime().getTime()), 1).getTime());
                end = new Timestamp(TimeUtil.AddHours(new Date(applicationVo.getEndTime().getTime()), 1).getTime());
            } else {
                begin = applicationVo.getBeginTime();
                end = applicationVo.getEndTime();
            }
            applicationEntities.add(new ApplicationEntity(
                    applicationVo.getApplicationId(),
                    applicationVo.getApplicantId(),
                    applicationVo.getApplicantName(),
                    applicationVo.getApplyReason(),
                    TimeUtil.timestampToString(begin),
                    TimeUtil.timestampToString(end),
                    applicationVo.getResult(),
                    applicationVo.getComment()));
        }
        return applicationEntities;
    }
}

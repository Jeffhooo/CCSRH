package jeff.schedule;

import jeff.dao.ArrangementDao;
import jeff.dao.DaoFactory;
import jeff.dao.WorkHistoryDao;
import jeff.vo.ArrangementVo;
import jeff.vo.WorkHistoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Component
public class ScheduleTask {
    private ArrangementDao arrangementDao;
    private WorkHistoryDao workHistoryDao;

    @Autowired
    public ScheduleTask(DaoFactory daoFactory) {
        this.arrangementDao = daoFactory.getArrangementDao();
        this.workHistoryDao = daoFactory.getWorkHistoryDao();
    }

    @Scheduled(cron = "0 0 0 ? * SUN")//work at 00:00 of Sunday every week
    public void transferArrangementToWorkHistory() {
        Calendar calendar = Calendar.getInstance();
        Date beginDate = calendar.getTime();
        calendar.add(Calendar.DAY_OF_WEEK, 7);
        Date endDate = calendar.getTime();
        List<ArrangementVo> arrangements = arrangementDao.list(
                new Timestamp(beginDate.getTime()),
                new Timestamp(endDate.getTime()));
        for(ArrangementVo arrangement : arrangements) {
            if("published".equals(arrangement.getStatus())){
                workHistoryDao.insert(new WorkHistoryVo.Builder()
                        .staffId(arrangement.getStaffId())
                        .staffName(arrangement.getStaffName())
                        .beginTime(arrangement.getBeginTime())
                        .endTime(arrangement.getEndTime()).build());
            }
        }
    }
}

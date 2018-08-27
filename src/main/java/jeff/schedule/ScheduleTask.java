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

    @Scheduled(cron = "0 5 0 ? * MON")//work at 00:05 of Monday every week
    public void transferArrangementToWorkHistory() {
        Calendar calendar = Calendar.getInstance();
        int min = calendar.getActualMinimum(Calendar.DAY_OF_WEEK); //get begin date of current week
        int current = calendar.get(Calendar.DAY_OF_WEEK); //get the number the today of current week
        calendar.add(Calendar.DAY_OF_WEEK, min-current-7); //get the begin date of last week
        Date beginDate = calendar.getTime();
        calendar.add(Calendar.DAY_OF_WEEK, 7); //get the end date of last week
        Date endDate = calendar.getTime();
        List<ArrangementVo> arrangements = arrangementDao.list(
                new Timestamp(beginDate.getTime()),
                new Timestamp(endDate.getTime()));
        for(ArrangementVo arrangement : arrangements) {
            workHistoryDao.insert(new WorkHistoryVo.Builder()
                    .staffId(arrangement.getStaffId())
                    .staffName(arrangement.getStaffName())
                    .beginTime(arrangement.getBeginTime())
                    .endTime(arrangement.getEndTime()).build());
        }
    }
}

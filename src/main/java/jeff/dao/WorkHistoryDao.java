package jeff.dao;

import jeff.vo.WorkHistoryVo;

import java.sql.Timestamp;
import java.util.List;

public interface WorkHistoryDao {
    /**
     * List the work history of staff
     *
     */
    List<WorkHistoryVo> list(String staffId, Timestamp beginTime, Timestamp endTime);

}

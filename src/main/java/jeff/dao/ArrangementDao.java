package jeff.dao;

import jeff.vo.ArrangementVo;

import java.sql.Timestamp;
import java.util.List;

public interface ArrangementDao {
    /**
     * List the arrangements of a time period
     *
     */
    List<ArrangementVo> list(Timestamp beginTime, Timestamp endTime);

    /**
     * find the list of published arrangement of a staff for a time period
     *
     */
    List<ArrangementVo> findStaffPublish(String staffId, Timestamp beginTime, Timestamp endTime);

    /**
     * find the list of all arrangement of a staff for a time period
     *
     */
    List<ArrangementVo> findStaffAll(String staffId, Timestamp beginTime, Timestamp endTime);

    /**
     * delete arrangement of a time period
     *
     */
    void delete(Timestamp beginTime, Timestamp endTime);

    /**
     * delete arrangement of a staff
     *
     */
    void deleteOfStaff(String staffId, Timestamp beginTime, Timestamp endTime);

    /**
     * put in an arrangement
     *
     */
    void put(List<ArrangementVo> newRecords);

    /**
     * publish arrangements of a time period
     *
     */
    void publishArrangements(Timestamp beginTime, Timestamp endTime);

    /**
     * revoke arrangements of a time period
     *
     */
    void revokeArrangements(Timestamp beginTime, Timestamp endTime);

    /**
     * generate new id
     *
     *
     */
    String generateNewId();

    /**
     * check whether the arrangement of week is published
     *
     *
     */
    String checkPublish(String week);

    /**
     * check whether the arrangement of week is published
     *
     *
     */
    List<String> getArrangementStatus(Timestamp beginTime, Timestamp endTime);

    /**
     * delete arrangements of a place
     *
     *
     */
    void deleteByPlace(String place, Timestamp beginTime, Timestamp endTime);
}

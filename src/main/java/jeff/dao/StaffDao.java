package jeff.dao;

import jeff.dto.StaffDto;
import jeff.entity.StaffEntity;

import java.util.List;

public interface StaffDao {
    /**
     * List all the staffs
     *
     */
    List<StaffDto> list();

    /**
     * Get staff inform by id
     *
     */
    StaffEntity getStaff(String staffId);

    /**
     * Get staff place by id
     *
     */
    String getStaffPlace(String staffId);

    /**
     * Get staff name by id
     *
     */
    String getStaffName(String staffId);

    /**
     * Insert new staff
     *
     */
    void insert(StaffDto newStaff);

    /**
     * get staffs id
     *
     */
    List<String> getStaffsId();

    /**
     * delete staffs by id
     *
     */
    void deleteById(String staffId);
}

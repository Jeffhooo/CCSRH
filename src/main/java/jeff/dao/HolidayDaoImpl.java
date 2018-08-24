package jeff.dao;

import jeff.dto.HolidayDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public class HolidayDaoImpl implements HolidayDao{
    private JdbcTemplate template;

    @Autowired
    public HolidayDaoImpl(JdbcTemplate template) {
        this.template = template;
    }

    private static final String SELECT_SQL = "select * from holidays where begin_time <= ? and end_time >= ? order by begin_time";
    private static final String SELECT_ALL_SQL = "select * from holidays order by begin_time";
    private static final String INSERT_SQL = "insert into holidays values(?, ?, ?, ?, ?)";
    private static final String SELECT_IDS_SQL = "select id from holidays";
    private static final String DELETE_SQL = "delete from holidays where id = ?";

    @Override
    public List<HolidayDto> getHolidays(Timestamp beginTime, Timestamp endTime) {
        return template.query(SELECT_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                        ps.setTimestamp(2, endTime);},
                (rs, rowNum) -> new HolidayDto(rs.getString(1),
                                               rs.getString(2),
                                               rs.getString(3),
                                               rs.getTimestamp(4),
                                               rs.getTimestamp(5)));
    }

    @Override
    public List<HolidayDto> getAllHolidays() {
        return template.query(SELECT_ALL_SQL,
                ps -> {},
                (rs, rowNum) -> new HolidayDto(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5)));
    }

    @Override
    public void insertNewHoliday(HolidayDto holidayDto) {
        template.update(INSERT_SQL, ps -> {
            ps.setString(1, holidayDto.getId());
            ps.setString(2, holidayDto.getName());
            ps.setString(3, holidayDto.getPlace());
            ps.setTimestamp(4, holidayDto.getBeginTime());
            ps.setTimestamp(5, holidayDto.getEndTime());
        });
    }

    @Override
    public List<String> getHolidayIds() {
        return template.query(SELECT_IDS_SQL, ps -> {}, (rs, rowNum) -> rs.getString(1));
    }

    @Override
    public void deleteById(String holidayId) {
        template.update(DELETE_SQL, ps -> ps.setString(1, holidayId));
    }
}

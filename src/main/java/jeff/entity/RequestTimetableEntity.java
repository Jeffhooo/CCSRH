package jeff.entity;

import lombok.Data;

@Data
public class RequestTimetableEntity {
    private String title;
    private String staffId;
    private String beginTime;
    private String endTime;
}

package jeff.entity;

import lombok.Data;

import java.util.List;

@Data
public class UpdateArrangementEntity {
    private List<String> staffIds;
    private String beginTime;
    private String endTime;
}

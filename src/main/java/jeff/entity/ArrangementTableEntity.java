package jeff.entity;

import lombok.Data;

import java.util.List;

@Data
public class ArrangementTableEntity {
    private List<String> days;
    private List<String> times;
    private List<List<StaffEntity>> content;

    public ArrangementTableEntity(List<String> days, List<String> times, List<List<StaffEntity>> content) {
        this.days = days;
        this.times = times;
        this.content = content;
    }

    public ArrangementTableEntity() {}
}

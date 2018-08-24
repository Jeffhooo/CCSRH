package jeff.entity;

import lombok.Data;

import java.util.List;

@Data
public class TimetableEntity {
    private List<String> days;
    private List<String> times;
    private List<String> content;
}

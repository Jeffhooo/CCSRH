package jeff.entity;

import lombok.Data;

import java.util.List;

@Data
public class RequestCheckSettingsEntity {
    String workdays;
    List<String> languages;
}

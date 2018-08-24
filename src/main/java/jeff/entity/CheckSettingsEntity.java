package jeff.entity;

import lombok.Data;

import java.util.List;

@Data
public class CheckSettingsEntity {
    private String workdays;
    private List<String> languages;

    public CheckSettingsEntity(String workdays, List<String> languages) {
        this.workdays = workdays;
        this.languages = languages;
    }

    public CheckSettingsEntity() {}
}

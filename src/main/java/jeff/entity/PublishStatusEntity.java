package jeff.entity;

import lombok.Data;

@Data
public class PublishStatusEntity {
    private String hasPublished;
    private String hasUnpublished;

    public PublishStatusEntity(String hasPublished, String hasUnpublished) {
        this.hasPublished = hasPublished;
        this.hasUnpublished = hasUnpublished;
    }
}

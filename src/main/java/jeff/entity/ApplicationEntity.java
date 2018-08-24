package jeff.entity;

import lombok.Data;

@Data
public class ApplicationEntity {
    private String applicationId;
    private String staffId;
    private String staffName;
    private String applyReason;
    private String beginTime;
    private String endTime;
    private String result;
    private String comment;

    public ApplicationEntity(String applicationId,
                             String staffId,
                             String staffName,
                             String applyReason,
                             String beginTime,
                             String endTime,
                             String result,
                             String comment) {
        this.applicationId = applicationId;
        this.staffId = staffId;
        this.staffName = staffName;
        this.applyReason = applyReason;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.result = result;
        this.comment = comment;
    }
}

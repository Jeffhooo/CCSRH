package jeff.vo;

import lombok.Getter;

import java.sql.Timestamp;

@Getter
public final class ApplicationVo {
    private final String applicationId;
    private final String applicantId;
    private final String applicantName;
    private final String applyReason;
    private final Timestamp beginTime;
    private final Timestamp endTime;
    private final String result;
    private final String comment;

    public static class Builder {
        private String applicationId;
        private String applicantId;
        private String applicantName;
        private String applyReason;
        private Timestamp beginTime;
        private Timestamp endTime;
        private String result;
        private String comment;

        public Builder applicationId(String applicationId) {
            this.applicationId = applicationId;
            return this;
        }

        public Builder applicantId(String applicantId) {
            this.applicantId = applicantId;
            return this;
        }

        public Builder applicantName(String applicantName) {
            this.applicantName = applicantName;
            return this;
        }

        public Builder applyReason(String applyReason) {
            this.applyReason = applyReason;
            return this;
        }

        public Builder beginTime(Timestamp beginTime) {
            this.beginTime = beginTime;
            return this;
        }

        public Builder endTime(Timestamp endTime) {
            this.endTime = endTime;
            return this;
        }

        public Builder result(String result) {
            this.result = result;
            return this;
        }

        public Builder comment(String comment) {
            this.comment = comment;
            return this;
        }

        public ApplicationVo build() {
            return new ApplicationVo(this);
        }

    }

    private ApplicationVo(Builder builder) {
        this.applicationId = builder.applicationId;
        this.applicantId = builder.applicantId;
        this.applicantName = builder.applicantName;
        this.applyReason = builder.applyReason;
        this.beginTime = builder.beginTime;
        this.endTime = builder.endTime;
        this.result = builder.result;
        this.comment = builder.comment;
    }
}

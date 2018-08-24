package jeff.vo;

import lombok.Getter;

import java.sql.Timestamp;

@Getter
public class HolidayVo {
    private final String id;
    private final String name;
    private final String place;
    private final Timestamp beginTime;
    private final Timestamp endTime;

    public static class Builder {
        private String id;
        private String name;
        private String place;
        private Timestamp beginTime;
        private Timestamp endTime;

        public Builder id(String id) {
            this.id = id;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder place(String place) {
            this.place = place;
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

        public HolidayVo build() {
            return new HolidayVo(this);
        }
    }

    private HolidayVo(Builder builder) {
        this.id = builder.id;
        this.name = builder.name;
        this.place = builder.place;
        this.beginTime = builder.beginTime;
        this.endTime = builder.endTime;
    }
}

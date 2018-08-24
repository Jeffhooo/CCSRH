package jeff.vo;

import lombok.Getter;

@Getter
public class StaffVo {
    private final String id;
    private final String name;
    private final String place;
    private final String language1;
    private final String language2;

    public static class Builder {
        private String id;
        private String name;
        private String place;
        private String language1;
        private String language2;

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

        public Builder language1(String language1) {
            this.language1 = language1;
            return this;
        }

        public Builder language2(String language2) {
            this.language2 = language2;
            return this;
        }

        public StaffVo build() {
            return new StaffVo(this);
        }

    }

    private StaffVo(Builder builder) {
        this.id = builder.id;
        this.name = builder.name;
        this.place = builder.place;
        this.language1 = builder.language1;
        this.language2 = builder.language2;
    }

}

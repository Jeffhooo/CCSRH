package jeff.entity;

import lombok.Data;

@Data
public class MessageEntity {
    private String msg;

    public MessageEntity(String msg) {
        this.msg = msg;
    }
}

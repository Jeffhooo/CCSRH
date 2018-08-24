package jeff.util;

import java.util.List;

public class NewIdUtil {
    public static String generateNewId(List<String> idList) {
        int maxId = 0;
        for(String id : idList) {
            int i = Integer.parseInt(id);
            maxId = (i > maxId)? i : maxId;
        }
        return Integer.toString(maxId+1);
    }
}

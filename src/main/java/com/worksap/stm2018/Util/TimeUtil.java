package com.worksap.stm2018.Util;

import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class TimeUtil {
    public static String timestampToString(Timestamp ts) {
        Date date = new Date();
        date.setTime(ts.getTime());
        return new SimpleDateFormat("yyyy-mm-dd hh:mm:ss").format(date);
    }
}

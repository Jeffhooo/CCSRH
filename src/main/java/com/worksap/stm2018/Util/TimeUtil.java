package com.worksap.stm2018.Util;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class TimeUtil {
    public static String timestampToString(Timestamp ts) {
        Date date = new Date();
        date.setTime(ts.getTime());
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    }

    public static Timestamp StringToTimestamp(String tString) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date;
            date = dateFormat.parse(tString);
            return new Timestamp(date.getTime());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Date StringToDate(String tString) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return dateFormat.parse(tString);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Date AddOneDay(Date date) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE,1); //把日期往后增加一天,整数  往后推,负数往前移动
        return calendar.getTime(); //这个时间就是日期往后推一天的结果
    }

    public static Date AddHours(Date date, int hours) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.HOUR, hours);
        return calendar.getTime();
    }

    public static String DateToString(Date date) {
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }
}

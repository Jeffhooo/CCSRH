package com.worksap.stm2018.Util;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.List;

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

    public static void tableDays(List<String> days, Date beginDate) {
        Date curDate = beginDate;
        for(int i = 0; i < 7; i++) {
            days.add(TimeUtil.DateToString(curDate));
            curDate = TimeUtil.AddOneDay(curDate);
        }
    }

    public static void tableTimes(String staffPlace, List<String> times) {
        if(staffPlace.equals("Asia/Shanghai") || staffPlace.equals("Asia/Singapore")) {
            times.add("8:00-16:00");
            times.add("16:00-23:00");
        } else if(staffPlace.equals("Asia/Tokyo")){
            times.add("9:00-17:00");
            times.add("17:00-24:00");
        }
    }

    public static int getWorkTime(String staffPlace) {
        int workTimeOfPlace;
        if(staffPlace.equals("Asia/Shanghai") || staffPlace.equals("Asia/Singapore")) {
            workTimeOfPlace = 8;
        } else if(staffPlace.equals("Asia/Tokyo")){
            workTimeOfPlace = 8;
        } else {
            workTimeOfPlace = 8;
        }
        return workTimeOfPlace;
    }
}

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-15
  Time: 下午5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="webjars/jquery/3.3.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
    <style>
        .table-bordered td{
            text-align: center;
            width: 100px;
            height: 150px;
        }
        .table-bordered th{
            text-align: center;
            width: 100px;
            height: 50px;
        }
        .container {
            margin-top: 5%;
            margin-left: 15%;
            margin-right: auto;
            margin-bottom: auto;
        }
        #logOut {
            margin-left: 360px;
        }
        #buttons {
            margin-top: 5px;
        }
    </style>
    <title>Staff</title>
</head>
<body>
<div class="container">
    <div id="userId" hidden>${userId}</div>
    <div id="newMessage" hidden></div>
    <p id="buttons">
        <button id="lastWeek" type="button" class="btn btn-primary">Last Week</button>
        <button id="nextWeek" type="button" class="btn btn-primary">Next Week</button>
        <button id="apply" type="button" class="btn btn-primary">Rest Time Applications</button>
        <button id="logOut" type="button" class="btn btn-primary">Log Out</button>
    </p>

    <table class="table-bordered" id="timetable">
        <thead>
        <tr>
            <th></th>
            <th id="day1"></th>
            <th id="day2"></th>
            <th id="day3"></th>
            <th id="day4"></th>
            <th id="day5"></th>
            <th id="day6"></th>
            <th id="day7"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td id="time1"></td>
            <td id="content1"></td>
            <td id="content3"></td>
            <td id="content5"></td>
            <td id="content7"></td>
            <td id="content9"></td>
            <td id="content11"></td>
            <td id="content13"></td>
        </tr>
        <tr>
            <td id="time2"></td>
            <td id="content2"></td>
            <td id="content4"></td>
            <td id="content6"></td>
            <td id="content8"></td>
            <td id="content10"></td>
            <td id="content12"></td>
            <td id="content14"></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        var userId = $("#userId").text();
        var loadBeginDate = [];
        loadBeginDate[0] = "2018-8-13";
        loadBeginDate[1] = "2018-8-20";
        loadBeginDate[2] = "2018-8-27";
        var loadEndDate = [];
        loadEndDate[0] = "2018-8-20";
        loadEndDate[1] = "2018-8-27";
        loadEndDate[2] = "2018-9-3";
        var curIndex = 1;
        var maxIndex = 2;
        var minIndex = 0;
        var nextWeekPublish;
        var $days = [];
        $days[0] = $("#day1");
        $days[1] = $("#day2");
        $days[2] = $("#day3");
        $days[3] = $("#day4");
        $days[4] = $("#day5");
        $days[5] = $("#day6");
        $days[6] = $("#day7");

        var $times = [];
        $times[0] = $("#time1");
        $times[1] = $("#time2");

        var $contents = [];
        $contents[0] = $("#content1");
        $contents[1] = $("#content2");
        $contents[2] = $("#content3");
        $contents[3] = $("#content4");
        $contents[4] = $("#content5");
        $contents[5] = $("#content6");
        $contents[6] = $("#content7");
        $contents[7] = $("#content8");
        $contents[8] = $("#content9");
        $contents[9] = $("#content10");
        $contents[10] = $("#content11");
        $contents[11] = $("#content12");
        $contents[12] = $("#content13");
        $contents[13] = $("#content14");

        function loadStaffTimetable(userId, begin, end) {
            var loadPage = {
                title:"Staff",
                staffId:userId,
                beginTime:begin,
                endTime:end
            };
            $.ajax({
                url: "loadStaffTimetable",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(loadPage),
                dataType: "json",
                success: function(timetable) {
                    var days = timetable.days;
                    $.each(days, function (i, day) {
                        $days[i].text(day);
                    });
                    var times = timetable.times;
                    $.each(times, function (i, time) {
                        $times[i].text(time);
                    });
                    var contents = timetable.content;
                    $.each(contents, function (i, content) {
                        $contents[i].text(content);
                    });
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("load staff timetable error.");
                }
            });
        }
        loadStaffTimetable(userId, loadBeginDate[curIndex], loadEndDate[curIndex]);

        function checkPublish() {
            $.ajax({
                url: "checkPublish",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(3),
                dataType: "json",
                success: function (Message) {
                    nextWeekPublish = Message.msg;
                    if(nextWeekPublish == "published") {
                        var $newMessage = $("#newMessage");
                        $newMessage.text("New Message: Timetable of next week has been published.");
                        $newMessage.show();
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("checkPublish error.");
                }
            });
        }
        checkPublish();

        $("#lastWeek").click(function () {
            if(curIndex > minIndex) {
                curIndex--;
                loadStaffTimetable(userId, loadBeginDate[curIndex], loadEndDate[curIndex]);
            } else {
                alert("No more history.");
            }
        });

        function loadNextWeekArrangement() {
            var loadArrangement = {
                title:"Staff",
                staffId:userId,
                beginTime:loadBeginDate[curIndex],
                endTime:loadEndDate[curIndex]
            };
            $.ajax({
                url: "loadNextWeekArrangement",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(loadArrangement),
                dataType: "json",
                success: function(timetable) {
                    var days = timetable.days;
                    $.each(days, function (i, day) {
                        $days[i].text(day);
                    });
                    var times = timetable.times;
                    $.each(times, function (i, time) {
                        $times[i].text(time);
                    });
                    var contents = timetable.content;
                    $.each(contents, function (i, content) {
                        $contents[i].text(content);
                    });
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("load next week arrangement error.");
                }
            });
        }

        $("#nextWeek").click(function () {
            if(curIndex < maxIndex) {
                if(curIndex == maxIndex-1) {
                    if(nextWeekPublish == "published") {
                        curIndex++;
                        loadNextWeekArrangement();
                    } else {
                        alert("No new arrangement.")
                    }
                } else {
                    curIndex++;
                    loadStaffTimetable(userId, loadBeginDate[curIndex], loadEndDate[curIndex]);
                }
            } else {
                alert("No new arrangement.")
            }
        });

        $("#logOut").click(function (event) {
            if(confirm("Are you sure to log out?")) {
                window.location.href = "/";
            }
            event.preventDefault();
        });

        $("#apply").click(function (event) {
            window.location.href = "applyHistory${userId}";
            event.preventDefault();
        });
    });
</script>
</html>

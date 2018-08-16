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
            margin-top: 10%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
    </style>
    <title>Staff</title>
</head>
<body>
<div class="container">
    <div id="userId" hidden>${userId}</div>
    <p id="buttons">
        <button id="lastWeek" type="button" class="btn btn-primary">Last Week</button>
        <button id="nextWeek" type="button" class="btn btn-primary">Next Week</button>
        <button type="button" class="btn btn-primary" onclick="window.location.href = 'apply${userId}'">Apply Special Rest Time</button>
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
        var loadBeginDate = new Array();
        loadBeginDate[0] = "2018-8-13"
        loadBeginDate[1] = "2018-8-20"
        var loadEndDate = new Array();
        loadEndDate[0] = "2018-8-20"
        loadEndDate[1] = "2018-8-27"
        var curIndex = 1;
        var maxIndex = 1;
        var minIndex = 0;

        loadStaffTimetable(userId, loadBeginDate[curIndex], loadEndDate[curIndex]);

        $("#lastWeek").click(function () {
            if(curIndex > minIndex) {
                curIndex--;
                loadStaffTimetable(userId, loadBeginDate[curIndex], loadEndDate[curIndex]);
            }
        });

        $("#nextWeek").click(function () {
            if(curIndex < maxIndex) {
                curIndex++;
                loadStaffTimetable(userId, loadBeginDate[curIndex], loadEndDate[curIndex]);
            }
        });

        function loadStaffTimetable(userId, begin, end) {
            var loadPage = {staffId:userId, beginTime:begin, endTime:end };
            $.ajax({
                url: "loadStaffTimetable",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(loadPage),
                dataType: "json",
                success: function(timetable) {
                    var days = timetable.days;
                    $("#day1").text(days[0]);
                    $("#day2").text(days[1]);
                    $("#day3").text(days[2]);
                    $("#day4").text(days[3]);
                    $("#day5").text(days[4]);
                    $("#day6").text(days[5]);
                    $("#day7").text(days[6]);

                    var times = timetable.times;
                    $("#time1").text(times[0]);
                    $("#time2").text(times[1]);

                    var content = timetable.content;
                    $("#content1").text(content[0]);
                    $("#content2").text(content[1]);
                    $("#content3").text(content[2]);
                    $("#content4").text(content[3]);
                    $("#content5").text(content[4]);
                    $("#content6").text(content[5]);
                    $("#content7").text(content[6]);
                    $("#content8").text(content[7]);
                    $("#content9").text(content[8]);
                    $("#content10").text(content[9]);
                    $("#content11").text(content[10]);
                    $("#content12").text(content[11]);
                    $("#content13").text(content[12]);
                    $("#content14").text(content[13]);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("load staff timetable error.");
                }
            });
        }
    });
</script>
</html>

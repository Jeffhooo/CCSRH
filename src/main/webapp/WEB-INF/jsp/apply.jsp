<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-16
  Time: 上午8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="webjars/jquery/3.3.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
    <style>
        #timetable td{
            width: 100px;
            height: 150px;
            text-align: center;
        }
        #timetable th{
            width: 100px;
            height: 50px;
            text-align: center;
        }
        .container {
            margin-top: 5%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #applyReasonHeader{
            margin-top: 50px
        }
        #applyReason {
            width: 800px;
            height: 100px;
            text-align: left;
        }
        #buttons {
            margin-top: 10px;
        }
    </style>
    <title>Apply</title>
</head>
<body>
<div class="container">
    <div id="userId" hidden>${userId}</div>
    <form class="form-signin" id="applicationForm">
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
        </table>

        <h2 class="form-signin-heading" id="applyTimeHeader">Apply time:</h2>
        <div id="applyTime"></div>
        <h2 class="form-signin-heading" id="applyReasonHeader">Apply reason:</h2>
        <label for="applyReason" class="sr-only">Apply Reason</label>
        <textarea type="text" id="applyReason" class="form-control" name = "applyReason" placeholder="Apply Reason"></textarea>
        <p id="buttons">
            <button class="btn btn-primary" id="submit" type="submit">Submit</button>
            <button class="btn btn-primary" id="back" type="button" onclick="history.go(-1);">Back</button>
        </p>
    </form>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        var userId = $("#userId").text();
        var loadBeginDate = new Array();
        loadBeginDate[0] = "2018-8-27"
        var loadEndDate = new Array();
        loadEndDate[0] = "2018-9-3"
        var curIndex = 0;
        var maxIndex = 0;
        var minIndex = 0;
        var applyBeginTimeMap = {};
        var applyEndTimeMap = {};
        var workTime = new Array();
        workTime[0] = "08:00:00";
        workTime[1] = "16:00:00";
        workTime[2] = "23:00:00";
        var chooseContent;


        loadApplicationTimetable(userId, loadBeginDate[curIndex], loadEndDate[curIndex]);

        function loadApplicationTimetable(userId, beginTime, endTime) {
            var loadPage = {staffId:userId, beginTime:beginTime, endTime:endTime };
            $.ajax({
                url: "loadApplicationTimetable",
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
                    if(times[0] == "9:00-17:00") {
                        workTime[0] = "09:00:00";
                        workTime[1] = "17:00:00";
                        workTime[2] = "24:00:00";
                    }

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

                    applyBeginTimeMap["content1"] = $("#day1").text() + " " + workTime[0];
                    applyBeginTimeMap["content2"] = $("#day1").text() + " " + workTime[1];
                    applyBeginTimeMap["content3"] = $("#day2").text() + " " + workTime[0];
                    applyBeginTimeMap["content4"] = $("#day2").text() + " " + workTime[1];
                    applyBeginTimeMap["content5"] = $("#day3").text() + " " + workTime[0];
                    applyBeginTimeMap["content6"] = $("#day3").text() + " " + workTime[1];
                    applyBeginTimeMap["content7"] = $("#day4").text() + " " + workTime[0];
                    applyBeginTimeMap["content8"] = $("#day4").text() + " " + workTime[1];
                    applyBeginTimeMap["content9"] = $("#day5").text() + " " + workTime[0];
                    applyBeginTimeMap["content10"] = $("#day5").text() + " " + workTime[1];
                    applyBeginTimeMap["content11"] = $("#day6").text() + " " + workTime[0];
                    applyBeginTimeMap["content12"] = $("#day6").text() + " " + workTime[1];
                    applyBeginTimeMap["content13"] = $("#day7").text() + " " + workTime[0];
                    applyBeginTimeMap["content14"] = $("#day7").text() + " " + workTime[1];

                    applyEndTimeMap["content1"] = $("#day1").text() + " " + workTime[1];
                    applyEndTimeMap["content2"] = $("#day1").text() + " " + workTime[2];
                    applyEndTimeMap["content3"] = $("#day2").text() + " " + workTime[1];
                    applyEndTimeMap["content4"] = $("#day2").text() + " " + workTime[2];
                    applyEndTimeMap["content5"] = $("#day3").text() + " " + workTime[1];
                    applyEndTimeMap["content6"] = $("#day3").text() + " " + workTime[2];
                    applyEndTimeMap["content7"] = $("#day4").text() + " " + workTime[1];
                    applyEndTimeMap["content8"] = $("#day4").text() + " " + workTime[2];
                    applyEndTimeMap["content9"] = $("#day5").text() + " " + workTime[1];
                    applyEndTimeMap["content10"] = $("#day5").text() + " " + workTime[2];
                    applyEndTimeMap["content11"] = $("#day6").text() + " " + workTime[1];
                    applyEndTimeMap["content12"] = $("#day6").text() + " " + workTime[2];
                    applyEndTimeMap["content13"] = $("#day7").text() + " " + workTime[1];
                    applyEndTimeMap["content14"] = $("#day7").text() + " " + workTime[2];

                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("load applications timetable error.");
                }
            });
        }

        $("td").click(function () {
            $("td").css("background-color", "#FFFFFF");
            $("td").css("color", "#000000");
            var contentId = $(this).attr("id");
            if((contentId !== "time1") && (contentId !== "time2")) {
                $(this).css("background-color", "#0066AA");
                $(this).css("color", "#FFFFFF");
                $("#applyTime").text(applyBeginTimeMap[contentId] + " - " + applyEndTimeMap[contentId]);
                chooseContent = contentId;
            }
        })

        $("#submit").click(function (event) {
            var application = {staffId: userId, applyReason: $("#applyReason").val(),
                beginTime: applyBeginTimeMap[chooseContent], endTime: applyEndTimeMap[chooseContent]};
            $.ajax({
                url: "submitApplication",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(application),
                dataType: "json",
                success: function (Message) {
                    alert(Message.msg);
                    history.go(-1);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("Submit application error.");
                }
            });
            event.preventDefault();
        })
    });
</script>
</html>

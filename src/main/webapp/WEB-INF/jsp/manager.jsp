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
        #timetable td{
            text-align: center;
            width: 100px;
            height: 150px;
            word-break:break-all;
        }
        #timetable th{
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
        #leftBlock {
            float: left;
        }
        #rightBlock {
            margin-left: 900px;
            margin-top: 40px;
        }
    </style>
    <title>Manager</title>
</head>
<body>
<div class="container">

        <div id="leftBlock">
            <div id="userId" hidden>${userId}</div>
            <p id="buttons">
                <button id="approveApplication" type="button" class="btn btn-primary">Approve application</button>
                <button id="publish" type="button" class="btn btn-primary">Pulish</button>
            </p>
            <table class="table-bordered" id="timetable">
                <thead>
                <tr>
                    <th></th>
                    <th id="day1">2018-8-27</th>
                    <th id="day2">2018-8-28</th>
                    <th id="day3">2018-8-29</th>
                    <th id="day4">2018-8-30</th>
                    <th id="day5">2018-8-31</th>
                    <th id="day6">2018-9-1</th>
                    <th id="day7">2018-9-2</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td id="time1">8:00-16:00</td>
                    <td id="content1"></td>
                    <td id="content3"></td>
                    <td id="content5"></td>
                    <td id="content7"></td>
                    <td id="content9"></td>
                    <td id="content11"></td>
                    <td id="content13"></td>
                </tr>
                <tr>
                    <td id="time2">16:00-23:00</td>
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
        <div id="rightBlock">
            <table class="table-bordered" id="staffTable">
                <thead>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#approveApplication").click(function () {
            window.location.href = "approveApplication"
        });
        var beginTime = "2018-8-27";
        var endTime = "2018-9-3";
        var load = {beginTime: beginTime, endTime: endTime};
        var curArrangement;
        var chooseContent;
        var workTime = new Array();
        workTime[0] = "08:00:00";
        workTime[1] = "16:00:00";
        workTime[2] = "23:00:00";

        var contents = new Array();
        contents[0] = $("#content1");
        contents[1] = $("#content2");
        contents[2] = $("#content3");
        contents[3] = $("#content4");
        contents[4] = $("#content5");
        contents[5] = $("#content6");
        contents[6] = $("#content7");
        contents[7] = $("#content8");
        contents[8] = $("#content9");
        contents[9] = $("#content10");
        contents[10] = $("#content11");
        contents[11] = $("#content12");
        contents[12] = $("#content13");
        contents[13] = $("#content14");

        var days = new Array();
        days[0] = $("#day1");
        days[1] = $("#day2");
        days[2] = $("#day3");
        days[3] = $("#day4");
        days[4] = $("#day5");
        days[5] = $("#day6");
        days[6] = $("#day7");

        var applyBeginTimeMap = {};
        var applyEndTimeMap = {};
        applyBeginTimeMap["content1"] = days[0].text() + " " + workTime[0];
        applyBeginTimeMap["content2"] = days[0].text() + " " + workTime[1];
        applyBeginTimeMap["content3"] = days[1].text() + " " + workTime[0];
        applyBeginTimeMap["content4"] = days[1].text() + " " + workTime[1];
        applyBeginTimeMap["content5"] = days[2].text() + " " + workTime[0];
        applyBeginTimeMap["content6"] = days[2].text() + " " + workTime[1];
        applyBeginTimeMap["content7"] = days[3].text() + " " + workTime[0];
        applyBeginTimeMap["content8"] = days[3].text() + " " + workTime[1];
        applyBeginTimeMap["content9"] = days[4].text() + " " + workTime[0];
        applyBeginTimeMap["content10"] = days[4].text() + " " + workTime[1];
        applyBeginTimeMap["content11"] = days[5].text() + " " + workTime[0];
        applyBeginTimeMap["content12"] = days[5].text() + " " + workTime[1];
        applyBeginTimeMap["content13"] = days[6].text() + " " + workTime[0];
        applyBeginTimeMap["content14"] = days[6].text() + " " + workTime[1];

        applyEndTimeMap["content1"] = days[0].text() + " " + workTime[1];
        applyEndTimeMap["content2"] = days[0].text() + " " + workTime[2];
        applyEndTimeMap["content3"] = days[1].text() + " " + workTime[1];
        applyEndTimeMap["content4"] = days[1].text() + " " + workTime[2];
        applyEndTimeMap["content5"] = days[2].text() + " " + workTime[1];
        applyEndTimeMap["content6"] = days[2].text() + " " + workTime[2];
        applyEndTimeMap["content7"] = days[3].text() + " " + workTime[1];
        applyEndTimeMap["content8"] = days[3].text() + " " + workTime[2];
        applyEndTimeMap["content9"] = days[4].text() + " " + workTime[1];
        applyEndTimeMap["content10"] = days[4].text() + " " + workTime[2];
        applyEndTimeMap["content11"] = days[5].text() + " " + workTime[1];
        applyEndTimeMap["content12"] = days[5].text() + " " + workTime[2];
        applyEndTimeMap["content13"] = days[6].text() + " " + workTime[1];
        applyEndTimeMap["content14"] = days[6].text() + " " + workTime[2];

        $.ajax({
            url: "loadArrangement",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(load),
            dataType: "json",
            success: function (arrangements) {
                curArrangement = arrangements;
                $.each(arrangements, function (i, arrangement) {
                    var content = "";
                    var length = arrangement.content.length;
                    $.each(arrangement.content, function (j, staff) {
                        content += staff.name;
                        if(j < length-1) {
                            content += "</br>";
                        }
                    });
                    contents[i].html(content);
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("loadArrangement error.");
            }
        });

        $("#timetable td").click(function (event) {
            $("td").css("background-color", "#FFFFFF");
            $("td").css("color", "#000000");
            var contentId = $(this).attr("id");
            if((contentId !== "time1") && (contentId !== "time2")) {
                $(this).css("background-color", "#0066AA");
                $(this).css("color", "#FFFFFF");
                chooseContent = contentId;
                var loadStaffs = {beginTime: applyBeginTimeMap[chooseContent], endTime: applyBeginTimeMap[chooseContent]};
                $.ajax({
                    url: "loadStaffs",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(loadStaffs),
                    dataType: "json",
                    success: function (staffs) {
                        $("#staffTable tbody").empty();
                        $.each(staffs, function (i, staff) {
                            var tr = "<tr id=\"" + staff.id +"\">" +
                                "<td style=\"width: 40px; height: 100px; text-align: center\"><input type=\"checkbox\"/></td>" +
                                "<td style=\"width: 160px; height: 100px\">" +
                                staff.name + "<br/>" +
                                staff.place + "<br/>" +
                                staff.language1 + "<br/>" +
                                staff.language2 + "</td></tr>";
                            $("#staffTable").append(tr);
                        })
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("loadStaffs error.");
                    }
                });
            }
            event.preventDefault();
        })
    })
</script>
</html>

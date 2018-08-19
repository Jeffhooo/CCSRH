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
            margin-top: 5%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #leftBlock {
            float: left;
        }
        #rightBlock {
            margin-left: 900px;
            margin-top: 45px;
        }
        #logOut {
            float: right;
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
                <button id="save" type="button" class="btn btn-primary">Save</button>
                <button id="check" type="button" class="btn btn-primary">Check</button>
                <button id="publish" type="button" class="btn btn-primary">Publish</button>
                <button id="revoke" type="button" class="btn btn-primary">Revoke</button>
                <button id="logOut" type="button" class="btn btn-primary">Log Out</button>
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
        var workTime = [];
        workTime[0] = "08:00:00";
        workTime[1] = "16:00:00";
        workTime[2] = "23:00:00";

        var contents = [];
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

        var contentIndex = {};
        contentIndex[contents[0].attr("id")] = 0;
        contentIndex[contents[1].attr("id")] = 1;
        contentIndex[contents[2].attr("id")] = 2;
        contentIndex[contents[3].attr("id")] = 3;
        contentIndex[contents[4].attr("id")] = 4;
        contentIndex[contents[5].attr("id")] = 5;
        contentIndex[contents[6].attr("id")] = 6;
        contentIndex[contents[7].attr("id")] = 7;
        contentIndex[contents[8].attr("id")] = 8;
        contentIndex[contents[9].attr("id")] = 9;
        contentIndex[contents[10].attr("id")] = 10;
        contentIndex[contents[11].attr("id")] = 11;
        contentIndex[contents[12].attr("id")] = 12;
        contentIndex[contents[13].attr("id")] = 13;

        var days = [];
        days[0] = $("#day1");
        days[1] = $("#day2");
        days[2] = $("#day3");
        days[3] = $("#day4");
        days[4] = $("#day5");
        days[5] = $("#day6");
        days[6] = $("#day7");

        var times = [];
        times[0] = $("#time1");
        times[1] = $("#time2");

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
            if(checkboxChange == "yes") {

            }
            $("td").css("background-color", "#FFFFFF");
            $("td").css("color", "#000000");
            var contentId = $(this).attr("id");
            if((contentId !== "time1") && (contentId !== "time2")) {
                $(this).css("background-color", "#0066AA");
                $(this).css("color", "#FFFFFF");
                chooseContent = contentId;
                var loadStaffs = {beginTime: applyBeginTimeMap[chooseContent], endTime: applyEndTimeMap[chooseContent]};
                $.ajax({
                    url: "loadStaffs",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(loadStaffs),
                    dataType: "json",
                    success: function (staffs) {
                        $("#staffTable tbody").empty();
                        $.each(staffs, function (i, staff) {
                            var tr = "<tr id=\"" +
                                staff.id + "\"><td style=\"width: 40px; height: 100px; text-align: center\"><input type=\"checkbox\"/></td><td style=\"width: 160px; height: 100px;\"> Name: " +
                                staff.name + "<br/> Place: " +
                                staff.place + "<br/> Language: <br/>" +
                                staff.language1 + ", " +
                                staff.language2 + "</td><td hidden id=\"" +
                                staff.name + "\"></td></tr>";
                            $("#staffTable").append(tr);
                        });
                        var arrangement = curArrangement[contentIndex[chooseContent]];
                        $.each(arrangement.content, function (i, arrangeStaff) {
                            $("#staffTable").find("tr").each(function () {
                                if($(this).attr("id") == arrangeStaff.id) {
                                    $(this).find("input:checkbox").attr("checked", "true");
                                }
                            })
                        })
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("loadStaffs error.");
                    }
                });
            }
            event.preventDefault();
        });

        var checkboxChange = "no";
        $("#staffTable").on("change", "input", function (event) {
            checkboxChange = "yes";
            event.preventDefault();
        })

        $("#save").click(function () {
            var chooseStaffIds = [];
            $("#staffTable").find("tr").each(function () {
                if($(this).find("input:checkbox").is(":checked")) {
                    chooseStaffIds.push($(this).attr("id"));
                }
            });

            var sendArrangements = {
                staffIds: chooseStaffIds,
                beginTime: applyBeginTimeMap[chooseContent],
                endTime: applyEndTimeMap[chooseContent]
            };

            $.ajax({
                url: "updateArrangement",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(sendArrangements),
                dataType: "json",
                success: function (Message) {
                    alert(Message.msg);
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
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("updateArrangement error.");
                }
            })
        });

        $("#publish").click(function (event) {
            if(confirm("Are you sure to publish the arrangement?")) {
                var publishTime = {beginTime: beginTime, endTime: endTime};
                $.ajax({
                    url: "publish",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(publishTime),
                    dataType: "json",
                    success:function (Message) {
                        alert(Message.msg);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("publish error.");
                    }
                });
            }
            event.preventDefault();
        });

        $("#revoke").click(function (event) {
            if(confirm("Are you sure to revoke the arrangement?")) {
                var revodeTime = {beginTime: beginTime, endTime: endTime};
                $.ajax({
                    url: "revoke",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(revodeTime),
                    dataType: "json",
                    success:function (Message) {
                        alert(Message.msg);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("revoke error.");
                    }
                });
            }
            event.preventDefault();
        });

        $("#logOut").click(function (event) {
            if(confirm("Are you sure to log out?")) {
                window.location.href = "/";
            }
            event.preventDefault();
        });

        $("#staffTable").on("click", "td", function () {
            if($(this).attr("style") == "width: 160px; height: 100px;") {
                var href = "staffWorkHistory" + $(this).parent().attr("id");
                if(confirm("Do you want to view " + $(this).next("td").attr("id") + "\"s work history?")) {
                    window.location.href = href;
                }
            }
        });

        $("#check").click(function () {
            var report = "";
            var languageToIndex = {English: 0, Chinese: 1, Japanese: 2};
            var IndexToLanguage = ["English", "Chinese", "Japanese"];

            report += "Language Service Check: ";
            var languageReport = "";
            $.each(curArrangement, function (i, arrangement) {
                var time = days[Math.floor(i/2)].text() + " " + times[i%2].text();
                var checkList = ["no", "no", "no"];
                $.each(arrangement.content, function (j, staff) {
                    checkList[languageToIndex[staff.language1]] = "yes";
                    checkList[languageToIndex[staff.language2]] = "yes";
                });
                var lack = "";
                if(checkList[0] == "no") {
                    lack += " " + IndexToLanguage[0];
                }
                if(checkList[1] == "no") {
                    lack += " " + IndexToLanguage[1];
                }
                if(checkList[2] == "no") {
                    lack += " " + IndexToLanguage[2];
                }
                if(lack !== "") {
                    languageReport += time + ": Lack of" + lack + " service.\n";
                }
            });
            if(languageReport !== "") {
                report += "Fail\n" + languageReport + "\n\n";
            } else {
                report += "Pass\n\n";
            }

            report += "Busy Hours Check: ";
            var busyHourReport = "";
            $.each(curArrangement, function (i, arrangement) {
                if(i == 4 || i == 6) {
                    var time = days[Math.floor(i/2)].text() + " " + times[i%2].text();
                    if(arrangement.content.length < 3) {
                        busyHourReport += time + ": Less than 3 staff work at busy hours.\n";
                    }
                }
            });
            if(busyHourReport !== "") {
                report += "Fail\n" + busyHourReport +"\n\n";
            } else {
                report += "Pass\n\n"
            }

            report += "Over Work Check: ";
            var overWorkReport = "";
            var checkMap = {};
            var names = {};
            $.each(curArrangement, function (i, arrangement) {
                $.each(arrangement.content, function (j, staff) {
                    if(checkMap[staff.name] == null) {
                        checkMap[staff.name] = 1;
                    } else {
                        checkMap[staff.name] += 1;
                    }
                    names[staff.name] = staff.name;
                });
            });
            $.each(names, function (i, name) {
                if(checkMap[name] > 5) {
                    overWorkReport += name + " work for more than 5 days.\n";
                }
            });
            if(overWorkReport !== "") {
                report += " Fail\n" + overWorkReport + "\n\n";
            } else {
                report += " Pass\n\n";
            }
            alert(report);
        });
    })
</script>
</html>

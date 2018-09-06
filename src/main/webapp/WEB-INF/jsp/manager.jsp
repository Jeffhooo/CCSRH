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
        html{
            height:100%;
        }
        body{
            min-height:100%;
            margin:0;
            padding:0;
            position:relative;
        }
        footer{
            width: 1250px;
            position:absolute;
            bottom:0;
            margin-bottom: 5px;
            text-align: center;
        }
        .navbar {
            background-color: lightseagreen;
        }
        .navbar-brand {
            color: white;
        }
        #brand {
            color: white;
        }
        #help {
            color: white;
            margin-left: 250px;
        }
        #approveApplication, #staffManagement, #settings, #logOut {
            color: white;
        }
        .btn-primary {
            width: 70px;
            background-color: lightseagreen;
            border: lightseagreen;
        }
        .btn-primary:hover {
            background-color: mediumseagreen;
        }
        .btn-primary:visited {
            background-color: lightseagreen;
        }
        .nav > li > a:hover {
            background-color: mediumseagreen;
        }
        .nav > li > a:visited{
            background-color: lightseagreen;
        }
        #timetable td{
            text-align: center;
            width: 110px;
            height: 150px;
            word-break:break-all;
        }
        #timetable th{
            text-align: center;
            width: 110px;
            height: 50px;
        }
        .container {
            width: 1250px;
            margin-top: auto;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #leftBlock {
            float: left;
        }
        #rightBlock {
            margin-left: 900px;
        }
        #buttons {
            margin-top: 10%;
        }
        #bottomSpace {
            height: 100px;
        }
    </style>
    <title>Manager</title>
</head>
<body>
<div class="container">
    <!-- Fixed navbar -->
    <nav class="navbar navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" id="brand">Call Center Rostering Helper</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a id="approveApplication">Approve Applications</a></li>
                    <li><a id="staffManagement">Staff Management</a></li>
                    <li><a id="settings">Holiday & Check Settings</a></li>
                    <li><a id="help">Help</a></li>
                    <li><a id="logOut" data-toggle="modal" data-target="#LogOutModal">Log Out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <p id="buttons">
        <button id="save" type="button" class="btn btn-primary" data-toggle="modal" data-target="#saveModal">Save</button>
        <button id="check" type="button" class="btn btn-primary" >Check</button>
        <button id="publish" type="button" class="btn btn-primary" data-toggle="modal" data-target="#publishModal">Publish</button>
        <button id="revoke" type="button" class="btn btn-primary" data-toggle="modal" data-target="#revokeModal">Revoke</button>
    </p>

    <div>
        <div id="leftBlock">
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
        <div id="rightBlock">
            <table class="table-bordered" id="staffTable">
                <thead>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <div id="userId" hidden>${userId}</div>
    <div id="bottomSpace"></div>
    <footer class="copyright" id="footer">
        &copy; 2018 He Junfeng All Right Reserved
    </footer>
</div>

<div class="modal fade" id="LogOutModal" tabindex="-1" role="dialog" aria-labelledby="LogOutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="LogOutModalLabel">
                    Log Out
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to log out?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="logOutConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="saveModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="saveModalLabel">
                    Save
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to save changes?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="saveConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isSavedModal" tabindex="-1" role="dialog" aria-labelledby="isSavedModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isSavedModalLabel">
                    Save
                </h4>
            </div>
            <div class="modal-body">
                Arrangement is saved.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="askForSaveModal" tabindex="-1" role="dialog" aria-labelledby="askForSaveModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="askForSaveModalLabel">
                    Save
                </h4>
            </div>
            <div class="modal-body">
                You have change arrangement? Are you sure to save change?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="cancelAskForSave">Cancel</button>
                <button type="button" class="btn btn-primary" id="askForSaveConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="publishModal" tabindex="-1" role="dialog" aria-labelledby="publishModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="publishModalLabel">
                    Publish
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to publish arrangement?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="publishConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="revokeModal" tabindex="-1" role="dialog" aria-labelledby="revokeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="revokeModalLabel">
                    Revoke
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to revoke arrangement?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="revokeConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isPublishedModal" tabindex="-1" role="dialog" aria-labelledby="isPublishedModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isPublishedModalLabel">
                    Publish
                </h4>
            </div>
            <div class="modal-body">
                The arrangement is published.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isRevokedModal" tabindex="-1" role="dialog" aria-labelledby="isRevokedModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isRevokedModalLabel">
                    Revoke
                </h4>
            </div>
            <div class="modal-body">
                The arrangement is revoked.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="viewHistoryModal" tabindex="-1" role="dialog" aria-labelledby="viewHistoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="viewHistoryModalLabel">
                    View History
                </h4>
            </div>
            <div class="modal-body" id="viewHistoryModalBody">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="viewHistoryConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="checkReportModal" tabindex="-1" role="dialog" aria-labelledby="checkReportModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="checkReportModalLabel">
                    Check Report
                </h4>
            </div>
            <div class="modal-body" id="checkReportModalBody">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        var now = new Date(); //current date
        var nowDayOfWeek = now.getDay(); //the day number of this week
        var nowDay = now.getDate(); //current day
        var nowMonth = now.getMonth(); //current month
        var nowYear = now.getYear(); //current year
        nowYear += (nowYear < 2000) ? 1900 : 0; //

        //format date：yyyy-MM-dd
        function formatDate(date) {
            var myyear = date.getFullYear();
            var mymonth = date.getMonth()+1;
            var myweekday = date.getDate();

            if(mymonth < 10){
                mymonth = "0" + mymonth;
            }
            if(myweekday < 10){
                myweekday = "0" + myweekday;
            }
            return (myyear+"-"+mymonth + "-" + myweekday);
        }

        //get begin date of this week
        function getNextWeekBeginDate() {
            var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 7);
            return formatDate(weekStartDate);
        }

        //get end date of this week
        function getNextWeekEndDate() {
            var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 14);
            return formatDate(weekStartDate);
        }

        var beginTime = getNextWeekBeginDate();
        var endTime = getNextWeekEndDate();
        var load = {beginTime: beginTime, endTime: endTime};
        var curArrangement;
        var chooseContent;
        var workTime = [];
        workTime[0] = "08:00:00";
        workTime[1] = "16:00:00";
        workTime[2] = "23:00:00";

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

        var contentIndex = {};
        contentIndex[$contents[0].attr("id")] = 0;
        contentIndex[$contents[1].attr("id")] = 1;
        contentIndex[$contents[2].attr("id")] = 2;
        contentIndex[$contents[3].attr("id")] = 3;
        contentIndex[$contents[4].attr("id")] = 4;
        contentIndex[$contents[5].attr("id")] = 5;
        contentIndex[$contents[6].attr("id")] = 6;
        contentIndex[$contents[7].attr("id")] = 7;
        contentIndex[$contents[8].attr("id")] = 8;
        contentIndex[$contents[9].attr("id")] = 9;
        contentIndex[$contents[10].attr("id")] = 10;
        contentIndex[$contents[11].attr("id")] = 11;
        contentIndex[$contents[12].attr("id")] = 12;
        contentIndex[$contents[13].attr("id")] = 13;

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

        var applyBeginTimeMap = {};
        var applyEndTimeMap = {};

        var $languageCheckbox = {
            Chinese: $("#ChineseCheckbox"),
            English: $("#EnglishCheckbox"),
            Japanese: $("#JapaneseCheckbox")
        };

        var $publish = $("#publish");
        var $revoke = $("#revoke");

        function loadArrangement() {
            $.ajax({
                async:false,
                url: "loadArrangement",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(load),
                dataType: "json",
                success: function (arrangementTimetable) {
                    curArrangement = arrangementTimetable.content;
                    var days = arrangementTimetable.days;
                    $.each(days, function (i, day) {
                        $days[i].text(day);
                    });
                    var times = arrangementTimetable.times;
                    $.each(times, function (i, time) {
                        $times[i].text(time);
                    });
                    $.each(arrangementTimetable.content, function (i, arrangement) {
                        var nameList = "";
                        var length = arrangement.length;
                        $.each(arrangement, function (j, staff) {
                            nameList += staff.name;
                            if(j < length-1) {
                                nameList += "</br>";
                            }
                        });
                        $contents[i].html(nameList);
                        applyBeginTimeMap["content1"] = $days[0].text() + " " + workTime[0];
                        applyBeginTimeMap["content2"] = $days[0].text() + " " + workTime[1];
                        applyBeginTimeMap["content3"] = $days[1].text() + " " + workTime[0];
                        applyBeginTimeMap["content4"] = $days[1].text() + " " + workTime[1];
                        applyBeginTimeMap["content5"] = $days[2].text() + " " + workTime[0];
                        applyBeginTimeMap["content6"] = $days[2].text() + " " + workTime[1];
                        applyBeginTimeMap["content7"] = $days[3].text() + " " + workTime[0];
                        applyBeginTimeMap["content8"] = $days[3].text() + " " + workTime[1];
                        applyBeginTimeMap["content9"] = $days[4].text() + " " + workTime[0];
                        applyBeginTimeMap["content10"] = $days[4].text() + " " + workTime[1];
                        applyBeginTimeMap["content11"] = $days[5].text() + " " + workTime[0];
                        applyBeginTimeMap["content12"] = $days[5].text() + " " + workTime[1];
                        applyBeginTimeMap["content13"] = $days[6].text() + " " + workTime[0];
                        applyBeginTimeMap["content14"] = $days[6].text() + " " + workTime[1];

                        applyEndTimeMap["content1"] = $days[0].text() + " " + workTime[1];
                        applyEndTimeMap["content2"] = $days[0].text() + " " + workTime[2];
                        applyEndTimeMap["content3"] = $days[1].text() + " " + workTime[1];
                        applyEndTimeMap["content4"] = $days[1].text() + " " + workTime[2];
                        applyEndTimeMap["content5"] = $days[2].text() + " " + workTime[1];
                        applyEndTimeMap["content6"] = $days[2].text() + " " + workTime[2];
                        applyEndTimeMap["content7"] = $days[3].text() + " " + workTime[1];
                        applyEndTimeMap["content8"] = $days[3].text() + " " + workTime[2];
                        applyEndTimeMap["content9"] = $days[4].text() + " " + workTime[1];
                        applyEndTimeMap["content10"] = $days[4].text() + " " + workTime[2];
                        applyEndTimeMap["content11"] = $days[5].text() + " " + workTime[1];
                        applyEndTimeMap["content12"] = $days[5].text() + " " + workTime[2];
                        applyEndTimeMap["content13"] = $days[6].text() + " " + workTime[1];
                        applyEndTimeMap["content14"] = $days[6].text() + " " + workTime[2];
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("loadArrangement error.");
                }
            });
        }

        function checkPublishStatus() {
            $.ajax({
                url: "checkPublishStatus",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(load),
                dataType: "json",
                success: function (publishStatus) {
                    if(publishStatus.hasUnpublished == "true") {
                        $publish.prop("disabled", false)
                    } else {
                        $publish.prop("disabled", true)
                    }

                    if(publishStatus.hasPublished == "true") {
                        $revoke.prop("disabled", false)
                    } else {
                        $revoke.prop("disabled", true)
                    }
                },
                error: function () {
                    alert("checkPublishStatus error.");
                }
            })
        }

        function updateArrangement(staffIds, beginTime, endTime) {
            var sendArrangements = {
                staffIds: staffIds,
                beginTime: beginTime,
                endTime: endTime
            };
            $.ajax({
                async:false,
                url: "updateArrangement",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(sendArrangements),
                dataType: "json",
                success: function (Message) {
                    loadArrangement();
                    checkPublishStatus();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("updateArrangement error.");
                }
            });
        }

        function showStaffs() {
            $("#save").prop("disabled", true);
            checkboxChange = "no";
            var $td = $("td");
            $td.css("background-color", "#FFFFFF");
            $td.css("color", "#000000");
            var contentId = $chosenItem.attr("id");
            if((contentId !== "time1") && (contentId !== "time2")) {
                $chosenItem.css("background-color", "lightseagreen");
                $chosenItem.css("color", "#FFFFFF");
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
                                staff.id + "\"><td style=\"width: 40px; height: 100px; text-align: center\"><input type=\"checkbox\"/></td><td style=\"width: 180px; height: 100px;\">&nbspName:" +
                                staff.name + "<br/>&nbspPlace: " +
                                staff.place + "<br/>&nbspLanguage: <br/>&nbsp" +
                                staff.language1 + ", " +
                                staff.language2 + "</td><td hidden id=\"" +
                                staff.name + "\"></td></tr>";
                            $("#staffTable").append(tr);
                        });
                        var arrangement = curArrangement[contentIndex[chooseContent]];
                        $.each(arrangement, function (i, arrangeStaff) {
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
        }

        var $chosenItem;
        $("#timetable td").click(function (event) {
            $chosenItem = $(this);
            if(checkboxChange == "yes") {
                $("#askForSaveModal").modal("toggle");
            } else {
                showStaffs();
            }
            event.preventDefault();
        });

        var checkboxChange = "no";
        $("#staffTable").on("change", "input", function (event) {
            checkboxChange = "yes";
            $("#save").prop("disabled", false);
            event.preventDefault();
        });

        function save(){
            var chooseStaffIds = [];
            $("#staffTable").find("tr").each(function () {
                if($(this).find("input:checkbox").is(":checked")) {
                    chooseStaffIds.push($(this).attr("id"));
                }
            });
            updateArrangement(
                chooseStaffIds,
                applyBeginTimeMap[chooseContent],
                applyEndTimeMap[chooseContent]
            );
            $("#isSavedModal").modal("toggle");
            checkboxChange = "no";
            $("#save").prop("disabled", true);
        }

        $("#saveConfirm").click(function () {
            save();
            $("#saveModal").modal("hide");
        });
        $("#cancelAskForSave").click(function () {
            showStaffs();
        })
        $("#askForSaveConfirm").click(function () {
            save();
            $("#askForSaveModal").modal("hide");
            showStaffs();
        });

        $("#publishConfirm").click(function (event) {
            var publishTime = {beginTime: beginTime, endTime: endTime};
            $.ajax({
                url: "publish",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(publishTime),
                dataType: "json",
                success:function (Message) {
                    $("#isPublishedModal").modal("toggle");
                    $("#publishModal").modal("hide");
                    checkPublishStatus();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("publish error.");
                }
            });
            event.preventDefault();
        });

        $("#revokeConfirm").click(function (event) {
            var revokeTime = {beginTime: beginTime, endTime: endTime};
            $.ajax({
                url: "revoke",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(revokeTime),
                dataType: "json",
                success:function (Message) {
                    $("#isRevokedModal").modal("toggle");
                    $("#revokeModal").modal("hide");
                    checkPublishStatus();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("revoke error.");
                }
            });
            event.preventDefault();
        });

        var $chosenStaffTd;
        $("#staffTable").on("click", "td", function () {
            $chosenStaffTd = $(this);
            if($(this).is($(this).parent("tr").children().eq(1))) {
                $("#viewHistoryModalBody").text("Do you want to view " + $(this).next("td").attr("id") + "\"s timetable?");
                $("#viewHistoryModal").modal("toggle");
            }
        });

        $("#viewHistoryConfirm").click(function (event) {
            window.location.href = "staffWorkHistory" + $chosenStaffTd.parent().attr("id");;
            event.preventDefault();
        });

        $("#check").click(function () {
            var checkDays;
            var serviceLanguage = {
                Chinese: "no",
                English: "no",
                Japanese: "no"
            };
            $.ajax({
                url: "getCheckSettings",
                type: "GET",
                dataType: "json",
                success: function (checkSettings) {
                    checkDays = parseInt(checkSettings.workdays);
                    $.each(checkSettings.languages, function (i, language) {
                        serviceLanguage[language] = "yes";
                    });

                    var report = "";
                    var languageToIndex = {English: 0, Chinese: 1, Japanese: 2, Korean: 3};
                    var IndexToLanguage = ["English", "Chinese", "Japanese", "Korean"];

                    report += "Language Service Check: ";
                    var languageReport = "";
                    $.each(curArrangement, function (i, arrangement) {
                        var time = $days[Math.floor(i/2)].text() + " " + $times[i%2].text();
                        var checkList = ["no", "no", "no", "no"];
                        $.each(arrangement, function (j, staff) {
                            checkList[languageToIndex[staff.language1]] = "yes";
                            checkList[languageToIndex[staff.language2]] = "yes";
                        });
                        var lack = "";
                        if(checkList[0] == "no" && serviceLanguage["English"] == "yes") {
                            lack += " " + IndexToLanguage[0];
                        }
                        if(checkList[1] == "no" && serviceLanguage["Chinese"] == "yes") {
                            lack += " " + IndexToLanguage[1];
                        }
                        if(checkList[2] == "no" && serviceLanguage["Japanese"] == "yes") {
                            lack += " " + IndexToLanguage[2];
                        }
                        if(checkList[3] == "no" && serviceLanguage["Korean"] == "yes") {
                            lack += " " + IndexToLanguage[3];
                        }
                        if(lack !== "") {
                            languageReport += time + ": Lack of" + lack + " service.<br/>";
                        }
                    });
                    if(languageReport !== "") {
                        report += "Fail<br/>" + languageReport + "<br/>";
                    } else {
                        report += "Pass<br/>";
                    }

                    report += "Work Days Check: ";
                    var overWorkReport = "";
                    var checkMap = {};
                    var names = {};
                    $.each(curArrangement, function (i, arrangement) {
                        $.each(arrangement, function (j, staff) {
                            if(checkMap[staff.name] == null) {
                                checkMap[staff.name] = 1;
                            } else {
                                checkMap[staff.name] += 1;
                            }
                            names[staff.name] = staff.name;
                        });
                    });
                    $.each(names, function (i, name) {
                        if(checkMap[name] > checkDays) {
                            overWorkReport += name + " work for more than " + checkDays + " days.<br/>";
                        }
                    });
                    if(overWorkReport !== "") {
                        report += " Fail<br/>" + overWorkReport + "<br/>";
                    } else {
                        report += " Pass<br/>";
                    }
                    $("#checkReportModalBody").html(report);
                    $("#checkReportModal").modal("toggle");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("getCheckSettings error.");
                }
            });
        });

        $("#logOutConfirm").click(function (event) {
            window.location.href = "login";
            event.preventDefault();
        });

        $("#approveApplication").click(function (event) {
            window.location.href = "approveApplication";
            event.preventDefault();
        });

        $("#settings").click(function (event) {
            window.location.href = "managerSettings";
            event.preventDefault();
        });

        $("#staffManagement").click(function (event) {
            window.location.href = "staffManagement";
            event.preventDefault();
        });

        $("#help").click(function (event) {
            window.location.href = "helpManager";
            event.preventDefault();
        });

        loadArrangement();
        checkPublishStatus();
        $contents[0].click();
        $("#save").prop("disabled", true);
        $.each($languageCheckbox, function () {
            $(this).prop("checked", true);
        })
        $("#workdaySelect").val("5");
    })
</script>
</html>

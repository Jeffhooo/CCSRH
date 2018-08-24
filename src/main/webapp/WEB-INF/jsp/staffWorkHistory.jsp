<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-18
  Time: 下午7:30
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
            width: 950px;
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
        #brand, #homePage, #about, #contact, #logOut {
            color: white;
        }
        .btn-primary {
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
        .table-bordered td{
            text-align: center;
            width: 110px;
            height: 150px;
        }
        .table-bordered th{
            text-align: center;
            width: 110px;
            height: 50px;
        }
        .container {
            width: 950px;
            margin-top: auto;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #buttons {
            margin-top: 10%;
        }
        #bottomSpace {
            height: 100px;
        }
        #logOut {
            color: white;
            margin-left: 570px;
        }
    </style>
    <title>Work History</title>
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
                        <li><a id="logOut" data-toggle="modal" data-target="#LogOutModal">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <p id="buttons">
            <button id="lastWeek" type="button" class="btn btn-primary">Last Week</button>
            <button id="nextWeek" type="button" class="btn btn-primary">Next Week</button>
            <button id="Back" type="button" class="btn btn-primary" onclick="history.go(-1);">Back</button>
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
        <div id="userId" hidden>${userId}</div>
        <div id="bottomSpace"></div>
        <footer class="copyright">
            &copy; 2018 Works Applications Co., Ltd. All Right Reserved<br>
        </footer>
    </div>
    <div class="modal fade" id="LogOutModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
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

    <div class="modal fade" id="noHistoryModal" tabindex="-1" role="dialog" aria-labelledby="noHistoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="noHistoryModalLabel">
                        Timetable
                    </h4>
                </div>
                <div class="modal-body">
                    No more history.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="noArrangementModal" tabindex="-1" role="dialog" aria-labelledby="noArrangementModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="noArrangementModalLabel">
                        Timetable
                    </h4>
                </div>
                <div class="modal-body">
                    No new arrangement.
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
        var dayOffset = 0;
        var minDayOffset = -7;
        var maxDayOffset = 7;

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
        function getWeekBeginDate() {
            var weekBeginDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 1);
            return formatDate(weekBeginDate);
        }

        //get end date of this week
        function getWeekEndDate() {
            var weekEndDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 8);
            return formatDate(weekEndDate);
        }

        function getOffsetBeginDate(dayOffset) {
            var date = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + dayOffset + 1);
            return formatDate(date);
        }

        function getOffsetEndDate(dayOffset) {
            var date = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + dayOffset + 8);
            return formatDate(date);
        }

        var userId = $("#userId").text();
        var loadBeginDate = getWeekBeginDate();
        var loadEndDate = getWeekEndDate();

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

        loadStaffTimetable(userId, loadBeginDate, loadEndDate);

        $("#lastWeek").click(function () {
            if(dayOffset > minDayOffset) {
                dayOffset -= 7;
                loadStaffTimetable(userId, getOffsetBeginDate(dayOffset), getOffsetEndDate(dayOffset));
            } else {
                $("#noHistoryModal").modal("toggle");
            }
        });

        $("#nextWeek").click(function () {
            if(dayOffset < maxDayOffset) {
                dayOffset += 7;
                if(dayOffset == 7) {
                    loadNextWeekArrangement(userId, getOffsetBeginDate(dayOffset), getOffsetEndDate(dayOffset));
                } else {
                    loadStaffTimetable(userId, getOffsetBeginDate(dayOffset), getOffsetEndDate(dayOffset));
                }
            } else {
                $("#noArrangementModal").modal("toggle");
            }
        });

        function loadStaffTimetable(userId, begin, end) {
            var loadPage = {
                title: "Manager",
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

        function loadNextWeekArrangement(userId, beginDate, endDate) {
            var loadArrangement = {
                title:"Manager",
                staffId:userId,
                beginTime:beginDate,
                endTime:endDate
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

        $("#logOutConfirm").click(function (event) {
            window.location.href = "/";
            event.preventDefault();
        });
    })
</script>
</html>

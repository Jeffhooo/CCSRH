<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-17
  Time: 下午12:11
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
            width: 1150px;
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
        #logOut {
            color: white;
            margin-left: 780px;
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
        .container {
            width: 1150px;
            margin-top: auto;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #applicationTable {
            margin-top: 10%;
        }
        #applicationTable td {
            text-align: center;
            height: 50px;
        }
        #staffId, #staffName, #result{
            text-align: center;
            width: 100px;
            height: 50px;
        }
        #beginTime, #endTime, #applyReason, #commentTableHeader{
            text-align: center;
            width: 200px;
            height: 50px;
        }
        #comment {
            width: 1100px;
            height: 50px;
        }
        #buttons {
            margin-top: 10px;
        }
        #bottomSpace {
            height: 100px;
        }
    </style>

    <title>Approve</title>
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
    <form class="form-signin" id="approveForm">
        <table class="table-bordered" id="applicationTable">
            <thead>
            <tr id="tableHeader">
                <th id="staffId">Staff Id</th>
                <th id="staffName">Staff Name</th>
                <th id="beginTime">Begin Time</th>
                <th id="endTime">End Time</th>
                <th id="applyReason">Apply Reason</th>
                <th id="result">Result</th>
                <th id="commentTableHeader">Comment</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <h2 class="form-signin-heading" id="CommentHeader">Comment:</h2>
        <label for="comment" class="sr-only">Comment</label>
        <textarea type="text" id="comment" class="form-control" name = "comment" placeholder="Comment"></textarea>
    </form>
        <p id="buttons">
            <button class="btn btn-primary" id="accept" type="button">Accept</button>
            <button class="btn btn-primary" id="reject" type="button">Reject</button>
            <button class="btn btn-primary" id="back" type="button" onclick="history.go(-1);">Back</button>
        </p>

    <div id="bottomSpace"></div>
    <footer class="copyright">
        &copy; 2018 Works Applications Co., Ltd. All Right Reserved<br>
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

<div class="modal fade" id="acceptModal" tabindex="-1" role="dialog" aria-labelledby="acceptModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="acceptModalLabel">
                    Accept
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to accept this applications?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="acceptConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="rejectModalLabel">
                    Reject
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to reject this applications?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="rejectConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isAcceptedModal" tabindex="-1" role="dialog" aria-labelledby="isAcceptedModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isAcceptedModalLabel">
                    Accept
                </h4>
            </div>
            <div class="modal-body">
                Application is accepted.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isRejectedModal" tabindex="-1" role="dialog" aria-labelledby="isRejectedModalLabel" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                &times;
            </button>
            <h4 class="modal-title" id="isRejectedModalLabel">
                Reject
            </h4>
        </div>
        <div class="modal-body">
            Application is rejected.
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>

<div class="modal fade" id="haveToChooseOneModal" tabindex="-1" role="dialog" aria-labelledby="haveToChooseOneModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="haveToChooseOneModalLabel">
                    Approve
                </h4>
            </div>
            <div class="modal-body">
                You have to choose an application.
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
        var beginTime = getOffsetBeginDate(7);
        var endTime = getOffsetEndDate(7);
        var chosenContent = null;
        var $chosenTr;

        function loadApplications(beginTime, endTime) {
            var loadPage = {beginTime: beginTime, endTime: endTime};
            $.ajax({
                url: "loadApplications",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(loadPage),
                dataType: "json",
                success: function(applications) {
                    $.each(applications, function (index, application) {
                        var tr = "<tr id=\"" + application.applicationId + "\">" +
                            "<td>" + application.staffId + "</td>" +
                            "<td>" + application.staffName + "</td>" +
                            "<td>" + application.beginTime + "</td>" +
                            "<td>" + application.endTime + "</td>" +
                            "<td>" + application.applyReason + "</td>" +
                            "<td>" + ((application.result == null)? "" : application.result) + "</td>" +
                            "<td>" + ((application.comment == null)? "" : application.comment) + "</td></tr>";
                        $("#applicationTable").append(tr);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("loadApplications error.");
                }
            });
        }
        loadApplications(beginTime, endTime);

        $("#applicationTable").on("click", "tr", function () {
            var $tr = $("tr");
            $tr.css("background-color", "#FFFFFF");
            $tr.css("color", "#000000");
            var contentId = $(this).attr("id");
            if(contentId !== "tableHeader") {
                $(this).css("background-color", "lightseagreen");
                $(this).css("color", "#FFFFFF");
                chosenContent = contentId;
                $chosenTr = $(this);
            }
        });

        $("#accept").click(function (event) {
            if(chosenContent == null) {
                $("#haveToChooseOneModal").modal("toggle");
            } else {
                $("#acceptModal").modal("toggle");
            }
            event.preventDefault();
        });

        $("#reject").click(function (event) {
            if(chosenContent == null) {
                $("#haveToChooseOneModal").modal("toggle");
            } else {
                $("#rejectModal").modal("toggle");
            }
            event.preventDefault();
        });

        $("#acceptConfirm").click(function (event) {
            var comment = $("#comment").val();
            var approve = {applicationId: chosenContent, comment: comment};
            $.ajax({
                url: "acceptApplication",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(approve),
                dataType: "json",
                success: function (Message) {
                    $("#isAcceptedModal").modal("toggle");
                    $("#acceptModal").modal("hide");
                    $("#comment").val("");
                    $chosenTr.find("td").eq(5).text("accept");
                    $chosenTr.find("td").eq(6).text(comment);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("acceptApplication error.");
                }
            });
            event.preventDefault();
        });

        $("#rejectConfirm").click(function (event) {
            var comment = $("#comment").val();
            var approve = {applicationId: chosenContent, comment: comment};
            $.ajax({
                url: "rejectApplication",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(approve),
                dataType: "json",
                success: function (Message) {
                    $("#isRejectedModal").modal("toggle");
                    $("#rejectModal").modal("hide");
                    $("#comment").val("");
                    $chosenTr.find("td").eq(5).text("reject");
                    $chosenTr.find("td").eq(6).text(comment);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("acceptApplication error.");
                }
            });
            event.preventDefault();
        });

        $("#logOutConfirm").click(function (event) {
            window.location.href = "/";
            event.preventDefault();
        });
    });
</script>
</html>

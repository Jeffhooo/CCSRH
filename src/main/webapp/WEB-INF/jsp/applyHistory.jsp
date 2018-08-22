<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-18
  Time: 下午4:42
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
            margin-left: 570px;
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
        .container {
            margin-top: auto;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #result{
            text-align: center;
            width: 100px;
            height: 50px;
        }
        #beginTime, #endTime, #applyReason, #commentTableHeader {
            text-align: center;
            width: 200px;
            height: 50px;
        }
        #buttons {
            margin-top: 10px;
        }
        #applicationTable {
            margin-top: 10%;
        }
        #applicationTable td {
            text-align: center;
            height: 50px;
        }
    </style>
    <title>Apply History</title>
</head>
<body>
<div class="container">
    <!-- Fixed navbar -->
    <nav class="navbar navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#" id="brand">Call Center Rostering Helper</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#" id="logOut" data-toggle="modal" data-target="#LogOutModal">Log Out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <table class="table-bordered" id="applicationTable">
        <thead>
        <tr id="tableHeader">
            <th id="beginTime">Begin Time</th>
            <th id="endTime">End Time</th>
            <th id="applyReason">Apply Reason</th>
            <th id="result">Result</th>
            <th id="commentTableHeader">Comment</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <div id="buttons">
        <button class="btn btn-primary" id="create" type="button">Create New Application</button>
        <button class="btn btn-primary" id="back" type="button" onclick="history.go(-1);">Back</button>
    </div>
    <div id="userId" hidden>${userId}</div>
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
</body>
<script type="text/javascript">
    $(document).ready(function () {
        var beginTime = "2018-8-27";
        var endTime = "2018-9-3";
        var userId = $("#userId").text();
        var requestInfo = {
            staffId: userId,
            beginTime: beginTime,
            endTime: endTime
        };
        $.ajax({
            url: "loadStaffApplications",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(requestInfo),
            dataType: "json",
            success: function(applications) {
                $.each(applications, function (index, application) {
                    var tr = "<tr id=\"" + application.applicationId + "\">" +
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
    })

    $("#create").click(function (event) {
        window.location.href = "apply${userId}";
        event.preventDefault();
    });

    $("#logOutConfirm").click(function (event) {
        window.location.href = "/";
        event.preventDefault();
    });
</script>
</html>

<%--
  Created by IntelliJ IDEA.
  User: jeff
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
        .container {
            margin-top: 5%;
            margin-left: 10%;
            margin-right: auto;
            margin-bottom: auto;
        }
        #applicationId, #staffId, #staffName, #result{
            text-align: center;
            width: 100px;
            height: 50px;
        }
        #beginTime, #endTime, #applyReason {
            text-align: center;
            width: 200px;
            height: 50px;
        }
        #buttons {
            margin-top: 10px;
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
    <div id="userId" hidden>${userId}</div>
    <table class="table-bordered" id="applicationTable">
        <thead>
        <tr id="tableHeader">
            <th id="applicationId">Apply Id</th>
            <th id="staffId">Staff Id</th>
            <th id="staffName">Staff Name</th>
            <th id="beginTime">Begin Time</th>
            <th id="endTime">End Time</th>
            <th id="applyReason">Apply Reason</th>
            <th id="result">Result</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <div id="buttons">
        <button class="btn btn-primary" id="create" type="button">Create New Application</button>
        <button class="btn btn-primary" id="back" type="button" onclick="history.go(-1);">Back</button>
    </div>
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
                        "<td>" + application.applicationId + "</td>" +
                        "<td>" + application.staffId + "</td>" +
                        "<td>" + application.staffName + "</td>" +
                        "<td>" + application.beginTime + "</td>" +
                        "<td>" + application.endTime + "</td>" +
                        "<td>" + application.applyReason + "</td>" +
                        "<td>" + ((application.result == null)? "":application.result) + "</td></tr>";
                    $("#applicationTable").append(tr);
                })
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
</script>
</html>

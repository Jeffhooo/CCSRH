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
        .container {
            margin-top: 5%;
            margin-left: auto;
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
        #comment {
            width: 1000px;
        }
        #buttons {
            margin-top: 10px;
        }
        #applicationTable td {
            text-align: center;
            height: 50px;
        }
    </style>

    <title>Approve</title>
</head>
<body>
<div class="container">
    <form class="form-signin" id="approveForm">
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
            <tbody>
            </tbody>
        </table>
        <h2 class="form-signin-heading" id="CommentHeader">Comment:</h2>
        <label for="comment" class="sr-only">Comment</label>
        <textarea type="text" id="comment" class="form-control" name = "comment" placeholder="Comment"></textarea>
        <p id="buttons">
            <button class="btn btn-primary" id="accept" type="submit">Accept</button>
            <button class="btn btn-primary" id="reject" type="submit">Reject</button>
            <button class="btn btn-primary" id="back" type="button" onclick="history.go(-1);">Back</button>
        </p>
    </form>
</div>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        var beginTime = "2018-8-27";
        var endTime = "2018-9-3";
        var loadPage = {beginTime: beginTime, endTime: endTime};
        var chooseContent;
        $.ajax({
            url: "loadApplications",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(loadPage),
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
        
        $("#applicationTable").on("click", "tr", function () {
            $("tr").css("background-color", "#FFFFFF");
            $("tr").css("color", "#000000");
            var contentId = $(this).attr("id");
            if(contentId !== "tableHeader") {
                $(this).css("background-color", "#0066AA");
                $(this).css("color", "#FFFFFF");
                chooseContent = contentId;
            }
        })

        $("#accept").click(function (event) {
            var approve = {applicationId: chooseContent, comment: $("#comment").val()};
            $.ajax({
                url: "acceptApplication",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(approve),
                dataType: "json",
                success: function (Message) {
                    alert(Message.msg);
                    $("#applicationTable tbody").empty();
                    $("#comment").val("");
                    $.ajax({
                        url: "loadApplications",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(loadPage),
                        dataType: "json",
                        success: function(applications) {
                            $.each(applications, function (index, application) {
                                var tr = "<tr id=\"" + application.applicationId + "\">" +
                                    "<td>" + application.applicationId + "</td>" +
                                    "<td>" + application.staffId + "</td>" +
                                    "<td>" + application.staffName + "</td>" +
                                    "<td>" + application.endTime + "</td>" +
                                    "<td>" + application.beginTime + "</td>" +
                                    "<td>" + application.applyReason + "</td>" +
                                    "<td>" + ((application.result == null)? "":application.result) + "</td></tr>";
                                $("#applicationTable").append(tr);
                            })
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("loadApplications error.");
                        }
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("acceptApplication error.");
                }
            });
            event.preventDefault();
        })

        $("#reject").click(function (event) {
            var approve = {applicationId: chooseContent, comment: $("#comment").val()};
            $.ajax({
                url: "rejectApplication",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(approve),
                dataType: "json",
                success: function (Message) {
                    alert(Message.msg);
                    $("#applicationTable tbody").empty();
                    $("#comment").val("");
                    $.ajax({
                        url: "loadApplications",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(loadPage),
                        dataType: "json",
                        success: function(applications) {
                            $.each(applications, function (index, application) {
                                var tr = "<tr id=\"" + application.applicationId + "\">" +
                                    "<td>" + application.applicationId + "</td>" +
                                    "<td>" + application.staffId + "</td>" +
                                    "<td>" + application.staffName + "</td>" +
                                    "<td>" + application.endTime + "</td>" +
                                    "<td>" + application.beginTime + "</td>" +
                                    "<td>" + application.applyReason + "</td>" +
                                    "<td>" + ((application.result == null)? "":application.result) + "</td></tr>";
                                $("#applicationTable").append(tr);
                            })
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("loadApplications error.");
                        }
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("acceptApplication error.");
                }
            });
            event.preventDefault();
        })
    });
</script>
</html>

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
        var chosenContent;
        var $chosenTr;

        function loadApplications() {
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
        loadApplications();

        $("#applicationTable").on("click", "tr", function () {
            var $tr = $("tr");
            $tr.css("background-color", "#FFFFFF");
            $tr.css("color", "#000000");
            var contentId = $(this).attr("id");
            if(contentId !== "tableHeader") {
                $(this).css("background-color", "#0066AA");
                $(this).css("color", "#FFFFFF");
                chosenContent = contentId;
                $chosenTr = $(this);
            }
        });

        $("#accept").click(function (event) {
            var comment = $("#comment").val();
            var approve = {applicationId: chosenContent, comment: comment};
            $.ajax({
                url: "acceptApplication",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(approve),
                dataType: "json",
                success: function (Message) {
                    alert(Message.msg);
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

        $("#reject").click(function (event) {
            var comment = $("#comment").val();
            var approve = {applicationId: chosenContent, comment: comment};
            $.ajax({
                url: "rejectApplication",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(approve),
                dataType: "json",
                success: function (Message) {
                    alert(Message.msg);
                    $("#comment").val("");
                    $chosenTr.find("td").eq(5).text("reject");
                    $chosenTr.find("td").eq(6).text(comment);
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

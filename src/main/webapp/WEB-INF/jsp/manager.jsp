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
        #checkbox {
            width: 50px;
            height: 50px;
        }
        #staffInform {
            width: 150px;
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
                    <th id="day6">2018-8-32</th>
                    <th id="day7">2018-8-33</th>
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
                <tr>
                    <th></th>
                    <th id="checkbox"></th>
                    <th id="staffInform"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
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

        $.ajax({
            url: "loadArrangement",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(load),
            dataType: "json",
            success: function (arrangements) {
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
    })
</script>
</html>

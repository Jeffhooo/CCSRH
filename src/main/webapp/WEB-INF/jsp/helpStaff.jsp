<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-24
  Time: 上午9:21
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
        #brand {
            color: white;
        }
        #logOut {
            color: white;
            margin-left: 540px;
        }
        .btn-default {
            margin-top: 5px;
        }
        .btn-primary {
            width: 70px;
            margin-top: 5px;
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
            width: 900px;
            margin-top: auto;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #mainPageHowTo {
            margin-top: 10%;
        }
        img {
            width: 900px;
        }
        p {
            font-size: 18px;
        }
        #bottomSpace {
            height: 100px;
        }
    </style>
    <title>Help</title>
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

    <h3 id="mainPageHowTo">How to use the staff main page?</h3>
    <p id="mainPageAnswer">
        The main page of staff is like the picture below. You could view you timetable by clicking "Last Week" and
        "Next Week". You could apply rest time by clicking "Rest Time Applications" at the navigation bar.
    </p>
    <img src="img/staffMainPage.png" alt="manager main page" id="staffMainPage">

    <h3 id="ApplyHowTo">How to use the "Rest Time Applications" page?</h3>
    <p id="applyPageAnswer">
        The "Rest Time Applications" page is like the picture below. You could view you applications at the table.
        You could create a new application by clicking "New", click the block of table to choose time, write apply
        reason and submit by clicking "Submit".
    </p>
    <img src="img/applyPage.png" alt="manager main page" id="applyPage">


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
</body>
<script type="text/javascript">
    $(document).ready(function () {

        $("#logOutConfirm").click(function (event) {
            window.location.href = "/";
            event.preventDefault();
        });
    })
</script>
</html>

<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-24
  Time: 上午8:12
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

    <h3 id="mainPageHowTo">How to use the manager main page?</h3>
    <p id="mainPageAnswer">
        The main page of manager is like the picture below. You could click the blocks of table to view and available
        staffs. You could click the staff's information block to view his/her timetable. You could choose staffs and click
        "save" to save changes. You could check, publish and revoke your arrangement by
        clicking "check", "publish" and "revoke".
        <br/><br/>
        The navigation bar have three function item:<br/>
        "Approve Applications": Approve the rest time applications of staffs.<br/>
        "Staff Management": Manage staffs.<br/>
        "Holiday & Check Settings": Set holidays and check configuration.<br/>
    </p>
    
    <img src="img/managerMainPage.png" alt="manager main page" id="managerMainPage">

    <h3 id="approvePageHowTo">How to use the "Approve Application" page?</h3>
    <p id="approvePageAnswer">
        The approve page is like the picture below. You could click the blocks of table to choose the application and
        accept or reject it by click "Accept" or "Reject". You could write your comment in the text box of "comment".
    </p>
    <img src="img/approvePage.png" alt="manager main page" id="approvePage">

    <h3 id="staffManagementHowTo">How to use the "Staff Management" page?</h3>
    <p id="staffManageAnswer">
        The staff management page is like the picture below. You could click the blocks of table to choose the staff and delete
        staff by clicking "Delete". If you want to create a new staff, you could click "New", input the information
        into the form and click "Create".
    </p>
    <img src="img/staffManagePage.png" alt="manager main page" id="staffManagePage">

    <h3 id="settingsHowTo">How to use the staff "Holiday & Check Settings" page?</h3>
    <p>
        The settings page is like the picture below. You could click the blocks of table to choose holiday and delete
        the holiday by clicking "delete". If you want to create a new holiday, you could click "New", input the
        information into the form and click "Create".<br/><br/>
        You could change the check language service and work days of week at the check settings form, and apply the
        change by clicking "Apply".
    </p>
    <img src="img/settingsPage.png" alt="manager main page" id="settingsPage">

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

        $("#brand").click(function (event) {
            window.location.href = "managerMain";
            event.preventDefault();
        });
    })
</script>
</html>

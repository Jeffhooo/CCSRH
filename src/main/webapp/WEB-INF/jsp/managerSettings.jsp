<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-22
  Time: 上午9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="webjars/jquery/3.3.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.datepick.css">
    <script type="text/javascript" src="js/jquery.plugin.js"></script>
    <script type="text/javascript" src="js/jquery.datepick.js"></script>
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
            margin-left: 250px;
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
            margin-left: 480px;
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
            margin-top: auto;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #holidayName, #holidayPlace, #beginTime, #endTime {
            text-align: center;
            width: 200px;
            height: 50px;
        }
        #holidaySettingsHeader {
            margin-top: 10%;
        }
        #workdays {
            margin-top: 10px;
        }
        #languageConfig, #English, #Chinese, #Japanese {
            display: inline;
        }
        #apply {
            display: inline;
        }
        #setHolidayName {
            margin-top: 10px;
            margin-left: 33px;
        }

        #setHolidayPlace {
            margin-top: 10px;
            margin-left: 33px;
        }
        #setHolidayBeginTime {
            margin-top: 10px;
        }
        #setHolidayEndTime {
            margin-top: 10px;
            margin-left: 11px;
        }
        #holidayTable td {
            text-align: center;
            height: 50px;
        }
        #createNewHolidayHeader {
            font-size: 20px;
            margin-top: 10px;
        }
        #bottomSpace {
            height: 100px;
        }
    </style>
    <title>Manager Settings</title>
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
                    <li><a id="logOut" data-toggle="modal" data-target="#LogOutModal">Log Out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <h2 class="form-signin-heading" id="holidaySettingsHeader">Holiday Settings:</h2>
    <table class="table-bordered" id="holidayTable">
        <thead>
        <tr id="holidayTableHeader">
            <th id="holidayName">Name</th>
            <th id="holidayPlace">Place</th>
            <th id="beginTime">Begin Time</th>
            <th id="endTime">End Time</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <button id="openCreateHoliday" type="button" class="btn btn-primary">New</button>
    <button id="delete" type="button" class="btn btn-primary">Delete</button>

    <div id="createNewHolidayForm">
        <h3 id="createNewHolidayHeader">Create New Holiday:</h3>
        <div id="setHolidayName">
            Name:<input class="form-inline" id="holidayNameInput">
        </div>
        <div id="setHolidayPlace">Place: <select id="holidayPlaceSelect">
            <option value="Asia/Shanghai">Asia/Shanghai</option>
            <option value="Asia/Tokyo">Asia/Tokyo</option>
            <option value="Asia/Singapore">Asia/Singapore</option>
        </select></div>
        <div id="setHolidayBeginTime">
            Begin Time:<input class="form-inline" id="holidayBeginTimeInput">
        </div>
        <div id="setHolidayEndTime">
            End Time:<input class="form-inline" id="holidayEndTimeInput">
        </div>
        <button id="createNewHoliday" type="button" class="btn btn-primary">Create</button>
    </div>

    <h2 class="form-signin-heading" id="checkConfigurationHeader">Check Settings:</h2>
    <div id="languageConfig">Language Service: </div>
    <p id="English"><input id="EnglishCheckbox" type="checkbox">English</p>
    <p id="Chinese"><input id="ChineseCheckbox" type="checkbox">Chinese</p>
    <p id="Japanese"><input id="JapaneseCheckbox" type="checkbox">Japanese</p>
    <div id="workdays">Work Days of a Week: <select id="workdaySelect">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
    </select></div>
    <button id="apply" type="button" class="btn btn-primary" data-toggle="modal" data-target="#applyCheckSettingsModal">Apply</button>
    <button id="back" type="button" class="btn btn-primary" onclick="history.go(-1);">Back</button>

    <div id="bottomSpace"></div>
    <footer class="copyright">
        &copy; 2018 Works Applications Co., Ltd. All Right Reserved<br>
    </footer>
</div>
<div class="modal fade" id="applyCheckSettingsModal" tabindex="-1" role="dialog" aria-labelledby="applyCheckSettingsModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="applyCheckSettingsModalLabel">
                    Update Check Settings
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to apply the check settings?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="applyCheckSettingsConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isAppliedCheckSettingsModal" tabindex="-1" role="dialog" aria-labelledby="isAppliedCheckSettingsModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isAppliedCheckSettingsModalLabel">
                    Update Check Settings
                </h4>
            </div>
            <div class="modal-body">
                Check Settings is updated.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="createNewHolidayModal" tabindex="-1" role="dialog" aria-labelledby="createNewHolidayModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="createNewHolidayModalLabel">
                   Create New Holiday
                </h4>
            </div>
            <div class="modal-body" id="createNewHolidayModalBody">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="createNewHolidayConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isCreatedHolidayModal" tabindex="-1" role="dialog" aria-labelledby="isCreatedHolidayModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isCreatedHolidayModalLabel">
                    Create New Holiday
                </h4>
            </div>
            <div class="modal-body">
                New holiday is created.
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
                    Delete
                </h4>
            </div>
            <div class="modal-body">
                You have to choose an holiday.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="deleteHolidayModal" tabindex="-1" role="dialog" aria-labelledby="deleteHolidayModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="deleteHolidayModalLabel">
                    Create New Holiday
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to delete this holiday?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="deleteHolidayConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isDeletedHolidayModal" tabindex="-1" role="dialog" aria-labelledby="isDeletedHolidayModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isDeletedHolidayModalLabel">
                    Delete Holiday
                </h4>
            </div>
            <div class="modal-body">
                The holiday is deleted.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="emptyHolidayNameModal" tabindex="-1" role="dialog" aria-labelledby="emptyHolidayNameModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="emptyHolidayNameModalLabel">
                    Delete Holiday
                </h4>
            </div>
            <div class="modal-body">
                Holiday name is empty.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="emptyHolidayBeginTimeModal" tabindex="-1" role="dialog" aria-labelledby="emptyHolidayBeginTimeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="emptyHolidayBeginTimeModalLabel">
                    The
                </h4>
            </div>
            <div class="modal-body">
                Holiday begin time is empty.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="emptyHolidayEndTimeModal" tabindex="-1" role="dialog" aria-labelledby="emptyHolidayEndTimeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="emptyHolidayEndTimeModalLabel">
                    Delete Holiday
                </h4>
            </div>
            <div class="modal-body">
                Holiday end time is empty.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
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
        var $languagCheckboxMap = {
            "Chinese": $("#ChineseCheckbox"),
            "English": $("#EnglishCheckbox"),
            "Japanese": $("#JapaneseCheckbox")
        };
        var chosenContent;
        var $chosenTr;
        function loadCheckSettings() {
            $.ajax({
                url: "getCheckSettings",
                type: "GET",
                dataType: "json",
                success: function (checkSettings) {
                    $("#workdaySelect").val(checkSettings.workdays);
                    $.each(checkSettings.languages, function (i, language) {
                        $languagCheckboxMap[language].attr("checked", "true");
                    })
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("loadCheckSettings error.");
                }
            })
        }

        function loadHolidaysSettings() {
            $.ajax({
                url: "getHolidaysSettings",
                type: "GET",
                dataType: "json",
                success: function (holidays) {
                    $("#holidayTable tbody").empty();
                    $.each(holidays, function (i, holiday) {
                        var tr = "<tr id=\"" + holiday.id + "\">" +
                            "<td>" + holiday.name + "</td>" +
                            "<td>" + holiday.place + "</td>" +
                            "<td>" + holiday.beginTime + "</td>" +
                            "<td>" + holiday.endTime + "</td></tr>";
                        $("#holidayTable").append(tr);
                    })
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("loadHolidaysSettings error.");
                }
            })
        }

        $("#createNewHoliday").click(function (event) {
            var beginTimeInput = $("#holidayBeginTimeInput").val();
            var endTimeInput = $("#holidayEndTimeInput").val();
            var nameInput = $("#holidayNameInput").val();
            var placeInput = $("#holidayPlaceSelect").val();
            var canCreate = true;
            if(nameInput == "") {
                $("#emptyHolidayNameModal").modal("toggle");
                canCreate = false;
            }
            if(beginTimeInput == "" && canCreate !== false) {
                $("#emptyHolidayBeginTimeModal").modal("toggle");
                canCreate = false;
            }
            if(endTimeInput == "" && canCreate !== false) {
                $("#emptyHolidayEndTimeModal").modal("toggle");
                canCreate = false;
            }
            if(canCreate) {
                var dialogBody = "Name: " + nameInput +
                    "<br/> Place: " + placeInput +
                    "<br/> Begin Time: " + beginTimeInput +
                    "<br/> End Time: " + endTimeInput +
                    "<br/> Are you sure to create this holiday?";
                $("#createNewHolidayModalBody").html(dialogBody);
                $("#createNewHolidayModal").modal("toggle");
            }
            event.preventDefault();
        });

        $("#createNewHolidayConfirm").click(function (event) {
            var $beginTimeInput = $("#holidayBeginTimeInput");
            var $endTimeInput = $("#holidayEndTimeInput");
            var $nameInput = $("#holidayNameInput");
            var $placeInput = $("#holidayPlaceSelect");
            var holidayRequest = {
                name: $nameInput.val(),
                place: $placeInput.val(),
                beginTime: $beginTimeInput.val(),
                endTime: $endTimeInput.val()
            };
            $.ajax({
                url: "createNewHoliday",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(holidayRequest),
                dataType: "json",
                success: function (Message) {
                    loadHolidaysSettings();
                    $("#isCreatedHolidayModal").modal("toggle");
                    $("#createNewHolidayModal").modal("hide");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("createNewHoliday error.");
                }
            });
            event.preventDefault();
        });

        $("#applyCheckSettingsConfirm").click(function (event) {
            var workdays = $("#workdaySelect").val();
            var languages = [];
            if($("#ChineseCheckbox").is( ":checked" )) {
                languages.push("Chinese");
            }
            if($("#EnglishCheckbox").is( ":checked" )) {
                languages.push("English");
            }
            if($("#JapaneseCheckbox").is( ":checked" )) {
                languages.push("Japanese");
            }
            var requestEntity = {workdays: workdays, languages: languages}
            $.ajax({
                url: "updateCheckSettings",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(requestEntity),
                dataType: "json",
                success: function (Message) {
                    $("#isAppliedCheckSettingsModal").modal("toggle");
                    $("#applyCheckSettingsModal").modal("hide");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("updateCheckSettings error.");
                }
            });
            event.preventDefault();
        });

        $("#holidayTable").on("click", "tr", function () {
            var $tr = $("tr");
            $tr.css("background-color", "#FFFFFF");
            $tr.css("color", "#000000");
            var contentId = $(this).attr("id");
            if(contentId !== "holidayTableHeader") {
                $(this).css("background-color", "lightseagreen");
                $(this).css("color", "#FFFFFF");
                chosenContent = contentId;
                $chosenTr = $(this);
            }
        });

        $("#delete").click(function (event) {
            if(chosenContent == null) {
                $("#haveToChooseOneModal").modal("toggle");
            } else {
                $("#deleteHolidayModal").modal("toggle");
            }
           event.preventDefault();
        });

        $("#deleteHolidayConfirm").click(function (event) {
            var deleteId = chosenContent;
            $.ajax({
                url: "deleteHoliday",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: deleteId,
                dataType: "json",
                success: function (Message) {
                    loadHolidaysSettings();
                    $("#isDeletedHolidayModal").modal("toggle");
                    $("#deleteHolidayModal").modal("hide");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("deleteHoliday error.");
                }
            });
            event.preventDefault();
        });

        $("#logOutConfirm").click(function (event) {
            window.location.href = "/";
            event.preventDefault();
        });

        $("#openCreateHoliday").click(function (event) {
            $("#createNewHolidayForm").show();
            event.preventDefault();
        });

        $("#holidayBeginTimeInput").datepick({dateFormat: 'yyyy-mm-dd'});
        $("#holidayEndTimeInput").datepick({dateFormat: 'yyyy-mm-dd'});

        loadCheckSettings();
        loadHolidaysSettings();
        $("#createNewHolidayForm").hide();
    });
</script>
</html>

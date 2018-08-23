<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-23
  Time: 上午7:54
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
            margin-left: 360px;
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
        #staffTable {
            margin-top: 10%;
        }
        #name, #place, #firstLanguage, #secondLanguage {
            text-align: center;
            width: 150px;
            height: 50px;
        }
        #id {
            text-align: center;
            width: 75px;
            height: 50px;
        }
        #staffNameInput {
            width: 115px;
        }
        #setStaffName, #setPlace, #setLanguage1, #setLanguage2 {
            margin-top: 10px;
        }
        #create {
            margin-top: 10px;
            display: inline;
        }
        #staffTable td {
            text-align: center;
            height: 50px;
        }
        #bottomSpace {
            height: 100px;
        }
        #delete, #openCreate, #back {
            display: inline;
        }
    </style>
    <title>Staff Management</title>

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

    <table class="table-bordered" id="staffTable">
        <thead>
        <tr id="staffTableHeader">
            <th id="id">ID</th>
            <th id="name">Name</th>
            <th id="place">Place</th>
            <th id="firstLanguage">First Language</th>
            <th id="secondLanguage">Second Language</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <button id="openCreate" type="button" class="btn btn-primary">New</button>
    <button id="delete" type="button" class="btn btn-primary">Delete</button>
    <button id="back" type="button" class="btn btn-primary" onclick="history.go(-1);">Back</button>

    <div id="createNewStaffForm">
        <h3 id="createNewStaffHeader">Create New Staff:</h3>
        <div id="setStaffName">
            Name:<input class="form-inline" id="staffNameInput">
        </div>
        <div id="setPlace">Place:
            <select id="placeSelect">
                <option value="Asia/Shanghai">Asia/Shanghai</option>
                <option value="Asia/Tokyo">Asia/Tokyo</option>
                <option value="Asia/Singapore">Asia/Singapore</option>
            </select>
        </div>
        <div id="setLanguage1">First Language:
            <select id="language1Select">
                <option value="Chinese">Chinese</option>
                <option value="English">English</option>
                <option value="Japanese">Japanese</option>
            </select>
        </div>
        <div id="setLanguage2">Second Language:
            <select id="language2Select">
                <option value="Chinese">Chinese</option>
                <option value="English">English</option>
                <option value="Japanese">Japanese</option>
            </select>
        </div>

        <button id="create" type="button" class="btn btn-primary">Create</button>
    </div>

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

<div class="modal fade" id="haveToInputNameModal" tabindex="-1" role="dialog" aria-labelledby="haveToInputNameModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="haveToInputNameModalLabel">
                    Create New Staff
                </h4>
            </div>
            <div class="modal-body">
                You have to input the name of staff.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="createNewStaffModal" tabindex="-1" role="dialog" aria-labelledby="createNewStaffModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="createNewStaffModalLabel">
                    Create New Staff
                </h4>
            </div>
            <div class="modal-body" id="createNewStaffModalBody">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="createNewStaffConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="deleteStaffModal" tabindex="-1" role="dialog" aria-labelledby="deleteStaffModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="deleteStaffModalLabel">
                    Delete Staff
                </h4>
            </div>
            <div class="modal-body">
                Are you sure to delete this staff?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="deleteStaffConfirm">Yes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isCreatedStaffModal" tabindex="-1" role="dialog" aria-labelledby="isCreatedStaffModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isCreatedStaffModalLabel">
                    Create New Staff
                </h4>
            </div>
            <div class="modal-body">
                New staff is created.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="isDeletedStaffModal" tabindex="-1" role="dialog" aria-labelledby="isDeletedStaffModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="isDeletedStaffModalLabel">
                    Delete Staff
                </h4>
            </div>
            <div class="modal-body">
                Staff is deleted.
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
                You have to choose a staff.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        var chosenContent;
        var $chosenTr;

        function loadStaffs() {
            $.ajax({
                url: "getStaffs",
                type: "GET",
                dataType: "json",
                success: function (staffs) {
                    $("#staffTable tbody").empty();
                    $.each(staffs, function (i, staff) {
                        var tr = "<tr id=\"" + staff.id + "\">" +
                            "<td>" + staff.id + "</td>" +
                            "<td>" + staff.name + "</td>" +
                            "<td>" + staff.place + "</td>" +
                            "<td>" + staff.language1 + "</td>" +
                            "<td>" + staff.language2 + "</td></tr>";
                        $("#staffTable").append(tr);
                    })
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("loadStaffs error.");
                }
            })
        }

        $("#createNewStaffConfirm").click(function createNewStaff() {
            var newStaff = {
                name: $("#staffNameInput").val(),
                place: $("#placeSelect").val(),
                language1: $("#language1Select").val(),
                language2: $("#language2Select").val()
            };
            $.ajax({
                url: "createNewStaff",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(newStaff),
                dataType: "json",
                success: function (Message) {
                    $("#isCreatedStaffModal").modal("toggle");
                    $("#createNewStaffModal").modal("hide");
                    loadStaffs();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("create new staffs error.");
                }
            })
        });

        $("#logOutConfirm").click(function (event) {
            window.location.href = "/";
            event.preventDefault();
        });

        $("#create").click(function (event) {
            var name = $("#staffNameInput").val();
            var place = $("#placeSelect").val();
            var language1 = $("#language1Select").val();
            var language2 = $("#language2Select").val();
            if( name !== "") {
                var dialogBody = "Name: " + name +
                    "<br/> Place: " + place +
                    "<br/> First Language: " + language1 +
                    "<br/> Second Language: " + language2 +
                    "<br/> Are you sure to create this staff?";
                $("#createNewStaffModalBody").html(dialogBody);
                $("#createNewStaffModal").modal("toggle");
                loadStaffs();
            } else {
                $("#haveToInputNameModal").modal("toggle");
            }
            event.preventDefault();
        });

        $("#delete").click(function (event) {
            if(chosenContent != null) {
                $("#deleteStaffModal").modal("toggle");
            } else {
                $("#haveToChooseOneModal").modal("toggle");
            }
            event.preventDefault();
        });

        $("#staffTable").on("click", "tr", function () {
            var $tr = $("tr");
            $tr.css("background-color", "#FFFFFF");
            $tr.css("color", "#000000");
            var contentId = $(this).attr("id");
            if(contentId !== "staffTableHeader") {
                $(this).css("background-color", "lightseagreen");
                $(this).css("color", "#FFFFFF");
                chosenContent = contentId;
                $chosenTr = $(this);
            }
        });

        $("#deleteStaffConfirm").click(function (event) {
            var deleteId = chosenContent;
            $.ajax({
                url: "deleteStaff",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: deleteId,
                dataType: "json",
                success: function (Message) {
                    loadStaffs();
                    $("#isDeletedStaffModal").modal("toggle");
                    $("#deleteStaffModal").modal("hide");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("deleteStaff error.");
                }
            });
            event.preventDefault();
        });

        $("#openCreate").click(function (event) {
            $("#createNewStaffForm").show();
            event.preventDefault();
        });

        loadStaffs();
        $("#createNewStaffForm").hide();
    });
</script>
</html>

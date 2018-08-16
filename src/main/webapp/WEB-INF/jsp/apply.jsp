<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-16
  Time: 上午8:51
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
            width: 100px;
            height: 150px;
        }
        #timetable th{
            width: 100px;
            height: 50px;
        }
        .container {
            margin-top: 10%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #applyReasonHeader{
            margin-top: 50px
        }
        #applyReason {
            width: 800px;
            height: 100px;
            text-align: left;
        }
        #submit {
            margin-top: 10px;
        }
    </style>
    <title>Apply</title>
</head>
<body>
<div class="container">
    <form class="form-signin" id="applyReasonForm" action="<c:url value="submitApplication"/>" method="post">
        <table class="table-bordered" id="timetable">
            <thead>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
        </table>

        <h2 class="form-signin-heading" id="applyReasonHeader">Please write you apply reason:</h2>
        <label for="applyReason" class="sr-only">Apply Reason</label>
        <textarea type="text" id="applyReason" class="form-control" name = "applyReason" placeholder="Apply Reason"></textarea>
        <p>
            <button class="btn btn-primary" id="submit" type="submit">Submit</button>
        </p>
    </form>
</div>
</body>
</html>

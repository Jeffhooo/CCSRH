<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hejunfeng
  Date: 18-8-14
  Time: 下午1:58
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
            width: 360px;
            margin-top: 10%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        #signIn {
            margin-top: 10px;
        }
        .form-signin-heading {
            text-align: center;
        }
    </style>
    <title>Log In</title>
   </head>
   <body>
            <div class="container">
                    <c:if test="${!empty error}">
                        <font color="red"><c:out value="${error}" /></font>
                    </c:if>
                    <form class="form-signin" action="<c:url value="check"/>" method="post">
                        <h2 class="form-signin-heading">Staff Rostering Helper</h2>
                        <label for="inputUsername" class="sr-only">User Name</label>
                        <input type="username" id="inputUsername" class="form-control" name = "userName" placeholder="User Name" required autofocus>
                        <label for="inputPassword" class="sr-only">Password</label>
                        <input type="password" id="inputPassword" class="form-control" name = "password" placeholder="Password" required>
                        <button class="btn btn-lg btn-primary btn-block" id="signIn" type="submit">Log In</button>
                    </form>
            </div>

   </body>
</html>

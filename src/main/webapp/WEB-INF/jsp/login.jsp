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
            width: 450px;
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
        .btn-primary {
            background-color: lightseagreen;
            border: lightseagreen;
        }
        .btn-primary:hover {
            background-color: mediumseagreen;
        }
        .btn-primary:visited {
            background-color: lightseagreen;
        }
        #bottomSpace {
            height: 100px;
        }
        footer{
            width: 450px;
            position:absolute;
            bottom:0;
            margin-bottom: 5px;
            text-align: center;
        }
        #inputUsername, #inputPassword, #signIn {
            width: 360px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <title>Call Center Rostering Helper</title>
   </head>
   <body>
   <div class="container">
       <c:if test="${!empty error}">
           <font color="red"><c:out value="${error}" /></font>
       </c:if>
       <form class="form-signin" action="<c:url value="check"/>" method="post">
           <h2 class="form-signin-heading">Call Center Rostering Helper</h2>
           <label for="inputUsername" class="sr-only">User Name</label>
           <input type="username" id="inputUsername" class="form-control" name = "userName" placeholder="User Name" required autofocus>
           <label for="inputPassword" class="sr-only">Password</label>
           <input type="password" id="inputPassword" class="form-control" name = "password" placeholder="Password" required>
           <button class="btn btn-lg btn-primary btn-block" id="signIn" type="submit">Log In</button>
       </form>
       <div id="bottomSpace"></div>
       <footer class="copyright">
           &copy; 2018 He Junfeng All Right Reserved<br>
       </footer>
   </div>
   </body>
</html>

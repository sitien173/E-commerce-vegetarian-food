<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ngosi
  Date: 6/29/2021
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quên mật khẩu</title>
    <c:import url="../inc/head.jsp"/>
    <style>
        .content {
            position: relative;
            top: 30%;
        }
    </style>
</head>
<body>
<div align="center" class="content">
    <h5 class="text-info">Vui lòng nhập email đã đăng kí</h5>
    <c:url value="/user/forgotPassword/" var="action"/>
    <c:out value="${messenger}"/>
    <form action="${action}" method="post" class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-3">
                <input class="form-control" type="email" required name="email" placeholder="Email" id="email">
                <br>
                <button class="btn btn-success" type="submit">Gửi mật khẩu mới</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

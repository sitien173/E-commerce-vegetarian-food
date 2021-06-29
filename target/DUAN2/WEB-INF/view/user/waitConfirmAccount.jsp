<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ngosi
  Date: 6/29/2021
  Time: 8:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .content {
            position: relative;
            top: 30%;
        }
    </style>
</head>
<body>
        <div align="center" class="content">
            <h4><c:out value="${messenger}"/></h4>
            <a class="text-info" href="<c:url value="/user/registration/resendRegistrationConfirm?token=${param.token}"/>">New confirmation request</a>
        </div>
</body>
</html>

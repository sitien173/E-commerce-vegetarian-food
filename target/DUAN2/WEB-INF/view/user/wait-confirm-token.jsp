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
    <title>Chờ xác nhận</title>
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
            <h5 class="text-info"><c:out value="${messenger}"/></h5>
            <c:if test="${not empty param.token}">
                <a class="text-info" href="<c:url value="${requestToken}?token=${param.token}"/>">New confirmation request</a>
            </c:if>
        </div>
</body>
</html>

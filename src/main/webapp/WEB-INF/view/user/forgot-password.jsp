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
    <c:import url="../inc/headUser.jsp"/>
</head>
<body>
<c:import url="../inc/header.jsp"/>
<div class="container" style="margin: 50px">
    <div class="row d-flex justify-content-center">
        <h5 class="text-center text-info">Vui lòng nhập email đã đăng kí</h5>
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
</div>
<c:import url="../inc/footer.jsp"/>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
</body>
</html>

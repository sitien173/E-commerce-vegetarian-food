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
    <title>Cập nhật mật khẩu</title>
   <c:import url="../inc/headUser.jsp"/>
</head>
<body>
<c:import url="../inc/header.jsp"/>
<div class="container" style="margin: 50px">
    <div class="row d-flex justify-content-center">
        <c:url var="action" value="/user/forgotPassword/updatePassword"/>
        <h5 class="text-center text-info">Cập nhật mật khẩu mới</h5>
        <form action="${action}" method="post" class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-4">
                    <div class="form-group">
                        <label for="password">Mật khẩu mới</label>
                        <input pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$" class="form-control" type="password" name="password" id="password" required placeholder="Nhập mật khẩu mới">
                    </div>
                    <div class="form-group">
                        <label for="password">Nhập lại</label>
                        <input pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$" class="form-control" type="password" name="rePassword" id="rePassword" required placeholder="Nhập lại">
                    </div>
                    <input type="hidden" name="token" value="${param.token}"/>
                    <br>
                    <button class="btn btn-success"  id="btnSubmit" type="submit">Cập nhật</button>
                </div>
            </div>
        </form>
    </div>
</div>
<c:import url="../inc/footer.jsp"/>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/validForm.js"></script>
</body>
</html>

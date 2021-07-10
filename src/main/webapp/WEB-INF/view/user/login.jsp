<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Đăng nhập</title>
    <c:import url="../inc/headUser.jsp"/>
    <!--
    -->
</head>
<body>
<c:import url="../inc/header.jsp"/>
<div class="container" style="margin: 50px">
    <div class="row d-flex justify-content-center">
        <div class="col-9" align="center">
            <c:url var="action" value="/user/login"/>
            <form id="form" action="${action}" method="post">
                <h2 class="text-center text-danger">Đăng nhập</h2>
                <p class="text-center text-info">for better experience</p>
                <fieldset class="row col-6 form-group">
                    <label for="username">username</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="username"/>
                </fieldset>
                <fieldset class="row col-6 form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password"/>
                </fieldset>
                <div class="row">
                    <a id="forgotPassword" class="text-center text-info" href="<c:url value="/user/forgotPassword/"/>">Quên mật khẩu?</a>
                </div>
                <div class="row d-flex justify-content-center" style="margin: 10px 0">
                    <button type="submit" class="col-3 btn btn-primary">Đăng nhập</button>
                </div>
                <a href="<c:url value="/user/registration/"/>" class="text-info" id="registration">Chưa có tài khoản? Đăng ký <i class="fas fa-arrow-right"></i></a>
            </form>
        </div>
    </div>
    <div class="modal"></div>
</div>

<!-- Start Footer -->
<c:import url="../inc/footer.jsp"/>
<!-- End Footer -->

<!-- Start Script -->
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="<c:url value="/disk/resources/js/Address.js"/>"></script>
<script src="<c:url value="/disk/resources/js/validForm.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
<script src="<c:url value="/disk/resources/js/validForm.js"/>"></script>

<!-- End Script -->
</body>

</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Đăng ký</title>
    <c:import url="../inc/headUser.jsp"/>
    <!--
    -->
</head>
<body>
<c:import url="../inc/header.jsp"/>
<div class="container" style="margin: 50px">
    <div class="row d-flex justify-content-center">
        <div class="col-9" align="center">
            <c:url var="action" value="/user/registration/"/>
            <form:form id="formRegistration" action="${action}"
                       modelAttribute="user"
                       method="post"
                       enctype="multipart/form-data"
                       cssClass="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6 form-group">
                                <label for="name">Họ và Tên</label>
                                <form:input cssClass="form-control" required="required" path="name" id="name" placeholder="Name"/>
                                <form:errors path="name"/>
                            </div>
                            <div class="col-6 form-group">
                                <label for="username">Tên Đăng Nhập</label>
                                <form:input cssClass="form-control" path="username" required="required" type="text"  id="username" placeholder="User Name"/>
                                <form:errors path="username"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6 form-group">
                                <label for="email">Email</label>
                                <form:input cssClass="form-control" path="email" required="required" type="email" id="email" placeholder="Email"/>
                                <form:errors path="email"/>
                            </div>
                            <div class="col-6 form-group">
                                <label for="phone">Số Điện Thoại</label>
                                <form:input cssClass="form-control" path="phone" required="required" type="tel"  id="phone" placeholder="Phone"/>
                                <form:errors path="phone"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6 form-group">
                                <label for="password">Mật Khẩu</label>
                                <form:password cssClass="form-control" path="password" required="required" id="password" placeholder="Password"/>
                                <form:errors path="password"/>
                            </div>
                            <div class="col-6 form-group">
                                <label for="rePassword">Nhập Lại Mật Khẩu</label>
                                <input class="form-control" type="password" id="rePassword" placeholder="RePassword" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-4">
                                <lable for="address.ward.province.provinceId">Tỉnh thành phố</lable>
                                <form:select path="address.ward.province.provinceId" cssClass="form-control">
                                    <form:option value="${user.address.ward.province.provinceId}">${user.address.ward.province.provinceName}</form:option>
                                </form:select>
                            </div>
                            <div class="col-4">
                                <lable for="address.ward.district.districtId">Quận huyện</lable>
                                <form:select path="address.ward.district.districtId" cssClass="form-control">
                                    <form:option value="${user.address.ward.district.districtId}">${user.address.ward.district.districtName}</form:option>
                                </form:select>
                            </div>
                            <div class="col-4">
                                <lable for="address.ward.ward.wardId">Phường xã</lable>
                                <form:select path="address.ward.wardId" cssClass="form-control">
                                    <form:option value="${user.address.ward.wardId}">${user.address.ward.wardName}</form:option>
                                </form:select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="address.addr">Địa chỉ cụ thể</label>
                                <form:textarea path="address.addr" cssClass="form-control"/>
                                <form:errors path="address.addr"/>
                            </div>
                            <div class="col-6">
                                <label for="avt">Ảnh đại diện</label>
                                <input type="file" id="avt" name="avt" accept="image/*" required>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <%--        hidden data --%>
                <a href="<c:url value="/user/login/"/>" class="text-decoration-none" style="margin-right: 20px">Đã có tài khoản? Đăng nhập</a>
                <button class="btn btn-success" type="submit">Đăng ký</button>
            </form:form>
        </div>
    </div>
    <div class="modal"></div>
</div>

<!-- Start Footer -->
<c:import url="../inc/footer.jsp"/>
<!-- End Footer -->

<!-- Start Script -->
<script src="<c:url value="/disk/resources/js/constants.js"/>"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="<c:url value="/disk/resources/js/Address.js"/>"></script>
<script src="<c:url value="/disk/resources/js/validForm.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>

<!-- End Script -->
</body>

</html>
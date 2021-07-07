<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thông tin</title>
    <c:import url="../inc/headUser.jsp"/>
    <!--
    -->
</head>
<body>
<c:import url="../inc/header.jsp"/>
<div class="container">
    <div class="row d-flex justify-content-center">
       <div class="col-9" align="center">
           <c:url value="/user/update" var="action"/>
           <form:form modelAttribute="user" method="post" action="${action}" cssStyle="margin: 30px">
               <form:hidden path="username"/>
               <form:hidden path="avatar"/>
               <form:hidden path="enabled"/>
               <form:hidden path="accountNonExpired"/>
               <form:hidden path="credentialsNonExpired"/>
               <form:hidden path="createdAt"/>
              <div class="row">
                  <div class="col-6">
                      <lable for="name">Họ và tên</lable>
                      <form:input path="name" cssClass="form-control"/>
                      <form:errors path="name"/>
                  </div>
                  <div class="col-6">
                      <label for="phone">Số điện thoại</label>
                      <form:input path="phone" cssClass="form-control"/>
                  </div>
              </div>
               <div class="row">
                   <div class="col-6">
                       <lable for="email">Email</lable>
                       <form:input path="email" cssClass="form-control"/>
                       <form:errors path="email"/>
                   </div>
                   <div class="col-6">
                       <label for="avt">Avatar</label>
                        <input type="file" accept="/image/*" id="avt" name="avt">
                   </div>
               </div>
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
                   <div class="col-12">
                       <label for="address.addr">Địa chỉ cụ thể</label>
                       <form:textarea path="address.addr" cssClass="form-control"/>
                       <form:errors path="address.addr"/>
                   </div>
               </div>
               <div class="row">
                   <div class="col-6">
                       <label for="password">Mật khẩu</label>
                       <form:password path="password" cssClass="form-control" value="${user.password}"/>
                       <form:errors path="password"/>
                   </div>
                   <div class="col-6">
                       <label for="rePassword">Nhập lại mật khẩu</label>
                       <input type="password" class="form-control" name="rePassword" id="rePassword" value="${user.password}"/>
                   </div>
               </div>
               <div class="row" style="margin: 20px">
                   <div class="col-12 d-flex justify-content-center">
                       <button class="col-3 btn btn-secondary" type="button" onclick="location.href='<c:url value="/home"/>'" style="margin-right: 30px">Cancel</button>
                       <button class="col-3 btn btn-success" type="submit">Cập nhật</button>
                   </div>
               </div>
           </form:form>
       </div>
    </div>
    <div class="modal"></div>
</div>

<!-- Start Footer -->
<c:import url="../inc/footer.jsp"/>
<!-- End Footer -->

<!-- Start Script -->
<script src="<c:url value="/disk/resources/js/Address.js"/>"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
<script src="<c:url value="/disk/resources/js/validForm.js"/>"></script>

<!-- End Script -->
</body>

</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký</title>
    <c:import url="../inc/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/login.css"/>
</head>
<body>
<div class="container">
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
                       <label for="name">Name</label>
                       <form:input cssClass="form-control" required="required" path="name" id="name" placeholder="Name"/>
                       <form:errors path="name"/>
                   </div>
                   <div class="col-6 form-group">
                       <label for="username">User Name</label>
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
                        <label for="phone">Phone</label>
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
                        <label for="password">Password</label>
                        <form:password cssClass="form-control" path="password" required="required" id="password" placeholder="Password"/>
                        <form:errors path="password"/>
                    </div>
                    <div class="col-6 form-group">
                        <label for="rePassword">RePassword</label>
                        <input class="form-control" type="password" id="rePassword" placeholder="RePassword" required>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-6 form-group">
                       <div class="row">
                           <div class="col-12">
                               <label for="address.ward.province.provinceId">Province</label>
                               <form:select  path="address.ward.province.provinceId" class="form-control" required="required">
                                   <form:option value="${user.address.ward.province.provinceId}"><c:out value="${user.address.ward.province.provinceName}"/></form:option>
                               </form:select>
                               <form:errors path="address.ward.province.provinceId"/>
                           </div>
                       </div>
                        <div class="row">
                            <div class="col-12">
                                <label for="address.ward.district.districtId">District</label>
                                <form:select path="address.ward.district.districtId" class="form-control" required="required">
                                    <form:option value="${user.address.ward.district.districtId}"><c:out value="${user.address.ward.district.districtName}"/></form:option>
                                </form:select>
                                <form:errors path="address.ward.district.districtId"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label for="address.ward.wardId">Ward</label>
                                <form:select path="address.ward.wardId" class="form-control" required="required">
                                    <form:option value="${user.address.ward.wardId}"><c:out value="${user.address.ward.wardName}"/></form:option>
                                </form:select>
                                <form:errors path="address.ward.wardId"/>
                            </div>
                        </div>

                    </div>
                    <div class="col-6 form-group">
                        <div class="row">
                            <div class="col-12">
                                <label for="address.addr">Address</label>
                                <form:input path="address.addr" type="text" class="form-control" placeholder="My Address" required="required"/>
                                <form:errors path="address.addr"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label for="avatar">Avatar</label>
                                <input class="form-control" required type="file" accept="image/*" name="avt" id="avatar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <%--        hidden data --%>
        <form:button type="submit" cssClass="btn btn-outline-success">Registration</form:button>
    </form:form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/disk/resources/js/Address.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/disk/resources/js/validForm.js"></script>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="sitien173">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/fontawesome.min.css" integrity="sha512-OdEXQYCOldjqUEsuMKsZRj93Ht23QRlhIb8E/X0sbwZhme8eUw6g8q7AdxGJKakcBbv7+/PX0Gc2btf7Ru8cZA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css" integrity="sha512-usVBAd66/NpVNfBge19gws2j6JZinnca12rAe2l+d+QkLU9fiG02O1X8Q6hepIpr/EYKZvKx/I9WsnujJuOmBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/login.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
                               <label for="province">Province</label>
                               <select class="form-control" required id="province">
                               </select>
                           </div>
                       </div>
                        <div class="row">
                            <div class="col-12">
                                <label for="district">District</label>
                                <select class="form-control" required id="district">
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label for="ward">Ward</label>
                                <select class="form-control" required name="ward" id="ward">
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="col-6 form-group">
                        <div class="row">
                            <div class="col-12">
                                <label for="addr">Address</label>
                                <input type="text" class="form-control" name="addr" placeholder="My Address" id="addr" required>
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
        <span class="text-muted text-danger"><c:out value="${param.messenger}"/></span>
        <%--        hidden data --%>
        <form:button type="submit">Registration</form:button>
        <a href="<c:url value="/user/login"/>" class="text-info" id="registration"><i class="fas fa-arrow-left"></i>Have a Account. Click to login </a>
    </form:form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/disk/resources/js/Address.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/disk/resources/js/Registration.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.min.js" integrity="sha512-a6ctI6w1kg3J4dSjknHj3aWLEbjitAXAjLDRUxo2wyYmDFRcz2RJuQr5M3Kt8O/TtUSp8n2rAyaXYy1sjoKmrQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/fontawesome.min.js" integrity="sha512-KCwrxBJebca0PPOaHELfqGtqkUlFUCuqCnmtydvBSTnJrBirJ55hRG5xcP4R9Rdx9Fz9IF3Yw6Rx40uhuAHR8Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <c:import url="../inc/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/style.css"/>"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body>
<div class="container-scroller">
    <%--    Navbar --%>
    <c:import url="../inc/nav_admin.jsp"/>
    <div class="container-fluid page-body-wrapper">
        <%--        Navbar left --%>
        <c:import url="../inc/navbar-left.jsp"/>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h4 class="card-title">Feedback</h4>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <h6 class="card-title">Lọc theo trạng thái</h6>
                                            <select name="status" class="form-control">
                                                <option value="0" class="text-info">ĐANG CHỜ XÁC NHẬN</option>
                                                <option value="1">ĐÃ XÁC NHẬN</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table table-responsive fixed-table-body">
                                    <table id="feedback" class="table-borderless ">
                                        <thead>
                                        <tr>
                                            <th class="text-info" scope="col">Name</th>
                                            <th class="text-info" scope="col">Product</th>
                                            <th class="text-info" scope="col">Actions</th>
                                            <th class="text-info" scope="col">Feedback</th>
                                            <th class="text-info" scope="col">Rating</th>
                                        </tr>
                                        </thead>
                                        <tbody id="content">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal"></div>
<script src="<c:url value="/disk/resources/js/adminFeedback.js"/>"></script>
</body>
</html>
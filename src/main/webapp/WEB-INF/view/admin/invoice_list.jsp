<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <c:import url="../inc/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/style.css"/>"/>
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
                                      <h4 class="card-title">Order</h4>
                                  </div>
                                   <div class="col-sm-9">
                                       <label for="orderStatus">Lọc theo trạng thái</label>
                                       <select id="orderStatus" class="form-control">
                                           <option selected class='badge-outline-success' value="0">ĐANG CHỜ XỬ LÍ</option>
                                           <option class='badge-outline-success' value="1">ĐÃ XỬ LÍ</option>
                                           <option class='badge-outline-success' value="2">ĐANG GIAO</option>
                                           <option class='badge-outline-success' value="3">ĐÃ GIAO</option>
                                           <option class='badge-outline-success' value="4">YÊU CẦU HUỶ ĐƠN HÀNG</option>
                                           <option class='badge-outline-success' value="5">ĐƠN HÀNG ĐÃ HUỶ</option>
                                       </select>
                                   </div>
                               </div>
                            </div>
                            <div class="card-body">
                                <div class="table table-responsive fixed-table-body">
                                    <table id="orders" class="table-borderless">
                                        <thead>
                                        <tr>
                                            <th class="text-info" scope="col">Actions</th>
                                            <th class="text-info" scope="col">Order</th>
                                            <th class="text-info" scope="col">Created At</th>
                                            <th class="text-info" scope="col">Status</th>
                                            <th class="text-info" scope="col">Note</th>
                                            <th class="text-info" scope="col">Total</th>
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
<script src="<c:url value="/disk/resources/js/adminInvoice.js"/> "></script>
</body>
</html>
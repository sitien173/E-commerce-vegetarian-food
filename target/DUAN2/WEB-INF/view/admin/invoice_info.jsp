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
                        <div class="table">
                            <h4 class="text-info" >Detail Order: <c:out value="${orderInfo.id}#${orderInfo.user.name}"/></h4>
                        </div>
                        <div class="col-4 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <h4 class="card-title text-center">Chung</h4>
                                        <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                            <div class="text-md-center text-xl-left">
                                                <h6 class="mb-1">Ngày tạo</h6>
                                                <div class="text-wrap badge badge-outline-primary"><c:out value="${orderInfo.createdAt}"/></div>
                                            </div>
                                        </div>
                                        <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                            <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                                <h6 class="mb-1">Trạng thái</h6>
                                                <c:choose>
                                                    <c:when test="${orderInfo.status eq 0}">
                                                        <div class="badge badge-outline-warning">ĐANG XỬ LÍ</div>
                                                    </c:when>
                                                    <c:when test="${orderInfo.status eq 1}">
                                                        <div class="badge badge-outline-info">ĐÃ XỬ LÍ</div>
                                                    </c:when>
                                                    <c:when test="${orderInfo.status eq 2}">
                                                        <div class="badge badge-outline-danger">ĐANG GIAO</div>
                                                    </c:when>
                                                    <c:when test="${orderInfo.status eq 3}">
                                                        <div class="badge badge-outline-success">ĐÃ GIAO</div>
                                                    </c:when>
                                                    <c:when test="${orderInfo.status eq 4}">
                                                        <div class="badge badge-outline-success">YÊU CẦU HUỶ</div>
                                                    </c:when>
                                                    <c:when test="${orderInfo.status eq 5}">
                                                        <div class="badge badge-outline-success">ĐÃ HUỶ</div>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                            <div class="text-md-center text-xl-left">
                                                <h6 class="mb-1">Thanh toán</h6>
                                                <c:if test="${orderInfo.payMethod eq 'PAYPAL'}">
                                                    <div class="text-wrap badge badge-outline-primary">ĐÃ THANH TOÁN</div>
                                                </c:if>
                                                <c:if test="${orderInfo.payMethod ne 'PAYPAL'}">
                                                    <div class="text-wrap badge badge-outline-primary">THANH TOÁN KHI NHẬN HÀNG</div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-8 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <h4 class="card-title text-center">Chi Tiết</h4>
                                        <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                            <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Họ và tên</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" readonly style="background-color: #2f323a" class="form-control" value="<c:out value="${orderInfo.user.name}"/>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Địa chỉ</label>
                                                            <div class="col-sm-9">
                                                                <textarea readonly style="background-color: #2f323a" class="form-control"><c:out value="${orderInfo.user.address.addr}, ${orderInfo.user.address.ward.wardName}, ${orderInfo.user.address.ward.district.districtName}, ${orderInfo.user.address.ward.province.provinceName}"/></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Email</label>
                                                            <div class="col-sm-9">
                                                                <input readonly style="background-color: #2f323a" type="text" class="form-control" value="<c:out value="${orderInfo.user.email}"/>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Số điện thoại</label>
                                                            <div class="col-sm-9">
                                                                <input readonly style="background-color: #2f323a" type="text" class="form-control" value="<c:out value="${orderInfo.user.phone}"/>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <h4 class="card-title text-center">Danh Sách Sản Phẩm</h4>
                                        <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                            <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                                <table class="table table-borderless table-responsive-sm">
                                                    <thead>
                                                    <tr>
                                                        <th class="text-info" scope="col">Sản phẩm</th>
                                                        <th class="text-info" scope="col">Giá</th>
                                                        <th class="text-info" scope="col">Sale</th>
                                                        <th class="text-info" scope="col">Số lượng</th>
                                                        <th class="text-info" scope="col">Tổng</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach varStatus="i" var="item" items="${orderInfo.items}">
                                                        <tr>
                                                            <td>
                                                                <div><img src="<c:url value="${item.product.images[0].location}"/>" class="img-xs rounded-circle"><span class="pl-2">${item.product.name}</span> </div>
                                                            </td>
                                                            <td><script>document.write(formatMoney(${item.product.price}))</script></td>
                                                            <td><script>document.write(formatMoney(${item.product.salePrice}))</script></td>
                                                            <td>${item.quantity}</td>
                                                            <td><script>document.write(formatMoney(${item.subTotal}))</script></td>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><script>document.write(formatMoney(${orderInfo.total}))</script></td>
                                                    </tr>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr><td> <button type="button" onclick="window.history.back()" class="btn btn-outline-success">Back</button></td></tr>
                                                    </tfoot>
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
        </div>
</div>
<div class="modal"></div>
</body>
</html>
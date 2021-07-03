<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<c:if test="${sessionScope.admin ne true}">
    <c:set var="ad" value="${sessionScope.logged}"/>
    <c:remove var="logged" scope="session"/>
    <c:remove var="admin" scope="session"/>
    <script>location.href = '${pageContext.request.contextPath}/user/sign_in'</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <c:import url="../inc/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<c:set var="url" value="${pageContext.request.contextPath}"/>
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
                        <c:if test="${orderInfo.payMethod eq 0}">
                            <span class="text-muted">Thanh toán khi nhận hàng</span>
                        </c:if>
                        <c:if test="${orderInfo.payMethod eq 1}">
                            <span class="text-muted">Thanh toán qua chuyển khoản</span>
                        </c:if>
                    </div>
                   <div class="col-4 grid-margin stretch-card">
                       <div class="card">
                           <div class="card-body">
                               <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                   <h4 class="card-title text-center">Chung</h4>
                                   <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                       <div class="text-md-center text-xl-left">
                                           <h6 class="mb-1">Ngày tạo</h6>
                                           <div class="badge badge-outline-primary"><c:out value="${fm.formatLocalDateTime(orderInfo.createdAt)}"/></div>
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
                                           <h6 class="mb-1">Khách Hàng</h6>
                                          <c:if test="${orderInfo.user.isAdmin eq 0}">
                                              <div class="badge badge-outline-primary">Khách Hàng</div>
                                          </c:if>
                                           <c:if test="${orderInfo.user.isAdmin eq 1}">
                                               <div class="badge badge-outline-primary">Admin</div>
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
                                                            <textarea readonly style="background-color: #2f323a" class="form-control"><c:out value="${orderInfo.user.addr.addr}, ${orderInfo.user.addr.ward.wardName}, ${orderInfo.user.addr.ward.district.districtName}, ${orderInfo.user.addr.ward.province.provinceName}"/></textarea>
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
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Khách hàng</label>
                                                        <div class="col-sm-3">
                                                            <c:if test="${orderInfo.user.isAdmin eq 0}">
                                                                <div class="badge badge-outline-primary">Người dùng</div>
                                                            </c:if>
                                                            <c:if test="${orderInfo.user.isAdmin eq 1}">
                                                                <div class="badge badge-outline-primary">Admin</div>
                                                            </c:if>
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
                                            <table class="table table-borderless table-responsive-xl">
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
                                                <c:set var="tempTotal" value="0"/>
                                                <c:set var="total" value="0"/>
                                                <c:forEach varStatus="i" var="item" items="${orderInfo.items}">
                                                    <div hidden>
                                                    <c:if test="${item.product.salePrice > 0}">
                                                        <c:out value="${tempTotal = item.quantity*item.product.salePrice}"/>
                                                    </c:if>
                                                    <c:if test="${item.product.salePrice eq 0}">
                                                        <c:out value="${tempTotal = item.quantity*item.product.price}"/>
                                                    </c:if>
                                                        <c:out value="${total = total + tempTotal}"/>
                                                    </div>
                                                    <tr>
                                                        <td>
                                                            <div><img src="${url}${item.product.image}" class="img-xs rounded-circle"><span class="pl-2">${item.product.name}</span> </div>
                                                        </td>
                                                        <td><script>document.write(formatMoney(${item.product.price}))</script></td>
                                                        <td><script>document.write(formatMoney(${item.product.salePrice}))</script></td>
                                                        <td>${item.quantity}</td>
                                                        <td><script>document.write(formatMoney(${tempTotal}))</script></td>
                                                    </tr>
                                                </c:forEach>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><script>document.write(formatMoney(${total}))</script></td>
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

</body>
</html>
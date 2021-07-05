<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Registration</h4>
                            <c:url var="action" value="/admin/invoice/update"/>
                            <form:form method="post" modelAttribute="invoice"
                                       action="${action}" class="form-sample">
                                <p class="card-description"> Order Edit </p>
                                <p class="text-info"><c:out value="${info}"/></p>
                                <div class="row">
                                    <form:hidden path="id"/>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Created At</label>
                                            <div class="col-sm-9">
                                                <form:input path="createdAt" cssClass="form-control"/>
                                                <form:errors path="createdAt" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Description</label>
                                            <div class="col-lg-9">
                                                <form:input path="description" cssClass="form-control"/>
                                                <form:errors path="description" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Status</label>
                                            <div class="col-lg-9">
                                                <form:select path="status" cssClass="form-control">
                                                    <form:option cssClass="badge badge-outline-primary" value="0">ĐANG CHỜ XỬ LÍ</form:option>
                                                    <form:option cssClass="badge badge-outline-primary" value="1">ĐÃ XỬ LÍ</form:option>
                                                    <form:option cssClass="badge badge-outline-primary" value="2">ĐANG GIAO</form:option>
                                                    <form:option cssClass="badge badge-outline-primary" value="3">ĐÃ GIAO</form:option>
                                                </form:select>
                                                <form:errors path="status" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Pay Method</label>
                                            <div class="col-sm-9">
                                                <form:input path="payMethod" cssClass="form-control"/>
                                                <form:errors path="payMethod" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Total</label>
                                            <div class="col-sm-9">
                                                <form:input path="total" cssClass="form-control"/>
                                                <form:errors path="total" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                                    <h4 class="card-title text-center">Chi Tiết</h4>
                                                    <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                                        <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group row">
                                                                        <form:hidden path="user.username"/>
                                                                        <label class="col-sm-3 col-form-label">Họ và tên</label>
                                                                        <div class="col-sm-9">
                                                                            <form:input path="user.name" disabled="true" cssStyle="background-color: #4e555b" class="form-control" />
                                                                            <form:errors path="user.name"  class="error" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Địa chỉ</label>
                                                                        <div class="col-sm-9">
                                                                            <form:textarea path="user.address.addr" cssStyle="background-color: #4e555b" cssClass="form-control" disabled="true"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Email</label>
                                                                        <div class="col-sm-9">
                                                                            <form:input path="user.email" disabled="true" cssStyle="background-color: #4e555b" class="form-control" />
                                                                            <form:errors path="user.email" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 col-form-label">Số điện thoại</label>
                                                                        <div class="col-sm-9">
                                                                            <form:input path="user.phone" disabled="true" class="form-control" cssStyle="background-color: #4e555b" />
                                                                            <form:errors path="user.phone" />                                                                        </div>
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
                                                    <h4 class="card-title text-center">List Item</h4>
                                                    <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                                        <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                                            <table class="table table-borderless table-responsive-sm">
                                                                <thead>
                                                                <tr>
                                                                    <th class="text-info">STT</th>
                                                                    <th class="text-info" scope="col">Sản phẩm</th>
                                                                    <th class="text-info" scope="col">Giá</th>
                                                                    <th class="text-info" scope="col">Sale</th>
                                                                    <th class="text-info" scope="col">Số lượng</th>
                                                                    <th class="text-info" scope="col">Tổng</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach varStatus="i" var="item" items="${invoice.items}">
                                                                    <tr>
                                                                        <td>${i.index}</td>
                                                                        <td>
                                                                            <img src="<c:url value="${item.product.images[0].location}"/> " class="img-xs rounded-circle" alt="thumbnail">
                                                                                ${item.product.name}
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
                                                                    <td></td>
                                                                    <td><script>document.write(formatMoney(${invoice.total}))</script></td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-dark" onclick="back()">Cancel</button>
                                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal"></div>
    <script>
        function back(){
            window.history.back();
        }
        $body = $("body");
        $(document).on({
            ajaxStart: function () {
                $body.addClass("loading");
            },
            ajaxStop: function () {
                $body.removeClass("loading");
            }
        });

    </script>
</body>
</html>
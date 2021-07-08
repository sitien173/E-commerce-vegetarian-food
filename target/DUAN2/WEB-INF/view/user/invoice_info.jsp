<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Lịch sử mua hàng</title>
   <c:import url="../inc/headUser.jsp"/>
    <!--
    -->
</head>

<body>
<c:import url="../inc/header.jsp"/>
<div class="container-fluid" style="margin: 20px">
    <!-- Button trigger modal -->
    <!-- Modal -->
   <c:out value="${info}"/>
    <c:if test="${not empty param.info}">
        <c:out value="${param.info}"/>
    </c:if>
    <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal-lg">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Danh sách sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab-modal" role="tablist">
                            <button class="nav-item nav-link active" id="nav-item-tab" data-bs-toggle="tab" data-bs-target="#nav-item" role="tab" aria-controls="nav-item" aria-selected="true">Danh sách sản phẩm</button>
                            <button class="nav-item nav-link" id="nav-info-tab" data-bs-toggle="tab" data-bs-target="#nav-info" role="tab" aria-controls="nav-info" aria-selected="false">Người nhận</button>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tab-content-modal">
                        <div class="tab-pane fade show active" id="nav-item" role="tabpanel" aria-labelledby="nav-item">
                            <div class="container-fluid">
                                <table class="table table-borderless table-hover">
                                    <thead class="thead">
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Hình ảnh</th>
                                        <th>Số lượng</th>
                                        <th>Giá</th>
                                        <th>Giảm giá</th>
                                        <th>Tạm tính</th>
                                    </tr>
                                    </thead>
                                    <tbody id="modal-table-body">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info">
                            <div class="container-fluid">
                                <table class="table table-borderless text-left" id="nav-info-content">

                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="row">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-search-tab" data-bs-toggle="tab" data-bs-target="#nav-search" type="button" role="tab" aria-controls="nav-search" aria-selected="true">Tìm Kiếm</button>
                        <button class="nav-link" id="nav-all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" role="tab" type="button" aria-controls="nav-all" aria-selected="false">Tất cả</button>
                        <button class="nav-link" id="nav-wait-confirm-tab" data-bs-toggle="tab" data-bs-target="#nav-wait-confirm" type="button" role="tab" aria-controls="nav-wait-confirm" aria-selected="false">Chờ xác nhận</button>
                        <button class="nav-link" id="nav-confirm-tab" data-bs-toggle="tab" data-bs-target="#nav-confirm" role="tab" type="button" aria-controls="nav-confirm" aria-selected="false">Chờ lấy hàng</button>
                        <button class="nav-link" id="nav-delivering-tab" data-bs-toggle="tab" data-bs-target="#nav-delivering" type="button" role="tab" aria-controls="nav-delivering" aria-selected="false">Đang giao</button>
                        <button class="nav-link" id="nav-delivered-tab" data-bs-toggle="tab" data-bs-target="#nav-delivered" type="button" role="tab" aria-controls="nav-delivered" aria-selected="false">Đã giao</button>
                        <button class="nav-link" id="nav-confirm-cancel-tab" data-bs-toggle="tab" data-bs-target="#nav-confirm-cancel" type="button" role="tab" aria-controls="nav-confirm-cancel" aria-selected="false">Yêu cầu huỷ đơn hàng</button>
                        <button class="nav-link" id="nav-cancel-tab" data-bs-toggle="tab" data-bs-target="#nav-cancel" role="tab" type="button" aria-controls="nav-cancel" aria-selected="false">Đã huỷ</button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-search" role="tabpanel" aria-labelledby="nav-search">
                        <div class="container-fluid">
                            <div class="input-group">
                                <div class="form-outline">
                                    <label for="search-order">Tra cứu đơn hàng của bạn</label>
                                   <form id="search-form">
                                       <div class="d-flex justify-content-center">
                                           <input type="search" id="search-order"  placeholder="Nhập mã đơn hàng" class="form-control"/>
                                           <button class="btn btn-aqua" type="submit">Tìm kiếm</button>
                                       </div>
                                       <span id="search-error" style="display: none;color:red;">ĐƠn hàng không có. Vui lòng nhập đúng</span>
                                   </form>
                                </div>
                            </div>
                        </div>
                        <table class="table table-responsive table-borderless table-hover">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Created At</th>
                                <th scope="col">Status</th>
                                <th scope="col">Total</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody id="nav-search-body">
                            </tbody>
                        </table>

                    </div>
                    <div class="tab-pane fade" id="nav-all" role="tabpanel" aria-labelledby="nav-all">
                        <div class="container-fluid">
                            <table class="table table-responsive table-borderless table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Actions</th>
                                </tr>
                                </thead>
                                <tbody id="nav-all-body">
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-wait-confirm" role="tabpanel" aria-labelledby="nav-wait-confirm"><div class="container-fluid">
                        <table class="table table-responsive table-borderless table-hover">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Created At</th>
                                <th scope="col">Status</th>
                                <th scope="col">Total</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody id="nav-wait-confirm-body">

                            </tbody>

                        </table>
                    </div></div>
                    <div class="tab-pane fade" id="nav-confirm" role="tabpanel" aria-labelledby="nav-confirm"><div class="container-fluid">
                        <table class="table table-responsive table-borderless table-hover">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Created At</th>
                                <th scope="col">Status</th>
                                <th scope="col">Total</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody id="nav-confirm-body">

                            </tbody>

                        </table>
                    </div></div>
                    <div class="tab-pane fade" id="nav-delivering" role="tabpanel" aria-labelledby="nav-delivering"><div class="container-fluid">
                        <table class="table table-responsive table-borderless table-hover">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Created At</th>
                                <th scope="col">Status</th>
                                <th scope="col">Total</th>
                            </tr>
                            </thead>
                            <tbody id="nav-delivering-body">

                            </tbody>

                        </table>
                    </div></div>
                    <div class="tab-pane fade" id="nav-delivered" role="tabpanel" aria-labelledby="nav-delivered">
                        <div class="container-fluid">
                            <table class="table table-responsive table-borderless table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                </tr>
                                </thead>
                                <tbody id="nav-delivered-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-confirm-cancel" role="tabpanel" aria-labelledby="nav-confirm-cancel">
                        <div class="container-fluid">
                            <table class="table table-responsive table-borderless table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Actions</th>
                                </tr>
                                </thead>
                                <tbody id="nav-confirm-cancel-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-cancel" role="tabpanel" aria-labelledby="nav-cancel">
                        <div class="container-fluid">
                            <table class="table table-responsive table-borderless table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                </tr>
                                </thead>
                                <tbody id="nav-cancel-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Start Footer -->
<c:import url="../inc/footer.jsp"/>
<!-- End Footer -->

<!-- Start Script -->
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="<c:url value="/disk/resources/js/constants.js"/>"></script>
<script src="<c:url value="/disk/resources/js/formatMoney.js"/>"></script>
<script src="<c:url value="/disk/resources/js/invoice.js"/>"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
<script src="<c:url value="/disk/resources/js/slick.min.js"/>"></script>
<!-- End Script -->
<script>

</script>
</body>

</html>
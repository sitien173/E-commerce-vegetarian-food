<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop eCommerce HTML CSS Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/disk/resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/disk/resources/img/favicon.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/templatemo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/custom.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/fontawesome.min.css">
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/slick.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/slick-theme.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/buttons.css"/>"/>
    <script src="<c:url value="/disk/resources/js/formatMoney.js"/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="<c:url value="/disk/resources/js/popup.js"/>"></script>
    <script src="<c:url value="/disk/resources/js/checkout.js"/>"></script>
    <!--
    -->
</head>

<body>
<!-- Start Top Nav -->
<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
    <div class="container text-light">
        <div class="w-100 d-flex justify-content-between">
            <div>
                <i class="fa fa-envelope mx-2"></i>
                <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                <i class="fa fa-phone mx-2"></i>
                <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
            </div>
            <div>
                <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
            </div>
        </div>
    </div>
</nav>
<!-- Close Top Nav -->


<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light shadow">
    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href="index.jsp">
            Zay
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/"/>">Trang chủ</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sản phẩm</a>
                        <div id="categories" class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="#">Page 2</a>
                            <a class="dropdown-item" href="#">Page 3</a>
                            <a class="dropdown-item" href="#">Page 4</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/about"/>">Về chúng tôi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/contact"/>">Liên hệ</a>
                    </li>
                </ul>
            </div>
            <div class="navbar align-self-center d-flex">
                <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                    <div class="input-group">
                        <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                        <div class="input-group-text">
                            <i class="fa fa-fw fa-search"></i>
                        </div>
                    </div>
                </div>
                <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                    <i class="fa fa-fw fa-search text-dark mr-2"></i>
                </a>
                <a href="<c:url value="/cart/"/> " id="cart" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-icon position-relative text-decoration-none" href="#">
                    <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                </a>
                <c:if test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}">
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle nav-icon position-relative text-decoration-none" href="#" id="account" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-fw fa-user text-dark mr-3"></i></a>
                        <div class="dropdown-menu" aria-labelledby="account">
                            <a class="dropdown-item" href="#">Lịch sử mua hàng</a>
                            <a class="dropdown-item" href="">Sửa thông tin</a>
                            <a class="dropdown-item" href="<c:url value="/user/forgotPassword"/>">Đổi mật khẩu</a>
                            <a class="dropdown-item" href="<c:url value="/logout"/>">Đăng xuất</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}">
                    <a class="nav-icon position-relative text-decoration-none" href="<c:url value="/user/login"/> ">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                    </a>
                </c:if>
            </div>
        </div>

    </div>
</nav>
<!-- Close Header -->

<!-- Modal -->
<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="w-100 pt-1 mb-5 text-right">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" method="get" class="modal-content modal-body border-0 p-0">
            <div class="input-group mb-2">
                <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                <button type="submit" class="input-group-text bg-success text-light">
                    <i class="fa fa-fw fa-search text-white"></i>
                </button>
            </div>
        </form>
    </div>
</div>
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
                                    <input type="search" id="search-order"  placeholder="Nhập mã đơn hàng" class="form-control"/>
                                    <span id="search-error" style="display: none;color:red;">ĐƠn hàng không có. Vui lòng nhập đúng</span>
                                </div>
                            </div>
                        </div>
                        <table class="table table-responsive table-borderless table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Order</th>
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
                                    <th scope="col">Order</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Actions</th>
                                </tr>
                                </thead>
                                <tbody id="nav-all-body">
                                </tbody>
                                <tfoot><tr><td><span type="cursor: pointer" onclick="showMore('all')" class="btn btn-success">Show More</span></td></tr></tfoot>

                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-wait-confirm" role="tabpanel" aria-labelledby="nav-wait-confirm"><div class="container-fluid">
                        <table class="table table-responsive table-borderless table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Order</th>
                                <th scope="col">Created At</th>
                                <th scope="col">Status</th>
                                <th scope="col">Total</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody id="nav-wait-confirm-body">

                            </tbody>
                            <tfoot><tr><td><span type="cursor: pointer" onclick="showMore('wait-confirm')" class="btn btn-success">Show More</span></td></tr></tfoot>

                        </table>
                    </div></div>
                    <div class="tab-pane fade" id="nav-confirm" role="tabpanel" aria-labelledby="nav-confirm"><div class="container-fluid">
                        <table class="table table-responsive table-borderless table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Order</th>
                                <th scope="col">Created At</th>
                                <th scope="col">Status</th>
                                <th scope="col">Total</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody id="nav-confirm-body">

                            </tbody>
                            <tfoot><tr><td><span type="cursor: pointer" onclick="showMore('confirm')" class="btn btn-success">Show More</span></td></tr></tfoot>

                        </table>
                    </div></div>
                    <div class="tab-pane fade" id="nav-delivering" role="tabpanel" aria-labelledby="nav-delivering"><div class="container-fluid">
                        <table class="table table-responsive table-borderless table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Order</th>
                                <th scope="col">Created At</th>
                                <th scope="col">Status</th>
                                <th scope="col">Total</th>
                            </tr>
                            </thead>
                            <tbody id="nav-delivering-body">

                            </tbody>
                            <tfoot><tr><td><span type="cursor: pointer" onclick="showMore('delivering')" class="btn btn-success">Show More</span></td></tr></tfoot>

                        </table>
                    </div></div>
                    <div class="tab-pane fade" id="nav-delivered" role="tabpanel" aria-labelledby="nav-delivered">
                        <div class="container-fluid">
                            <table class="table table-responsive table-borderless table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">Order</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                </tr>
                                </thead>
                                <tbody id="nav-delivered-body">
                                </tbody>
                                <tfoot><tr><td><span type="cursor: pointer" onclick="showMore('delivered')" class="btn btn-success">Show More</span></td></tr></tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-confirm-cancel" role="tabpanel" aria-labelledby="nav-confirm-cancel">
                        <div class="container-fluid">
                            <table class="table table-responsive table-borderless table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">Order</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Actions</th>
                                </tr>
                                </thead>
                                <tbody id="nav-confirm-cancel-body">
                                </tbody>
                                <tfoot><tr><td><span type="cursor: pointer" onclick="showMore('confirm-cancel')" class="btn btn-success">Show More</span></td></tr></tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-cancel" role="tabpanel" aria-labelledby="nav-cancel">
                        <div class="container-fluid">
                            <table class="table table-responsive table-borderless table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">Order</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                </tr>
                                </thead>
                                <tbody id="nav-cancel-body">
                                </tbody>
                                <tfoot><tr><td><span type="cursor: pointer" onclick="showMore('cancel')" class="btn btn-success">Show More</span></td></tr></tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Start Footer -->
<footer class="bg-dark" id="tempaltemo_footer">
    <div class="container">
        <div class="row">

            <div class="col-md-4 pt-5">
                <h2 class="h2 text-success border-bottom pb-3 border-light logo">Zay Shop</h2>
                <ul class="list-unstyled text-light footer-link-list">
                    <li>
                        <i class="fas fa-map-marker-alt fa-fw"></i>
                        123 Consectetur at ligula 10660
                    </li>
                    <li>
                        <i class="fa fa-phone fa-fw"></i>
                        <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                    </li>
                    <li>
                        <i class="fa fa-envelope fa-fw"></i>
                        <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                    </li>
                </ul>
            </div>

            <div class="col-md-4 pt-5">
                <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                <ul class="list-unstyled text-light footer-link-list">
                    <li><a class="text-decoration-none" href="#">Luxury</a></li>
                    <li><a class="text-decoration-none" href="#">Sport Wear</a></li>
                    <li><a class="text-decoration-none" href="#">Men's Shoes</a></li>
                    <li><a class="text-decoration-none" href="#">Women's Shoes</a></li>
                    <li><a class="text-decoration-none" href="#">Popular Dress</a></li>
                    <li><a class="text-decoration-none" href="#">Gym Accessories</a></li>
                    <li><a class="text-decoration-none" href="#">Sport Shoes</a></li>
                </ul>
            </div>

            <div class="col-md-4 pt-5">
                <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                <ul class="list-unstyled text-light footer-link-list">
                    <li><a class="text-decoration-none" href="#">Home</a></li>
                    <li><a class="text-decoration-none" href="#">About Us</a></li>
                    <li><a class="text-decoration-none" href="#">Shop Locations</a></li>
                    <li><a class="text-decoration-none" href="#">FAQs</a></li>
                    <li><a class="text-decoration-none" href="#">Contact</a></li>
                </ul>
            </div>

        </div>

        <div class="row text-light mb-4">
            <div class="col-12 mb-3">
                <div class="w-100 my-3 border-top border-light"></div>
            </div>
            <div class="col-auto me-auto">
                <ul class="list-inline text-left footer-icons">
                    <li class="list-inline-item border border-light rounded-circle text-center">
                        <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                    </li>
                    <li class="list-inline-item border border-light rounded-circle text-center">
                        <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                    </li>
                    <li class="list-inline-item border border-light rounded-circle text-center">
                        <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                    </li>
                    <li class="list-inline-item border border-light rounded-circle text-center">
                        <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                    </li>
                </ul>
            </div>
            <div class="col-auto">
                <label class="sr-only" for="subscribeEmail">Email address</label>
                <div class="input-group mb-2">
                    <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                    <div class="input-group-text btn-success text-light">Subscribe</div>
                </div>
            </div>
        </div>
    </div>

    <div class="w-100 bg-black py-3">
        <div class="container">
            <div class="row pt-2">
                <div class="col-12">
                    <p class="text-left text-light">
                        Copyright &copy; 2021 Company Name
                        | Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

</footer>
<!-- End Footer -->

<!-- Start Script -->
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="<c:url value="/disk/resources/js/constants.js"/>"></script>
<script src="<c:url value="/disk/resources/js/formatMoney.js"/>"></script>
<script src="<c:url value="/disk/resources/js/home.js"/>"></script>
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
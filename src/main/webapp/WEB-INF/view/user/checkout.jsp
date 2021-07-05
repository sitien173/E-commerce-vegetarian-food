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

<div class="container" style="margin: 50px">
    <div class="row">
        <c:url var="action" value="/user/checkout/"/>
        <form:form action="${action}" method="post" id="form"  modelAttribute="invoice" cssClass="container">
            <div class="row">
                <div class="col-6">
                    <div class="card">
                        <h4 class="cart-title text-center"> Thông tin thanh toán </h4>
                        <div class="card-body">
                            <form:hidden path="user.username"/>
                            <fieldset class="form-group">
                                <label>Họ Và Tên</label>
                                <form:input path="user.name" readonly="true" cssClass="form-control" />
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Quốc gia/Khu vực</label>
                                <span class="form-control h5">Việt Nam</span>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Địa chỉ</label>
                                <form:input path="user.address.addr" readonly="true" cssClass="form-control"/>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Số điện thoại</label>
                                <form:input path="user.phone" readonly="true" class="form-control"/>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Địa chỉ email</label>
                                <form:input path="user.email" readonly="true" class="form-control"/>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Ghi chú đơn hàng</label>
                                <form:textarea path="description" class="form-control"/>
                            </fieldset>
                            <input type="checkbox" name="admit" /> <span class="h5">Nhận thư và email từ chúng tôi</span>
                            <br>
                            <button type="button" class="btn btn-outline-success" onclick="location.href='${url}/user/info?id=${order.user.userId}'">Chỉnh sửa thông tin cá nhân</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card">
                        <h4 class="cart-title text-center"> Đơn hàng của bạn </h4>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col"> Sản phẩm </th>
                                    <th scope="col"> &nbsp; </th>
                                    <th scope="col"> &nbsp; </th>
                                    <th scope="col"> Tạm tính </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach varStatus="i" var="item" items="${invoice.items}">
                                    <tr>
                                        <td> <c:out value="${item.product.name} x ${item.quantity}"/> </td>
                                        <td> &nbsp; </td>
                                        <td> &nbsp; </td>
                                        <td><script>document.write(formatMoney(${item.subTotal}))</script></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td> Tạm tính: <span class="h5"><script>document.write(formatMoney(${invoice.subTotal}))</script></span></td>
                                </tr>
                                <tr>
                                    <td> Giao hàng: <span class="h5">Giao Hàng Miễn Phí</span> </td>
                                </tr>
                                <tr>
                                    <td> Tổng cộng: <span class="h5"><script>document.write(formatMoney(${invoice.total}))</script></span> </td>
                                </tr>
                                <form:hidden path="total"/>
                                <form:hidden path="subTotal"/>
                                </tbody>
                            </table>
                            <div class="form-check">
                                <input checked class="form-check-input" type="radio" name="checkoutMethod" onclick="checkoutMethodCod()" value="COD" >
                                <label class="form-check-label">
                                    Thanh toán khi nhận hàng
                                </label>
                                <span class="text-muted" id="checkoutMethodCod">
                                                Thông tin cá nhân của bạn sẽ được sử dụng để xử lí đơn hàng, tăng trải nghiệm
                                                sử dụng website, và cho các mục đích cụ thể khác đã được mô tả trong <a href="#">chính sách riêng tư</a>
                                            </span>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" value="PAYPAL" type="radio" name="checkoutMethod" onclick="checkoutMethodBank()" >
                                <label class="form-check-label">
                                    Thanh toán qua thẻ ngân hàng
                                </label>
                                <div id="checkoutMethodBank" class="container" style="display: none">
                                    <div class="row">
                                            <span class="text-muted">
                                                Thực hiện thanh toán vào ngay tài khoản ngân hàng của chúng tôi. Vui lòng sử dụng mã đơn hàng của bạn trong phần nội dung thanh toán.
                                                Đơn hàng sẽ được giao khi tiền đã được chuyển.
                                         </span>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="col-12">
                                                <img width="200px" height="100px" src="">
                                                <label class="text-info">Accepted Cards</label>
                                                <div class="d-flex">
                                                    <i class="fab fa-cc-visa" style="color:navy;"></i>
                                                    <i class="fab fa-cc-amex" style="color:blue;"></i>
                                                    <i class="fab fa-cc-mastercard" style="color:red;"></i>
                                                    <i class="fab fa-cc-discover" style="color:orange;"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <button  type="submit" class="btn btn-aqua" style="border-radius:3rem;width: 300px;">Đặt hàng</button>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
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
<script src="<c:url value="/disk/resources/js/constants.js"/>"></script>
<script src="<c:url value="/disk/resources/js/formatMoney.js"/>"></script>
<script src="<c:url value="/disk/resources/js/home.js"/>"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
<script src="<c:url value="/disk/resources/js/slick.min.js"/>"></script>
<script>
    const cod = document.getElementById("checkoutMethodCod");
    const bank = document.getElementById("checkoutMethodBank");
    const $form = $('#form');
    function checkoutMethodCod() {
        cod.style.display = "block";
        bank.style.display = "none";
        $form.removeAttr('action');
        $form.attr('action',URL + '/user/checkout/add');
    }
    function checkoutMethodBank() {
        bank.style.display = "block";
        cod.style.display = "none";
        $form.removeAttr('action');
        $form.attr('action',URL + '/user/payPal/checkout');
    }

</script>
<!-- End Script -->
</body>

</html>
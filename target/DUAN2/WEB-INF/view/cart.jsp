<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/buttons.css">


    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/fontawesome.min.css">
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/slick.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/slick-theme.css"/>"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
    <script src="<c:url value="/disk/resources/js/formatMoney.js"/>"></script>
    <script src="<c:url value="/disk/resources/js/popup.js"/>"></script>
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

        <a class="navbar-brand text-success logo h1 align-self-center" href="<c:url value="/home"/>">
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
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="#">Page 1</a>
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

<div class="container">
    <c:out value="${info}"/>
    <div class="row">
        <div class="col-lg-9">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">&nbsp;</th>
                    <th scope="col">&nbsp;</th>
                    <th scope="col">Sản Phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Sale</th>
                    <th scope="col"> Số Lượng</th>
                    <th scope="col">Tạm Tính</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach varStatus="i" var="item" items="${sessionScope.invoice.items}">
                    <tr value="${item.product.id}">
                        <td><span onclick="deleteItem(${item.product.id})" style="cursor: pointer" >&bigotimes;</span></td>
                        <td><a href="<c:url value="/product/${item.product.id}"/>"><img style="width: 50px;height: 50px" src="<c:url value="${item.product.images[0].location}"/> " alt="img"/></a></td>
                        <td><a href="<c:url value="/product/${item.product.id}"/> "><c:out value="${item.product.name}"/></a></td>
                        <td><script>document.write(formatMoney(${item.product.price}))</script></td>
                        <td><script>document.write(formatMoney(${item.product.salePrice}))</script></td>
                        <td><input min="1" max="20"  name='quantity' onchange="updateQuantity(${item.product.id},this.value)" style="width: 50px" type="number" value="<c:out value="${item.quantity}"/>"></td>
                        <td><script>document.write(formatMoney(${item.subTotal}))</script></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td id="total"><script>document.write(formatMoney(${sessionScope.invoice.total}))</script></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><button class="btn btn-outline-secondary" type="button" onclick="location.reload()">Reset</button> </td>
                    <td colspan="2"><a href="<c:url value="/user/checkout/"/>" class="btn btn-aqua">Tiến Hành Thanh Toán</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal"></div>
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
<script src="<c:url value="/disk/resources/js/home.js"/>"></script>
<script src="<c:url value="/disk/resources/js/cart.js"/>"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
<script src="<c:url value="/disk/resources/js/slick.min.js"/>"></script>
<script>
    $('#slick-track-highlight').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 4,
        accessibility: true,
        autoplay: true,
        autoplaySpeed: 2000,
        centerMode: true,
        speed: 500,
        cssEase: 'linear',
    });
    $('#slick-track-best-seller').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 4,
        accessibility: true,
        autoplay: true,
        autoplaySpeed: 2000,
        centerMode: true,
        speed: 500,
        cssEase: 'linear',
    });
</script>
<!-- End Script -->
</body>

</html>
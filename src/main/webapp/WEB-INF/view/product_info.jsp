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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/custom.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/disk/resources/css/fontawesome.min.css">
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/slick.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/slick-theme.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/feedback.css"/>"/>
    <script src="<c:url value="/disk/resources/js/popup.js"/>"></script>
    <script src="<c:url value="/disk/resources/js/formatMoney.js"/>"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
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
                            <a class="dropdown-item" href="<c:url value="/user/invoice/info"/>">Lịch sử mua hàng</a>
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


<!-- Open Content -->
<section class="bg-light">
    <div class="container pb-5">
        <div class="row">
            <div class="col-lg-5 mt-5">
                <div class="card mb-3">
                    <img class="card-img img-fluid" src="<c:url value="${product.images[0].location}"/>" alt="Card image cap" id="product-detail">
                </div>
                <div class="row">
                    <!--Start Controls-->
                    <div class="col-1 align-self-center">
                        <a href="#multi-item-example" role="button" data-bs-slide="prev">
                            <i class="text-dark fas fa-chevron-left"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                    </div>
                    <!--End Controls-->
                    <!--Start Carousel Wrapper-->
                    <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                        <!--Start Slides-->
                        <div class="carousel-inner product-links-wap" role="listbox">
                            <div class="carousel-item active">
                                <div class="row">
                                    <c:forEach var="i" begin="0" end="${product.images.size()}" step="1">
                                       <c:if test="${i<4}">
                                           <div class="col-sm-3">
                                               <a href="#">
                                                   <img class="card-img img-fluid" src="<c:url value="${product.images[i].location}"/>">
                                               </a>
                                           </div>
                                       </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!--End Slides-->
                    </div>
                    <!--End Carousel Wrapper-->
                    <!--Start Controls-->
                    <div class="col-1 align-self-center">
                        <a href="#multi-item-example" role="button" data-bs-slide="next">
                            <i class="text-dark fas fa-chevron-right"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <!--End Controls-->
                </div>
            </div>
            <!-- col end -->
            <div class="col-lg-7 mt-5">
                <div class="card">
                    <div class="card-body">
                        <h1 class="text-left text-uppercase lead"><c:out value="${product.name}"/></h1>
                        <c:if test="${product.salePrice > 0}">
                            <p class='text-left mb-0'><span class='text-muted text-decoration-line-through'><script>document.write(formatMoney(${product.price}))</script></span> -
                                <span class='text-danger'><script>document.write(formatMoney(${product.salePrice}))</script></span>
                            </p>
                        </c:if>
                        <c:if test="${product.salePrice <= 0}">
                            <p class='text-left mb-0'>
                                <span class='text-danger'><script>document.write(formatMoney(${product.price}))</script></span>
                            </p>
                        </c:if>
                        <p class="py-2" id="rating-comment">

                        </p>
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <h6>Category:</h6>
                            </li>
                            <li class="list-inline-item">
                                <p class="text-muted"><strong><c:out value="${product.categories.name}"/></strong></p>
                            </li>
                        </ul>

                        <span class="h6">Description:</span>
                        <p class="text-monospace text-wrap"><c:out value="${product.description}"/></p>
                        <div class="row">
                            <div class="col-auto">
                                <ul class="list-inline pb-3">
                                    <li class="list-inline-item">Left in stock :
                                        <span class="btn btn-success btn-size"><c:out value="${product.quantity}"/></span>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-auto">
                                <ul class="list-inline pb-3">
                                    <li class="list-inline-item text-right">
                                        Quantity
                                        <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                    </li>
                                    <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                    <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                    <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="row pb-3">
                            <div class="col d-grid">
                                <button type="button" id="addToCart" class="btn btn-success btn-lg" name="submit">Add To Cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Close Content -->
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h5 class="text-center">FeedBack Từ Người Dùng</h5>
                <table class="table table-responsive table-hover">
                    <thead>
                    <tr>
                        <th scope="col">Tên</th>
                        <th scope="col">Ngày phản hồi</th>
                        <th scope="col">Rating</th>
                        <th scope="col">Comment</th>
                    </tr>
                    </thead>
                    <tbody id="feedback-body">

                    </tbody>
                    <tr>
                        <td><button class="btn btn-outline-success" type="button" id="btn-more">Hiện thêm</button></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row d-flex justify-content-center ms-1">
            <div class="col-lg-6">
                <c:if test="${not empty param.info}">
                    <script>
                        showPopup("success","FeedBack","<c:out value='${param.info}'/>");
                    </script>
                </c:if>
                <c:url var="action" value="/user/feedback/add"/>
                <form action="${action}" method="post" id="submit-feedback">
                    <input type="hidden" name="productId" value="${productId}">
                    <div class="feedback">
                        <div class="rating">
                            <input type="radio" name="rating" id="rating-5" value="5">
                            <label for="rating-5"></label>
                            <input type="radio" name="rating" id="rating-4" value="4">
                            <label for="rating-4"></label>
                            <input type="radio" name="rating" id="rating-3" value="3">
                            <label for="rating-3"></label>
                            <input type="radio" name="rating" id="rating-2" value="2">
                            <label for="rating-2"></label>
                            <input type="radio" name="rating" id="rating-1" value="1">
                            <label for="rating-1"></label>
                            <div class="emoji-wrapper">
                                <div class="emoji">
                                    <svg class="rating-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                        <path d="M512 256c0 141.44-114.64 256-256 256-80.48 0-152.32-37.12-199.28-95.28 43.92 35.52 99.84 56.72 160.72 56.72 141.36 0 256-114.56 256-256 0-60.88-21.2-116.8-56.72-160.72C474.8 103.68 512 175.52 512 256z" fill="#f4c534"/>
                                        <ellipse transform="scale(-1) rotate(31.21 715.433 -595.455)" cx="166.318" cy="199.829" rx="56.146" ry="56.13" fill="#fff"/>
                                        <ellipse transform="rotate(-148.804 180.87 175.82)" cx="180.871" cy="175.822" rx="28.048" ry="28.08" fill="#3e4347"/>
                                        <ellipse transform="rotate(-113.778 194.434 165.995)" cx="194.433" cy="165.993" rx="8.016" ry="5.296" fill="#5a5f63"/>
                                        <ellipse transform="scale(-1) rotate(31.21 715.397 -1237.664)" cx="345.695" cy="199.819" rx="56.146" ry="56.13" fill="#fff"/>
                                        <ellipse transform="rotate(-148.804 360.25 175.837)" cx="360.252" cy="175.84" rx="28.048" ry="28.08" fill="#3e4347"/>
                                        <ellipse transform="scale(-1) rotate(66.227 254.508 -573.138)" cx="373.794" cy="165.987" rx="8.016" ry="5.296" fill="#5a5f63"/>
                                        <path d="M370.56 344.4c0 7.696-6.224 13.92-13.92 13.92H155.36c-7.616 0-13.92-6.224-13.92-13.92s6.304-13.92 13.92-13.92h201.296c7.696.016 13.904 6.224 13.904 13.92z" fill="#3e4347"/>
                                    </svg>
                                    <svg class="rating-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                        <path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
                                        <path d="M328.4 428a92.8 92.8 0 0 0-145-.1 6.8 6.8 0 0 1-12-5.8 86.6 86.6 0 0 1 84.5-69 86.6 86.6 0 0 1 84.7 69.8c1.3 6.9-7.7 10.6-12.2 5.1z" fill="#3e4347"/>
                                        <path d="M269.2 222.3c5.3 62.8 52 113.9 104.8 113.9 52.3 0 90.8-51.1 85.6-113.9-2-25-10.8-47.9-23.7-66.7-4.1-6.1-12.2-8-18.5-4.2a111.8 111.8 0 0 1-60.1 16.2c-22.8 0-42.1-5.6-57.8-14.8-6.8-4-15.4-1.5-18.9 5.4-9 18.2-13.2 40.3-11.4 64.1z" fill="#f4c534"/>
                                        <path d="M357 189.5c25.8 0 47-7.1 63.7-18.7 10 14.6 17 32.1 18.7 51.6 4 49.6-26.1 89.7-67.5 89.7-41.6 0-78.4-40.1-82.5-89.7A95 95 0 0 1 298 174c16 9.7 35.6 15.5 59 15.5z" fill="#fff"/>
                                        <path d="M396.2 246.1a38.5 38.5 0 0 1-38.7 38.6 38.5 38.5 0 0 1-38.6-38.6 38.6 38.6 0 1 1 77.3 0z" fill="#3e4347"/>
                                        <path d="M380.4 241.1c-3.2 3.2-9.9 1.7-14.9-3.2-4.8-4.8-6.2-11.5-3-14.7 3.3-3.4 10-2 14.9 2.9 4.9 5 6.4 11.7 3 15z" fill="#fff"/>
                                        <path d="M242.8 222.3c-5.3 62.8-52 113.9-104.8 113.9-52.3 0-90.8-51.1-85.6-113.9 2-25 10.8-47.9 23.7-66.7 4.1-6.1 12.2-8 18.5-4.2 16.2 10.1 36.2 16.2 60.1 16.2 22.8 0 42.1-5.6 57.8-14.8 6.8-4 15.4-1.5 18.9 5.4 9 18.2 13.2 40.3 11.4 64.1z" fill="#f4c534"/>
                                        <path d="M155 189.5c-25.8 0-47-7.1-63.7-18.7-10 14.6-17 32.1-18.7 51.6-4 49.6 26.1 89.7 67.5 89.7 41.6 0 78.4-40.1 82.5-89.7A95 95 0 0 0 214 174c-16 9.7-35.6 15.5-59 15.5z" fill="#fff"/>
                                        <path d="M115.8 246.1a38.5 38.5 0 0 0 38.7 38.6 38.5 38.5 0 0 0 38.6-38.6 38.6 38.6 0 1 0-77.3 0z" fill="#3e4347"/>
                                        <path d="M131.6 241.1c3.2 3.2 9.9 1.7 14.9-3.2 4.8-4.8 6.2-11.5 3-14.7-3.3-3.4-10-2-14.9 2.9-4.9 5-6.4 11.7-3 15z" fill="#fff"/>
                                    </svg>
                                    <svg class="rating-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                        <path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
                                        <path d="M336.6 403.2c-6.5 8-16 10-25.5 5.2a117.6 117.6 0 0 0-110.2 0c-9.4 4.9-19 3.3-25.6-4.6-6.5-7.7-4.7-21.1 8.4-28 45.1-24 99.5-24 144.6 0 13 7 14.8 19.7 8.3 27.4z" fill="#3e4347"/>
                                        <path d="M276.6 244.3a79.3 79.3 0 1 1 158.8 0 79.5 79.5 0 1 1-158.8 0z" fill="#fff"/>
                                        <circle cx="340" cy="260.4" r="36.2" fill="#3e4347"/>
                                        <g fill="#fff">
                                            <ellipse transform="rotate(-135 326.4 246.6)" cx="326.4" cy="246.6" rx="6.5" ry="10"/>
                                            <path d="M231.9 244.3a79.3 79.3 0 1 0-158.8 0 79.5 79.5 0 1 0 158.8 0z"/>
                                        </g>
                                        <circle cx="168.5" cy="260.4" r="36.2" fill="#3e4347"/>
                                        <ellipse transform="rotate(-135 182.1 246.7)" cx="182.1" cy="246.7" rx="10" ry="6.5" fill="#fff"/>
                                    </svg>
                                    <svg class="rating-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                        <path d="M407.7 352.8a163.9 163.9 0 0 1-303.5 0c-2.3-5.5 1.5-12 7.5-13.2a780.8 780.8 0 0 1 288.4 0c6 1.2 9.9 7.7 7.6 13.2z" fill="#3e4347"/>
                                        <path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
                                        <g fill="#fff">
                                            <path d="M115.3 339c18.2 29.6 75.1 32.8 143.1 32.8 67.1 0 124.2-3.2 143.2-31.6l-1.5-.6a780.6 780.6 0 0 0-284.8-.6z"/>
                                            <ellipse cx="356.4" cy="205.3" rx="81.1" ry="81"/>
                                        </g>
                                        <ellipse cx="356.4" cy="205.3" rx="44.2" ry="44.2" fill="#3e4347"/>
                                        <g fill="#fff">
                                            <ellipse transform="scale(-1) rotate(45 454 -906)" cx="375.3" cy="188.1" rx="12" ry="8.1"/>
                                            <ellipse cx="155.6" cy="205.3" rx="81.1" ry="81"/>
                                        </g>
                                        <ellipse cx="155.6" cy="205.3" rx="44.2" ry="44.2" fill="#3e4347"/>
                                        <ellipse transform="scale(-1) rotate(45 454 -421.3)" cx="174.5" cy="188" rx="12" ry="8.1" fill="#fff"/>
                                    </svg>
                                    <svg class="rating-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                        <path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
                                        <path d="M232.3 201.3c0 49.2-74.3 94.2-74.3 94.2s-74.4-45-74.4-94.2a38 38 0 0 1 74.4-11.1 38 38 0 0 1 74.3 11.1z" fill="#e24b4b"/>
                                        <path d="M96.1 173.3a37.7 37.7 0 0 0-12.4 28c0 49.2 74.3 94.2 74.3 94.2C80.2 229.8 95.6 175.2 96 173.3z" fill="#d03f3f"/>
                                        <path d="M215.2 200c-3.6 3-9.8 1-13.8-4.1-4.2-5.2-4.6-11.5-1.2-14.1 3.6-2.8 9.7-.7 13.9 4.4 4 5.2 4.6 11.4 1.1 13.8z" fill="#fff"/>
                                        <path d="M428.4 201.3c0 49.2-74.4 94.2-74.4 94.2s-74.3-45-74.3-94.2a38 38 0 0 1 74.4-11.1 38 38 0 0 1 74.3 11.1z" fill="#e24b4b"/>
                                        <path d="M292.2 173.3a37.7 37.7 0 0 0-12.4 28c0 49.2 74.3 94.2 74.3 94.2-77.8-65.7-62.4-120.3-61.9-122.2z" fill="#d03f3f"/>
                                        <path d="M411.3 200c-3.6 3-9.8 1-13.8-4.1-4.2-5.2-4.6-11.5-1.2-14.1 3.6-2.8 9.7-.7 13.9 4.4 4 5.2 4.6 11.4 1.1 13.8z" fill="#fff"/>
                                        <path d="M381.7 374.1c-30.2 35.9-75.3 64.4-125.7 64.4s-95.4-28.5-125.8-64.2a17.6 17.6 0 0 1 16.5-28.7 627.7 627.7 0 0 0 218.7-.1c16.2-2.7 27 16.1 16.3 28.6z" fill="#3e4347"/>
                                        <path d="M256 438.5c25.7 0 50-7.5 71.7-19.5-9-33.7-40.7-43.3-62.6-31.7-29.7 15.8-62.8-4.7-75.6 34.3 20.3 10.4 42.8 17 66.5 17z" fill="#e24b4b"/>
                                    </svg>
                                    <svg class="rating-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <g fill="#ffd93b">
                                            <circle cx="256" cy="256" r="256"/>
                                            <path d="M512 256A256 256 0 0 1 56.8 416.7a256 256 0 0 0 360-360c58 47 95.2 118.8 95.2 199.3z"/>
                                        </g>
                                        <path d="M512 99.4v165.1c0 11-8.9 19.9-19.7 19.9h-187c-13 0-23.5-10.5-23.5-23.5v-21.3c0-12.9-8.9-24.8-21.6-26.7-16.2-2.5-30 10-30 25.5V261c0 13-10.5 23.5-23.5 23.5h-187A19.7 19.7 0 0 1 0 264.7V99.4c0-10.9 8.8-19.7 19.7-19.7h472.6c10.8 0 19.7 8.7 19.7 19.7z" fill="#e9eff4"/>
                                        <path d="M204.6 138v88.2a23 23 0 0 1-23 23H58.2a23 23 0 0 1-23-23v-88.3a23 23 0 0 1 23-23h123.4a23 23 0 0 1 23 23z" fill="#45cbea"/>
                                        <path d="M476.9 138v88.2a23 23 0 0 1-23 23H330.3a23 23 0 0 1-23-23v-88.3a23 23 0 0 1 23-23h123.4a23 23 0 0 1 23 23z" fill="#e84d88"/>
                                        <g fill="#38c0dc">
                                            <path d="M95.2 114.9l-60 60v15.2l75.2-75.2zM123.3 114.9L35.1 203v23.2c0 1.8.3 3.7.7 5.4l116.8-116.7h-29.3z"/>
                                        </g>
                                        <g fill="#d23f77">
                                            <path d="M373.3 114.9l-66 66V196l81.3-81.2zM401.5 114.9l-94.1 94v17.3c0 3.5.8 6.8 2.2 9.8l121.1-121.1h-29.2z"/>
                                        </g>
                                        <path d="M329.5 395.2c0 44.7-33 81-73.4 81-40.7 0-73.5-36.3-73.5-81s32.8-81 73.5-81c40.5 0 73.4 36.3 73.4 81z" fill="#3e4347"/>
                                        <path d="M256 476.2a70 70 0 0 0 53.3-25.5 34.6 34.6 0 0 0-58-25 34.4 34.4 0 0 0-47.8 26 69.9 69.9 0 0 0 52.6 24.5z" fill="#e24b4b"/>
                                        <path d="M290.3 434.8c-1 3.4-5.8 5.2-11 3.9s-8.4-5.1-7.4-8.7c.8-3.3 5.7-5 10.7-3.8 5.1 1.4 8.5 5.3 7.7 8.6z" fill="#fff" opacity=".2"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <label for="description">Phản hồi sản phẩm</label>
                        <textarea name="description"  id='description' class="form-control"></textarea>
                        <br>
                        <button class="btn btn-success" type="submit">Gửi phản hồi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Start Article -->
<section class="py-5">
    <div class="container">
        <div class="row text-left p-2 pb-3">
            <h4>Related Products</h4>
        </div>
        <!--Start Carousel Wrapper-->
        <div class="row">
            <div class="col-12">
                <div class="slick-initialized slick-slider slick-dotted">
                    <div class="slick-list draggable">
                        <div id="carousel-related-product" class="slick-track">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Article -->


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
<script src="<c:url value="/disk/resources/js/fetchAPI.js"/>"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
<script src="<c:url value="/disk/resources/js/slick.min.js"/>"></script>
<script>
    var feedback;
    var rating = 0;
    var indexCurrent = 0;
    function formatDate(day,month,year,hour,minute,second) {
        var date = new Date(Date.UTC(year,month-1,day,hour,minute,second));
        return date.toISOString().replace("T"," ").replace('.000Z','');
    }
     function loadFeedback(productId) {
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function() {
          feedback = JSON.parse(this.responseText);
        }
        xhttp.open("GET", URL + "/api/feedback/list/"+productId, false);
        xhttp.send();
    }
     function appendBodyFeedback() {
         const $feedbackBody = $('#feedback-body');
        let i = 0;
        while(i < 5){
            let rating = "";
            for(let x=1;x<=5;x++){
                if(x<= feedback[indexCurrent].rated) rating = rating.concat("<i class='fa fa-star text-warning'></i>");
                else rating = rating.concat("<i class='fa fa-star text-secondary'></i>");
            }
            $feedbackBody.append("<tr>" +
                "<td>"+feedback[indexCurrent].user.name+"</td>" +
                "<td>"+formatDate(feedback[indexCurrent].createdAt.date.day, feedback[indexCurrent].createdAt.date.month, feedback[indexCurrent].createdAt.date.year, feedback[indexCurrent].createdAt.time.hour, feedback[indexCurrent].createdAt.time.minute, feedback[indexCurrent].createdAt.time.second)+"</td>"+
                "<td>"+rating+"</td>" +
                "<td class='text-wrap'>"+feedback[indexCurrent].comment+"</td>" +
                "</tr>")
            i++;
            indexCurrent++;
        }
     }
    function getRatingAndComment(productID) {
        fetch(URL + "/api/feedback/rating-comment/"+productID)
            .then(checkStatus)
            .then(convertJson)
            .then((data) => {
                const ratingAVG = data[0].key;
                const comment = data[0].value;
                var appendBody = $('#rating-comment');
                appendBody.html('');
                for(let i=1;i<=5;i++){
                    if(i<=ratingAVG)appendBody.append("<i class='fa fa-star text-warning'></i>")
                    else appendBody.append("<i class='fa fa-star text-secondary'></i>")
                }
             appendBody.append(' <span class="list-inline-item text-dark">  Rating  '+ratingAVG+' | '+comment+ '  Comments</span>');
            }).catch(reason => console.error(reason));
    }
    $('#carousel-related-product').slick({
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
    $(document).ready(function () {
        getRatingAndComment($('input[name=productId]').val());
        getProduct("/api/product/cate/"+${product.categories.id},$('#carousel-related-product'));
        loadFeedback(${product.id});
        appendBodyFeedback();
        $('input[name=rating]').on("click",function () {
            rating = this.value;
        });
        // ajax submit form feedback
        $('#submit-feedback').submit(function (e) {
            if(rating === 0){
                showPopup("info","FeedBack","Vui lòng rating");
                e.preventDefault();
            }
        });
        const $btnAddToCart = $('#addToCart');
        $btnAddToCart.click(function () {
            addToCart(${productId},$('#product-quanity').val());
        })
        $('#btn-more').click(function () {
            appendBodyFeedback();
        })
    })
</script>
<!-- End Slider Script -->
<!-- End Script -->
</body>
</html>
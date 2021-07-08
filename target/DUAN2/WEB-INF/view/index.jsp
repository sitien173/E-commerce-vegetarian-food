<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Trang chủ</title>
    <c:import url="inc/headUser.jsp"/>
<!--
-->
</head>

<body>
    <c:import url="inc/header.jsp"/>
    <!-- Modal -->
    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container-fluid">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<c:url value="/disk/resources/img/upload/bg2.jpg"/> " alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">Tự Tin Mua Hàng</h1>
                                <h3 class="h2">Sản phẩm chất lượng</h3>
                                <p>
                                   Chúng tôi cam kết sản phẩm an toàn chất lượng được kiểm duyệt kĩ càng
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container-fluid">
                    <img class="img-fluid" style="width: 100%;height: 500px;object-fit: cover" src="<c:url value="/disk/resources/img/upload/bg1.jpg"/> " alt="">
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->

    <!-- Start Categories of The Month -->
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Top sản phẩm nổi bật</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="slick-initialized slick-slider slick-dotted">
                    <div class="slick-list draggable">
                        <div id="slick-track-highlight" class="slick-track">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:import url="inc/service.jsp"/>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Top sản phẩm mua nhiều nhất</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="slick-initialized slick-slider slick-dotted">
                    <div class="slick-list draggable">
                        <div id="slick-track-best-seller" class="row">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">Đang khuyến mãi</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="slick-initialized slick-slider slick-dotted">
                    <div class="slick-list draggable">
                        <div id="slick-track-sale-off" class="row">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:import url="inc/brand.jsp"/>
    <!-- Start Footer -->
    <c:import url="inc/footer.jsp"/>
    <!-- End Footer -->
    
    <!-- Start Script -->
    <script src="<c:url value="/disk/resources/js/constants.js"/>"></script>
    <script src="<c:url value="/disk/resources/js/formatMoney.js"/>"></script>
    <script src="<c:url value="/disk/resources/js/productCard.js"/>"></script>
    <script src="<c:url value="/disk/resources/js/home.js"/>"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
    <script src="<c:url value="/disk/resources/js/addToCart.js"/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
    <script src="<c:url value="/disk/resources/js/slick.min.js"/>"></script>
    <script>

    </script>
    <!-- End Script -->
</body>

</html>
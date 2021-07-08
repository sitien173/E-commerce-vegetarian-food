<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Về chúng tôi</title>
    <c:import url="inc/headUser.jsp"/>
</head>

<body>
   <c:import url="inc/header.jsp"/>
    <!-- Modal -->
    <section class="bg-success py-5">
        <div class="container">
            <div class="row align-items-center py-5">
                <div class="col-md-8 text-white">
                    <h1>Về Chúng Tôi</h1>
                    <p>
                        Thực phẩm Vegetarian là cửa hàng chuyên kinh doanh thực phẩm chay và đồ chay với 2 tiêu chí: SẠCH và THUẦN CHAY. Chúng tôi xuất phát từ một cửa hàng đã kinh doanh thực phẩm chay sĩ từ hơn 20 năm nay, khẳng định uy tín bằng chất lượng và tâm huyết của mình trong mỗi sản phẩm trao cho khách hàng.
                        Vegetarian luôn nỗ lực mang đến một dịch vụ ưu đãi tốt nhất cho khách hàng. Chúng tôi cam kết hoàn tiền, đổi trả hàng miễn phí với bất kỳ lý do gì.
                        Vegetarian hỗ trợ vận chuyển tận nhà cho các khàng hàng.
                        Vegetarian luôn mong muốn khách hàng được thưởng thức nhiều hơn và tiết kiệm hơn khi đi mua sắm thực phẩm chay.
                        Vegetarian thường xuyên khuyến mãi, tặng quà và giảm giá để tri ân tất cả khách hàng kính yêu của mình
                        Chúng tôi luôn lắng nghe để cải thiện tốt hơn và đảm bảo quyền lợi của mọi khách hàng.
                    </p>
                </div>
                <div class="col-md-4">
                    <img src="<c:url value="/disk/resources/img/upload/about-hero.svg"/>" alt="About Hero">
                </div>
            </div>
        </div>
    </section>
    <!-- Close Banner -->

    <c:import url="inc/service.jsp"/>

    <c:import url="inc/brand.jsp"/>


    <!-- Start Footer -->
    <c:import url="inc/footer.jsp"/>
    <!-- End Footer -->

    <!-- Start Script -->
   <script src="${pageContext.request.contextPath}/disk/resources/js/constants.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
    <script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
    <script src="<c:url value="/disk/resources/js/slick.min.js"/>"></script>
    <!-- End Script -->
</body>

</html>
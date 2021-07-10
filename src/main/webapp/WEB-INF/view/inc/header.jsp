<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Start Top Nav -->
<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
    <div class="container text-light">
        <div class="w-100 d-flex justify-content-between">
            <div>
                <i class="fa fa-envelope mx-2"></i>
                <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:sitienbmt1@gmail.com">sitienbmt1@gmail.com</a>
                <i class="fa fa-phone mx-2"></i>
                <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
            </div>
            <div>
                <a class="text-light" href="https://www.facebook.com/profile.php?id=100010431690702" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                <a class="text-light" href="https://www.instagram.com/nst173__/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                <a class="text-light" href="https://twitter.com/tien61395661" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                <a class="text-light" href="https://www.linkedin.com/in/ngo-si-tien-b7715515a/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
            </div>
        </div>
    </div>
</nav>
<!-- Close Top Nav -->


<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light shadow">
    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href="<c:url value="/index"/>">
            Vegetarian
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
                <a href="<c:url value="/cart/"/> " id="cart" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-icon position-relative text-decoration-none" >
                    <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    <span id="cart-total" class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">0</span>
                </a>
                <c:if test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}">
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle nav-icon position-relative text-decoration-none" href="#" id="account" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-fw fa-user text-dark mr-3"></i></a>
                        <div class="dropdown-menu" aria-labelledby="account">
                            <a class="dropdown-item" href="<c:url value="/user/invoice/info"/>">Lịch sử mua hàng</a>
                            <a class="dropdown-item" href="<c:url value="/user/edit"/> ">Sửa thông tin</a>
                            <a class="dropdown-item" href="<c:url value="/user/change-password"/> ">Đổi mật khẩu</a>
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
<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="w-100 pt-1 mb-5 text-right">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="<c:url value="/search/query"/>" method="get" class="modal-content modal-body border-0 p-0">
            <div class="input-group mb-2">
                <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                <button type="submit" class="input-group-text bg-success text-light">
                    <i class="fa fa-fw fa-search text-white"></i>
                </button>
            </div>
            <div class="container-fluid" id="parentSearch" style="display: none">
                <table class="table table-borderless table-hover table-responsive-xl">
                    <thead>
                        <tr>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Danh mục</th>
                            <th scope="col">Đã bán</th>
                            <th scope="col">Còn</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Sale</th>
                        </tr>
                    </thead>
                    <tbody id="search-body">

                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
<script>
    function getCategory(){
        const categories = $("#categories");
        fetch(URL + "/api/categories/list")
            .then(checkStatus)
            .then(convertJson)
            .then((data) => {
                categories.html('');
                data.forEach(item => {
                    categories.append("<a class='dropdown-item' href='"+URL+"/categories/"+item.id+"'>"+item.name+"</a>")
                })
            }).catch(reason => console.error(reason))

    }
    document.addEventListener("DOMContentLoaded",function () {
        getCategory();
        document.getElementById("inputModalSearch").addEventListener("input",function () {
            const searchBody = $("#search-body");
            const parentSearch = $("#parentSearch");
            fetch(URL + "/api/search/query?q=" + this.value)
                .then(checkStatus)
                .then(convertJson)
                .then((data) => {
                    searchBody.html('');
                    data.forEach(item => {
                        let body = "<tr>" +
                            "<td>" +
                            "<div class='d-flex'>" +
                            "<img class='img-xs rounded-circle' style='width: 30px;height: 30px;margin-right: 20px' src='"+URL+""+item.images[0].location+"'/>" +
                            "<a class='text-truncate' style='width: 150px' href='"+URL+"/product/"+item.id+"'>"+item.name+"</a>" +
                            "</div>" +
                            "</td>" +
                            "<td>"+item.categories.name+"</td>" +
                            "<td>"+item.sold+"</td>" +
                            "<td>"+item.quantity+"</td>" +
                            "<td>"+formatMoney(item.price)+"</td>" +
                            "<td>"+formatMoney(item.salePrice)+"</td>" +
                            "</tr>";
                        parentSearch.css('display','block');
                        searchBody.append(body);
                    })
                })
        })
    })
</script>
<!-- Close Header -->

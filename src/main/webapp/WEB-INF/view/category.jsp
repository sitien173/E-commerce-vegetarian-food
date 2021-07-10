<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh mục sản phẩm</title>
    <c:import url="inc/headUser.jsp"/>
    <!--
    -->
</head>

<body>
<c:import url="inc/header.jsp"/>

<!-- Start Content -->
<div class="container py-5">
    <div class="row">

        <div class="col-lg-3">
            <h1 class="h2 pb-4">Categories</h1>
            <ul class="list-unstyled templatemo-accordion" id="cate-list">

            </ul>
        </div>

        <div class="col-lg-9">
            <div class="row">
                <div class="col-md-6">
                </div>
                <div class="col-md-6 pb-4">
                    <div class="d-flex">
                        <select class="form-control">
                            <option>Featured</option>
                            <option>A to Z</option>
                            <option>Item</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="item" items="${products}">
                    <div class="col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" style="width: 100%;height: 150px; object-fit:cover;" src="<c:url value="${item.images[0].location}"/>">

                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white mt-2" href="<c:url value="/product/${item.id}"/>"><i class="far fa-eye"></i></a></li>
                                        <li><button class="btn btn-success text-white mt-2" onclick="addToCart(${item.id},1)"><i class="fas fa-cart-plus"></i></button></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body text-center">
                                <a href="<c:url value="/product/${item.id}"/>" style="display: inline-block;max-width: 200px"  class="lead text-center mb-0 text-uppercase text-truncate">${item.name}</a>
                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                    <li class="pt-2">
                                        <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                    </li>
                                </ul>
                                <ul class="list-unstyled d-flex justify-content-center mb-1">
                                    <li class="feedback" id="${item.id}">

                                    </li>
                                </ul>
                                <p class="text-center text-info text-monospace">Đã bán ${item.sold} sp</p>
                                <c:if test="${item.salePrice > 0}">
                                    <p class="text-center mb-0"><span class="text-muted text-decoration-line-through"><script>document.write(formatMoney(${item.price}))</script></span> <span class="text-danger"><script>document.write(formatMoney(${item.salePrice}))</script></span> </p>
                                </c:if>
                                <c:if test="${item.salePrice <= 0}">
                                    <p class="text-center mb-0"> <span class="text-danger"><script>document.write(formatMoney(${item.price}))</script></span> </p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
</div>
<!-- End Content -->

<c:import url="inc/brand.jsp"/>
<!-- Start Footer -->
<c:import url="inc/footer.jsp"/>
<!-- End Footer -->

<!-- Start Script -->

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
<script>
    function getCategories(){
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function() {
           const obj = JSON.parse(this.responseText);
           const $cate = $('#cate-list');
           $cate.html('');
           obj.forEach(item => {
               $cate.append("<li class=\"pb-3\">\n" +
                   "<a class=\"d-flex justify-content-between h3 text-decoration-none\" href='"+URL+"/categories/"+item.id+"'>\n" +
                   ""+item.name+"\n" +
                   "<i class=\"fa fa-fw fa-chevron-circle-down mt-1\"></i>\n" +
                   "</a>\n" +
                   "</li>");
           });
        }
        xhttp.open("GET", URL + "/api/categories/list", true);
        xhttp.send();
    }
    function getFeedback(productId){
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function() {
            const data = JSON.parse(this.responseText);
            const  ratingAVG = data[0].key;
            const comment = data[0].value;
            var appendBody = $('li#'+productId+'');
            appendBody.html('');
            for(let i=1;i<=5;i++){
                if(i<=ratingAVG)appendBody.append("<i class='fa fa-star text-warning'></i>")
                else appendBody.append("<i class='fa fa-star text-secondary'></i>")
            }
            appendBody.append(' <span class="list-inline-item text-dark">  Rating  '+ratingAVG+' | '+comment+' Đánh giá</span>');

        }
        xhttp.open("GET", "/api/feedback/rating-comment/"+productId, false);
        xhttp.send();
    }
    $(document).ready(function () {
        getCategories();
       const  rating = document.getElementsByClassName('feedback');
       for(let i=0;i<rating.length;i++){
          getFeedback(rating[i].getAttribute('id'));
       }
    })
</script>
</body>
</html>
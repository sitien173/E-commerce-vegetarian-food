<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Giỏ hàng</title>
    <c:import url="inc/headUser.jsp"/>
    <!--
    -->
</head>
<body>
<c:import url="inc/header.jsp"/>
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
                    <td><button class="btn btn-outline-secondary" type="button" onclick="location.reload()">Reload</button> </td>
                    <c:if test="${not empty sessionScope.invoice and sessionScope.invoice.items.size() > 0}">
                        <td colspan="2"><a href="<c:url value="/user/checkout/"/>" class="btn btn-aqua">Tiến Hành Thanh Toán</a></td>
                    </c:if>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal"></div>
</div>

<!-- Start Footer -->
<c:import url="inc/footer.jsp"/>
<!-- End Footer -->

<!-- Start Script -->

<script src="<c:url value="/disk/resources/js/cart.js"/>"></script>
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
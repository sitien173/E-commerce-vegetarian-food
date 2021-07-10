<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Check out</title>
    <c:import url="../inc/headUser.jsp"/>
    <script src="<c:url value="/disk/resources/js/checkout.js"/>"></script>
    <!--
    -->
</head>

<body>
<c:import url="../inc/header.jsp "/>
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
                            <button type="button" class="btn btn-outline-success" onclick="location.href='<c:url value="/user/edit"/>'">Chỉnh sửa thông tin cá nhân</button>
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
                                                <img width="200px" height="100px" src="<c:url value="/disk/resources/img/upload/paypal-avatar.png"/>">
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


<c:import url="../inc/footer.jsp"/>
<!-- End Footer -->

<!-- Start Script -->
<script src="<c:url value="/disk/resources/js/formatMoney.js"/>"></script>
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
        $form.attr('action',URL + '/user/checkout/');
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
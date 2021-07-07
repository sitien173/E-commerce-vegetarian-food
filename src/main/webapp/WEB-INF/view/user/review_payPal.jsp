<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Review Paypal</title>
    <c:import url="../inc/headUser.jsp"/>
    <script>
        function formatUSD(money){
            return  new Intl.NumberFormat('en-US',
                {style: 'currency', currency: 'USD'}
            ).format(money/22000)
        }
    </script>
    <!--
    -->
</head>

<body>
<c:import url="../inc/header.jsp"/>
<div class="container" style="margin: 20px">
    <div class="row">
        <div class="col-6">
            <div class="card">
                <div class="card-body">
                    <h6 align="center" class="header-title text-info">Transaction Information</h6>
                    <table class="table table-borderless">
                        <tr>
                            <th scope="row">Description</th>
                            <td class="text-left"><c:out value="${transaction.description}"/></td>
                        </tr>
                        <tr>
                            <th scope="row">SubTotal</th>
                            <td class="text-left"><script>document.write(new Intl.NumberFormat('en-US', {style: 'currency', currency: 'USD'}).format(${transaction.amount.details.subtotal}))</script></td>
                        </tr>
                        <tr>
                            <th scope="row">Shipping</th>
                            <td class="text-left"><script>document.write(new Intl.NumberFormat('en-US', {style: 'currency', currency: 'USD'}).format(${transaction.amount.details.shipping}))</script></td>
                        </tr>.
                        <tr>
                            <th scope="row">Tax</th>
                            <td class="text-left"><script>document.write(new Intl.NumberFormat('en-US', {style: 'currency', currency: 'USD'}).format(${transaction.amount.details.tax}))</script></td>
                        </tr>
                        <tr>
                            <th scope="row">Total</th>
                            <td class="text-left"><script>document.write(new Intl.NumberFormat('en-US', {style: 'currency', currency: 'USD'}).format(${transaction.amount.total}))</script></td>
                        </tr>
                    </table>
                    <hr>
                    <br>
                    <h6 align="center" class="header-title text-info">Payer Information</h6>
                    <table class="table table-borderless">
                        <tr>
                            <th scope="row">First Name</th>
                            <td class="text-left"><c:out value="${payer.firstName}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">Last Name</th>
                            <td  class="text-left"><c:out value="${payer.lastName}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">Email</th>
                            <td  class="text-left"><c:out value="${payer.email}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">Phone</th>
                            <td class="text-left"><c:out value="${payer.phone}"/> </td>
                        </tr>
                    </table>
                    <hr>
                    <br>
                    <h6 align="center" class="header-title text-info">Shipping Address Information</h6>
                    <table class="table table-borderless">
                        <tr>
                            <th scope="row">Recipient Name</th>
                            <td class="text-left"><c:out value="${shippingAddress.recipientName}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">Line 1</th>
                            <td class="text-left"><c:out value="${shippingAddress.line1}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">Line 2</th>
                            <td class="text-left"><c:out value="${shippingAddress.line2}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">City</th>
                            <td class="text-left"><c:out value="${shippingAddress.city}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">State</th>
                            <td class="text-left"><c:out value="${shippingAddress.state}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">Country code</th>
                            <td class="text-left"><c:out value="${shippingAddress.countryCode}"/> </td>
                        </tr>
                        <tr>
                            <th scope="row">Postal Code</th>
                            <td class="text-left"><c:out value="${shippingAddress.postalCode}"/> </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card">
                <div class="card-body">
                    <h6 align="center" class="header-title text-info">Cart Infomation</h6>
                    <table class="table table-borderless">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach varStatus="i" var="item" items="${sessionScope.invoice.items}">
                            <tr>
                                <td class="text-left"><c:out value="${i.index}"/></td>
                                <td class="text-left"><c:out value="${item.product.name}"/></td>
                                <td class="text-left"><c:out value="${item.quantity}"/></td>
                                <td class="text-left"><script>document.write(formatUSD(<c:out value="${item.subTotal}"/>))</script></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><script>document.write(new Intl.NumberFormat('en-US', {style: 'currency', currency: 'USD'}).format(${transaction.amount.total}))</script></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
            <button class="btn btn-outline-success" type="button" onclick="window.history.back()">Back</button>
            <button class="btn btn-aqua" onclick="location.href='${pageContext.request.contextPath}/user/payPal/review_payPal/checkout?paymentId=<c:out value="${param.paymentId}"/>&PayerID=<c:out value="${param.PayerID}"/> '" type="button">Checkout</button>
        </div>
    </div>
</div>
<!-- Start Footer -->
<c:import url="../inc/footer.jsp"/>
<!-- End Footer -->

<!-- Start Script -->

<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
<!-- End Script -->
</body>

</html>
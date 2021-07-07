<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chờ xác nhận</title>
    <c:import url="../inc/headUser.jsp"/>
</head>
<body>
<c:import url="../inc/header.jsp"/>
       <div class="container" style="margin: 50px">
           <div class="row d-flex justify-content-center">
               <div align="center" class="col-6">
                   <p class="lead text-center text-info h5"><c:out value="${messenger}"/></p>
               </div>
           </div>
       </div>
<c:import url="../inc/footer.jsp"/>
<!-- Start Script -->
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/templatemo.js"></script>
<script src="${pageContext.request.contextPath}/disk/resources/js/main.js"></script>
</body>
</html>

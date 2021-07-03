<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fom" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin</title>
    <c:import url="../inc/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/style.css"/>"/>
</head>
<body>
<c:set var="url" value="${pageContext.request.contextPath}"/>
<div class="container-scroller">
    <%--    Navbar --%>
    <c:import url="../inc/nav_admin.jsp"/>
    <div class="container-fluid page-body-wrapper">
        <%--        Navbar left --%>
        <c:import url="../inc/navbar-left.jsp"/>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Category</h4>
                                <p class="card-description"> Edit Category </p>
                                <c:out value="${info}"/>
                                <c:url value="/admin/categories/edit" var="action"/>
                                <form:form  modelAttribute="category" method="post"
                                            cssClass="forms-sample"
                                            action="${action}">
                                    <form:hidden path="id"/>
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <form:input path="name" id="name" cssClass="form-control"/>
                                        <form:errors cssClass="error" path="name"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Slug</label>
                                        <form:input path="slug" id="slug" cssClass="form-control"/>
                                        <form:errors cssClass="error" path="slug"/>
                                    </div>
                                    <button type="button" onclick="location.href ='<c:url value="/admin/categories/list"/>'" class="btn btn-dark">Cancel</button>
                                    <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                </form:form>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
<div class="modal"></div>
        <script src="<c:url value="/disk/resources/js/validForm.js"/>"></script>
<script>
    $body = $("body");
    $(document).on({
        ajaxStart: function() { $body.addClass("loading");    },
        ajaxStop: function() { $body.removeClass("loading"); }
    });
</script>
</body>
</html>
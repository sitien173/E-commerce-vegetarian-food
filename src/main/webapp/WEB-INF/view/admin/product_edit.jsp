<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fom" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin</title>
    <c:import url="../inc/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/style.css"/> "/>
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
                <div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Registration</h4>
                            <c:out value="${info}"/>
                            <c:url value="/admin/product/edit" var="action"/>
                            <form:form method="post" modelAttribute="product" enctype="multipart/form-data"
                                       action="${action}" class="form-sample">
                                <p class="card-description"> Product info </p>
                                <div class="row">
                                    <form:hidden path="id"/>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Name</label>
                                            <div class="col-sm-9">
                                                <form:input path="name" cssClass="form-control"/>
                                                <form:errors path="name" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">File Upload</label>
                                            <div class="col-sm-9">
                                                <input accept="image/*" type="file" multiple name="file" class="form-control">
                                                <hr>
                                                <div class="d-flex justify-content-center" id="listImage">
                                                    <c:forEach var="item" items="${listImage}">
                                                        <img src="<c:url value="${item.location}"/>" class="img-xs rounded-circle"/>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Category</label>
                                            <div class="col-lg-9">
                                                <form:select path="categories.id" cssClass="form-control">
                                                    <form:option value="${product.categories.id}"><c:out value="${product.categories.name}"/></form:option>
                                                    <form:options items="${listCategories}" itemValue="id" itemLabel="name"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label">Status</label>
                                            <div class="col-lg-9">
                                                <form:checkbox path="highlight" cssClass="form-check-input"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Price</label>
                                            <div class="col-sm-9">
                                                <form:input path="price" cssClass="form-control"/>
                                                <form:errors path="price" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Description</label>
                                            <div class="col-sm-9">
                                                <form:textarea path="description" cssClass="form-control"/>
                                                <form:errors path="description" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Sale Price</label>
                                            <div class="col-sm-9">
                                                <form:input path="salePrice" cssClass="form-control"/>
                                                <form:errors path="salePrice" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Quantity</label>
                                            <div class="col-sm-9">
                                                <form:input path="quantity" cssClass="form-control"/>
                                                <form:errors path="quantity" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-dark" onclick="back()">Cancel</button>
                                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal"></div>
        <script src="<c:url value="/disk/resources/js/validForm.js"/>"></script>
        <script>
            function back(){
                window.history.back();
            }
            $body = $("body");
            $(document).on({
                ajaxStart: function () {
                    $body.addClass("loading");
                },
                ajaxStop: function () {
                    $body.removeClass("loading");
                }
            });
        </script>
</body>
</html>
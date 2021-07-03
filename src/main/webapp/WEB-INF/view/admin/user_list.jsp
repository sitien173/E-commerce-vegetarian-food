<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin</title>
    <c:import url="../inc/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/style.css"/>"/>
</head>
<body>
<div class="container-scroller">
    <%--    Navbar --%>
    <c:import url="../inc/nav_admin.jsp"/>
    <div class="container-fluid page-body-wrapper">
        <%--        Navbar left --%>
        <c:import url="../inc/navbar-left.jsp"/>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                           <div class="card-header">
                               <span class="h4 card-title">User</span>
                               <button style="margin-left: 20px" type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/user/add'">Add</button>
                           </div>
                            <div class="card-body">
                               <div class="table table-responsive">
                                   <table id="list-user" class="table table-borderless" style="width:100%">
                                       <thead>
                                       <tr>
                                           <th scope="col">Actions</th>
                                           <th class="text-info" scope="col">Username</th>
                                           <th class="text-info" scope="col">Name</th>
                                           <th class="text-info" scope="col">Address</th>
                                           <th class="text-info" scope="col">Email</th>
                                           <th class="text-info" scope="col">Phone</th>
                                           <th class="text-info" scope="col">Password</th>
                                           <th class="text-info" scope="col">Role</th>
                                           <th class="text-info" scope="col">Created at</th>
                                       </tr>
                                       </thead>
                                       <tbody>
                                       </tbody>

                                   </table>
                               </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </div>
        <div class="modal"><!-- loading anomation --></div>
</div>
<script src="<c:url value="/disk/resources/js/adminUser.js"/>"></script>
</body>
</html>
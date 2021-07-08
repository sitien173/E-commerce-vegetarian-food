<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- partial:partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
        <a class="sidebar-brand brand-logo" href="${pageContext.request.contextPath}/"><h3 class="text-danger">Home</h3></a>
        <a class="sidebar-brand brand-logo-mini" href="${pageContext.request.contextPath}/"></a>
    </div>
    <ul class="nav">
        <li class="nav-item profile">
            <div class="profile-desc">
                <div class="profile-pic">
                    <div class="profile-name">
                        <h5 class="mb-0 font-weight-normal">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</h5>
                        <span>Admin</span>
                    </div>
                </div>
                <a href="#" id="profile-dropdown" data-toggle="dropdown"><i class="mdi mdi-dots-vertical"></i></a>
                <div class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list" aria-labelledby="profile-dropdown">
                    <a href="#" class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-dark rounded-circle">
                                <i class="mdi mdi-settings text-primary"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <p class="preview-subject ellipsis mb-1 text-small">Account settings</p>
                        </div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-dark rounded-circle">
                                <i class="mdi mdi-onepassword  text-info"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <p class="preview-subject ellipsis mb-1 text-small">Change Password</p>
                        </div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-dark rounded-circle">
                                <i class="mdi mdi-calendar-today text-success"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <p class="preview-subject ellipsis mb-1 text-small">To-do list</p>
                        </div>
                    </a>
                </div>
            </div>
        </li>
        <li class="nav-item nav-category">
            <span class="nav-link">Navigation</span>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/">
              <span class="menu-icon">
                <i class="fas fa-home"></i>
              </span>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#user" aria-expanded="false" aria-controls="user">
              <span class="menu-icon">
                <i class="fas fa-user"></i>
              </span>
                <span ondblclick="location.href='<c:url value="/admin/user/list"/> '" class="menu-title">User Management</span>

            </a>
            <div class="collapse" id="user">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="<c:url value="/admin/user/add"/>">Add</a></li>
                    <li class="nav-item"> <a class="nav-link" href="<c:url value="/admin/user/list"/>">All User</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#category" aria-expanded="false" aria-controls="category">
              <span class="menu-icon">
                 <i class="fas fa-folder-plus"></i>
              </span>
                <span ondblclick="location.href='<c:url value="/admin/categories/list"/>'" class="menu-title">Category</span>

            </a>
            <div class="collapse" id="category">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="<c:url value="/admin/categories/add"/>">Add</a></li>
                    <li class="nav-item"> <a class="nav-link" href="<c:url value="/admin/categories/list"/>">All Category</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#product" aria-expanded="false" aria-controls="product">
              <span class="menu-icon">
                <i class="fab fa-product-hunt"></i>
              </span>
                <span ondblclick="location.href='<c:url value="/admin/product/list"/>'" class="menu-title">Product</span>

            </a>
            <div class="collapse" id="product">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="<c:url value="/admin/product/add"/>">Add</a></li>
                    <li class="nav-item"> <a class="nav-link" href="<c:url value="/admin/product/list"/>">All Product</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" href="<c:url value="/admin/invoice/list"/>">
              <span class="menu-icon">
                <i class="fas fa-cart-plus"></i>
              </span>
                <span class="menu-title">Invoice</span>
            </a>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" href="<c:url value="/admin/feedback/list"/>">
              <span class="menu-icon">
               <i class="fas fa-comment-alt"></i>
              </span>
                <span class="menu-title">Feedback</span>
            </a>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" href="<c:url value="/admin/statistical"/>">
              <span class="menu-icon">
               <i class="fas fa-comment-alt"></i>
              </span>
                <span class="menu-title">Thống kê</span>
            </a>
        </li>
    </ul>
</nav>
<!-- partial -->
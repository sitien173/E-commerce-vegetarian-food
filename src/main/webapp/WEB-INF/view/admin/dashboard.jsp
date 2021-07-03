<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <c:import url="../inc/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/disk/resources/css/style.css"/>"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
    </script>
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
                    <div class="col-12 grid-margin stretch-card">
                       <div class="row">
                           <div id="ParentTotalUser" class="col-3">
                               <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                   <div class="text-md-center text-xl-left">
                                       <span class="mb-1 h6"><i class="fas fa-user"></i></span>
                                   </div>
                                   <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                       <h6 id="totalUser" class="font-weight-bold text-info">$593</h6>
                                   </div>
                                   <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                       <p class="text-muted">Total User</p>
                                   </div>
                               </div>
                           </div>
                           <div id="ParentTotalOrder" class="col-3">
                               <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                   <div class="text-md-center text-xl-left">
                                       <span class="mb-1 h6"><i class="fas fa-cart-plus"></i></span>
                                   </div>
                                   <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                       <h6 id="totalOrder" class="font-weight-bold text-info">$593</h6>
                                   </div>
                                   <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                       <p class="text-muted">Total Order</p>
                                   </div>
                               </div>
                           </div>
                           <div id="ParentTotalFeedback" class="col-3">
                               <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                               <div class="text-md-center text-xl-left">
                                   <span class="mb-1 h6"><i class="fas fa-comment-alt"></i></span>
                               </div>
                               <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                   <h6 id="totalFeedback" class="font-weight-bold text-info">$593</h6>
                               </div>
                               <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                   <p class="text-muted">Total FeedBacks</p>
                               </div>
                           </div>
                       </div>
                           <div id="ParentTotalProduct" class="col-3">
                               <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                   <div class="text-md-center text-xl-left">
                                       <span class="mb-1 h6"><i class="fab fa-product-hunt"></i></span>
                                   </div>
                                   <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                       <h6 id="totalProduct" class="font-weight-bold text-info">$593</h6>
                                   </div>
                                   <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                       <p class="text-muted">Total Products</p>
                                   </div>
                               </div>
                           </div>
                           <div  id="ParentTotalCategories" class="col-3">
                               <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                   <div class="text-md-center text-xl-left">
                                       <span class="mb-1 h6"><i class="fas fa-folder-plus"></i></span>
                                   </div>
                                   <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                       <h6 id="totalCategories" class="font-weight-bold text-info">$593</h6>
                                   </div>
                                   <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                                       <p class="text-muted">Total Categories</p>
                                   </div>
                               </div>
                           </div>

                    </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-sm-4 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h5>Total Revenue</h5>
                                <div class="row">
                                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                                            <h2 id="totalRevenue" class="mb-0">$32123</h2>
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                                        <i class="icon-lg mdi mdi-codepen text-primary ml-auto"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h5>Total Cod</h5>
                                <div class="row">
                                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                                            <h2 id="revenueCod" class="mb-0">$45850</h2>
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                                        <i class="icon-lg mdi mdi-wallet-travel text-danger ml-auto"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h5>Total Banking</h5>
                                <div class="row">
                                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                                            <h2 id="revenueBanking" class="mb-0">$2039</h2>
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                                        <i class="icon-lg mdi mdi-monitor text-success ml-auto"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <%--   canvas--%>
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <canvas id="revenue" style="width:100%;max-width:90%;height: 300px"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <%--                revenue each month --%>
                <div class="row">
                    <div class="col-sm-4 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h5 id="title-month-revenue">Revenue</h5>
                                <div class="row">
                                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                                            <h2 id="totalRevenueByMonth" class="mb-0">$32123</h2>
                                            <p class="text-success ml-2 mb-0 font-weight-medium">+3.5%</p>
                                        </div>
                                        <h6 class="text-muted font-weight-normal">11.38% Since last month</h6>
                                    </div>
                                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                                        <i class="icon-lg mdi mdi-codepen text-primary ml-auto"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h5 id="title-month-revenue-cod">Cod</h5>
                                <div class="row">
                                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                                            <h2 id="revenueCodByMonth" class="mb-0">$45850</h2>
                                            <p class="text-success ml-2 mb-0 font-weight-medium">+8.3%</p>
                                        </div>
                                        <h6 class="text-muted font-weight-normal"> 9.61% Since last month</h6>
                                    </div>
                                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                                        <i class="icon-lg mdi mdi-wallet-travel text-danger ml-auto"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h5 id="title-month-revenue-banking">Banking</h5>
                                <div class="row">
                                    <div class="col-8 col-sm-12 col-xl-8 my-auto">
                                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                                            <h2 id="revenueBankingByMonth" class="mb-0">$2039</h2>
                                            <p class="text-danger ml-2 mb-0 font-weight-medium">-2.1% </p>
                                        </div>
                                        <h6 class="text-muted font-weight-normal">2.27% Since last month</h6>
                                    </div>
                                    <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                                        <i class="icon-lg mdi mdi-monitor text-success ml-auto"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Highest Bills</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th> Client Name </th>
                                            <th> Order No </th>
                                            <th> Product Cost </th>
                                            <th> Payment Mode </th>
                                            <th> Start Date </th>
                                            <th> Payment Status </th>
                                        </tr>
                                        </thead>
                                        <tbody id="top10">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-xl-4 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-row justify-content-between">
                                    <h4 class="card-title">Top User Order Highest</h4>
                                    <p class="text-muted mb-1 small">View all</p>
                                </div>
                                <div class="preview-list" id="top10UserHighest">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body" id="orderRecently">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1959.2614714881324!2d106.78405222209241!3d10.84777323343578!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527131ae8b249%3A0x4d2d3c8fab7d3c2e!2zOTcgxJDGsOG7nW5nIE1hbiBUaGnhu4duLCBIaeG7h3AgUGjDuiwgUXXhuq1uIDksIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1623830243005!5m2!1svi!2s" width="100%" height="450px" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="${pageContext.request.contextPath}/resources/js/adminDashboard.js"></script>
</body>
</html>
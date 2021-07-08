<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Liên hệ</title>
    <c:import url="inc/headUser.jsp"/>
</head>

<body>
    <!-- Start Top Nav -->
    <c:import url="inc/header.jsp"/>

    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">Liên Hệ Ngay Với Chúng Tôi</h1>
            <p>
               Liên hệ ngay với chúng tôi để cập nhật các sản phẩm mới nhất và khuyến mãi
            </p>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1959.2614714881324!2d106.78405222209241!3d10.84777323343578!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527131ae8b249%3A0x4d2d3c8fab7d3c2e!2zOTcgxJDGsOG7nW5nIE1hbiBUaGnhu4duLCBIaeG7h3AgUGjDuiwgUXXhuq1uIDksIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1623830243005!5m2!1svi!2s" width="100%" height="600px" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Ena Map -->

    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form class="col-md-9 m-auto" method="post" role="form">
                <div class="row">
                    <div class="form-group col-md-6 mb-3">
                        <label for="name">Name</label>
                        <input type="text" class="form-control mt-1" id="name" name="name" placeholder="Name">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="email">Email</label>
                        <input type="email" class="form-control mt-1" id="email" name="email" placeholder="Email">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="subject">Subject</label>
                    <input type="text" class="form-control mt-1" id="subject" name="subject" placeholder="Subject">
                </div>
                <div class="mb-3">
                    <label for="message">Message</label>
                    <textarea class="form-control mt-1" id="message" name="message" placeholder="Message" rows="8"></textarea>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="submit" class="btn btn-success btn-lg px-3">Let’s Talk</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Contact -->


   <c:import url="inc/footer.jsp"/>

    <!-- Start Script -->
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
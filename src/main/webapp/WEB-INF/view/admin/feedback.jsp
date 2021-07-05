<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
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
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h4 class="card-title">Feedback</h4>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <h6 class="card-title">Lọc theo trạng thái</h6>
                                            <select name="status" class="form-control">
                                                <option value="0" class="text-info">ĐANG CHỜ XÁC NHẬN</option>
                                                <option value="1">ĐÃ XÁC NHẬN</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table table-responsive fixed-table-body">
                                    <table id="feedback" class="table-borderless ">
                                        <thead>
                                        <tr>
                                            <th class="text-info" scope="col">Name</th>
                                            <th class="text-info" scope="col">Product</th>
                                            <th class="text-info" scope="col">Actions</th>
                                            <th class="text-info" scope="col">Feedback</th>
                                            <th class="text-info" scope="col">Rating</th>
                                        </tr>
                                        </thead>
                                        <tbody id="content">
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
</div>
<div class="modal"></div>
<script src="<c:url value="/disk/resources/js/adminFeedback.js"/>"></script>
<script>
    function content(statusVal) {
        const $content = $('#content');
        $content.html('');
        $.ajax({
            url: URL + '/admin/api/feedback/'+statusVal,
            success: function (data) {
                const obj = JSON.parse(data);
                const size = obj.length;
                if(size === 0 ) showPopup("info","Load Data","Không có dữ liệu");
                else {
                    for(let i =0; i < size ; i++){
                        let rated = obj[i].rated;
                        let rateTxt='';
                        for(let i=0;i<rated;i++){
                            rateTxt += '&#9733;';
                        }
                        let statusStyle = statusVal > 0 ? "display: none" : "";
                        $content.append("<tr id="+obj[i].id+">" +
                            "<td><img class='img-xs rounded-circle' src='"+URL+""+obj[i].user.avatar+"'><a class='pl-2' href='"+URL+"/admin/user/edit/"+obj[i].user.id+"'>"+obj[i].user.name+"#"+formatDate( obj[i].createdAt.date.day, obj[i].createdAt.date.month, obj[i].createdAt.date.year, obj[i].createdAt.time.hour, obj[i].createdAt.time.minute, obj[i].createdAt.time.second)+"</a></td>" +
                            "<td><img class='img-xs rounded-circle' src='${url}/"+obj[i].product.image+"'><a class='pl-2' href='${url}/admin/product/edit?id="+obj[i].product.id+"'>"+obj[i].product.name+"</td>" +
                            "<td>" +
                            "<button  onclick='deleteFeedback("+ obj[i].id+")' class=\"badge badge-outline-danger\"><i class=\"far fa-times-circle\"></i></button>\n" +
                            "<button style='"+statusStyle+"' onclick='confirmFeedback("+ obj[i].id+")' class=\"badge badge-outline-success\"><i class=\"far fa-check-circle\"></i></button>" +
                            "</td>" +
                            "<td>"+ obj[i].comment+"</td>" +
                            "<td>"+rateTxt+"</td>"+
                            "</tr>")
                    }
                    $('#feedback').DataTable({
                        "processing":true,
                        "bInfo" : false,
                        "autoWidth":true,
                    })
                }
            },
            error: function (err) {
                showPopup("error","Load Data","Thất bại");
            }
        })

    }
    function deleteFeedback(id) {
        $.ajax({
            url: URL + '/admin/api/feedback/delete/'+id,
            success: function () {
                $('#feedback').DataTable().row($('tr#'+id+'')).remove().draw();
                showPopup("success","Delete FeedBack","Thành công");
            },
            error: function (err) {
                showPopup("error","Delete FeedBack","Thất bại");
            }
        })
    }
    function confirmFeedback(id) {
        $.ajax({
            url: URL + '/admin/api/feedback/update/'+id+'/'+1+'',
            success: function () {
                $('#feedback').DataTable().row($('tr#'+id+'')).remove().draw();
                showPopup("success","Update Status","Thành công");
            },
            error: function (err) {
                showPopup("error","Update Status","Thất bại");
            }
        })
    }
   $(document).ready(function () {
       content(0);
       $('select[name=status]').on("change",function () {
           $('#feedback').DataTable().clear().destroy();
           content(this.value);
       })
   })

</script>
</body>
</html>
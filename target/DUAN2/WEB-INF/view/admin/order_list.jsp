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
                                      <h4 class="card-title">Order</h4>
                                  </div>
                                   <div class="col-sm-9">
                                       <label for="orderStatus">Lọc theo trạng thái</label>
                                       <select id="orderStatus" class="form-control">
                                           <option  selected class='badge-outline-success' value="0">ĐANG CHỜ XỬ LÍ</option>
                                           <option class='badge-outline-success' value="1">ĐÃ XỬ LÍ</option>
                                           <option class='badge-outline-success' value="2">ĐANG GIAO</option>
                                           <option class='badge-outline-success' value="3">ĐÃ GIAO</option>
                                           <option class='badge-outline-success' value="4">YÊU CẦU HUỶ ĐƠN HÀNG</option>
                                           <option class='badge-outline-success' value="5">ĐƠN HÀNG ĐÃ HUỶ</option>
                                       </select>
                                   </div>
                               </div>
                            </div>
                            <div class="card-body">
                                <div class="table table-responsive fixed-table-body">
                                    <table id="orders" class="table-borderless">
                                        <thead>
                                        <tr>
                                            <th class="text-info" scope="col">Actions</th>
                                            <th class="text-info" scope="col">Order</th>
                                            <th class="text-info" scope="col">Created At</th>
                                            <th class="text-info" scope="col">Created End</th>
                                            <th class="text-info" scope="col">Status</th>
                                            <th class="text-info" scope="col">Note</th>
                                            <th class="text-info" scope="col">Total</th>
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
<script>
    $(document).ready(function () {
        content(0);
        $('#orderStatus').change(function () {
            $('#orders').DataTable().clear().destroy();
            content($('#orderStatus').val());
        })
    })
    $body = $("body");
    $(document).on({
        ajaxStart: function() { $body.addClass("loading");    },
        ajaxStop: function() { $body.removeClass("loading"); }
    });
    function content(statusVal) {
        const $content = $('#content');
        $content.html('');
        $.ajax({
            url: '${url}/api/order/status',
            method: 'GET',
            data: {status: statusVal},
            success: function (data) {
                const obj = JSON.parse(data);
                const size = obj.length;
                for(let i =0  ; i < size ; i++){
                    let checkCreatedEnd;
                    switch (obj[i].status) {
                        case 0: {
                            status = "ĐANG CHỜ XỪ LÍ";
                            break;
                        }
                        case 1: {
                            status = "ĐÃ XỬ LÍ";
                            break;
                        }
                        case 2: {
                            status = "ĐANG GIAO";
                            break;
                        }
                        case 3: {
                            status = "ĐÃ GIAO";
                            break;
                        }
                        case 4: {
                            status = "YÊU CẦU HUỶ ĐƠN HÀNG";
                            break;
                        }
                        case 5: {
                            status = "ĐƠN HÀNG ĐÃ HUỶ";
                            break;
                        }
                        default:{
                            status = "Không xác định";
                            break;
                        }
                    }
                    let checkStatus = obj[i].status > 1 ? 'display: none' : '';
                    if (typeof  obj[i].createdEnd !== 'undefined'){
                        checkCreatedEnd = formatDate( obj[i].createdEnd.date.day, obj[i].createdEnd.date.month, obj[i].createdEnd.date.year, obj[i].createdEnd.time.hour, obj[i].createdEnd.time.minute, obj[i].createdEnd.time.second);
                    }else{
                        checkCreatedEnd = "";
                    }
                    $content.append("<tr>" +
                        "<td>" +
                        "<button style='"+checkStatus+"' id='"+obj[i].id+"' onclick='deleteOrder("+obj[i].id+")' class='badge badge-outline-danger'><i class='far fa-times-circle'></i></button> &nbsp;&nbsp;" +
                        "<button style='"+checkStatus+"' onclick='editOrder("+obj[i].id+")' class='badge badge-outline-success'><i class=\"far fa-user-circle\"></i></button>" +
                        "</td>" +
                        "<td><img class='img-xs rounded-circle' src='${url}/"+obj[i].user.avatar+"'><a class='pl-2' href=\"${url}\\admin\\order\\info?id="+ obj[i].id+"\">"+ obj[i].id+'#'+ obj[i].user.name+"</a></td>"+
                        "<td>"+formatDate( obj[i].createdAt.date.day, obj[i].createdAt.date.month, obj[i].createdAt.date.year, obj[i].createdAt.time.hour, obj[i].createdAt.time.minute, obj[i].createdAt.time.second)+"</td>"+
                        "<td>"+checkCreatedEnd+"</td>"+
                        "<td><select name='"+obj[i].id+"' class='form-control' onclick='appendSelect("+obj[i].id+",this)' onchange='updateStatus("+obj[i].id+",this)' >" +
                        "<option value='"+ obj[i].status+"'>"+status+"</option>" +
                        "</select></td>"+
                        "<td>"+ obj[i].description+"</td>"+
                        "<td>"+formatMoney( obj[i].total)+"</td>"+
                        "</tr>")
                }
             $('#orders').DataTable({
                 "processing":true,
                 "bInfo" : false,
                 "autoWidth":true,
             });
            },
            error: function (err) {
                console.log(err);
            }
        })

    }
    function appendSelect(id,$root) {
        const $select = $('select[name='+id+']');
        const stt_id = $root.value;
        $select.html('');
        var arr = ["ĐANG CHỜ XỬ LÍ","ĐÃ XỬ LÍ","ĐANG GIAO","ĐÃ GIAO","YÊU CẦU HUỶ ĐƠN HÀNG","XÁC NHẬN HUỶ ĐƠN HÀNG"];
        $select.append("<option  selected class='badge-outline-primary' value='"+stt_id+"'>"+arr[stt_id]+"</option>")
        if(stt_id != 3 && stt_id != 5){
            $select.append("<option class='badge badge-outline-success' value='"+(+stt_id + 1)+"'>"+arr[+stt_id + 1]+"</option>");
        }
    }
    function deleteOrder(id) {
        $.ajax({
            url: '${url}/api/order/delete',
            method: 'GET',
            data: {
                id: id,
            },
            success: function () {
                $('#orders').DataTable().row($('button#'+id+'').parents('tr')).remove().draw();
                showPopup("success","Delete Item","Thành công");
            },
            error: function (err) {
                showPopup("error","Delete Item","Thất bại");
            }
            })
    }
    function updateStatus(id,$root) {
        status = $root.value;
        $.ajax({
            url: '${url}/api/order/updateStatus',
            method: 'GET',
            data: {
                id: id,
                stt: status,
            },
            success: function () {
              $('#orders').DataTable().row($('button#'+id+'').parents('tr')).remove().draw();
                showPopup("success","Update Status","Thành Công");
            },
            error: function (err) {
                showPopup("error","Update Status","Thất Bại");
            }
        })
    }
function editOrder(id) {
    location.href='${url}/admin/order/edit?id='+id+'';
}

</script>
</body>
</html>
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
function deleteInvoice(id) {
   if(confirm("Xác nhận xoá")){
       fetch(URL + "/admin/api/invoice/delete/"+id,{method: 'DELETE'})
           .then(checkStatus)
           .then(() => {
               $('#orders').DataTable().row($('button#'+id+'').parents('tr')).remove().draw();
           }).catch(() => alert("Không thể xoá đơn hàng"));
   }
}
function updateStatusInvoice(id,$root) {
    stt = $root.value;
    fetch(URL + "/admin/api/invoice/updateStatus/"+id+"/"+stt+"",{method: 'POST'})
        .then(checkStatus)
        .then(() => {
            $('#orders').DataTable().row($('button#'+id+'').parents('tr')).remove().draw();
        }).catch(reason => console.error(reason));
}
function edit(id) {
    location.href = URL + "/admin/invoice/edit/"+id;
}
function initInvoice(stt= 0) {
    fetch(URL + "/admin/api/invoice/list/" + stt)
        .then(checkStatus)
        .then(convertJson)
        .then((data) => {
            const $content = $('#content');
            $content.html('');
            data.forEach(item => {
                let statsTxt = '';
                switch (item.status) {
                    case 0: {
                        statsTxt = "ĐANG CHỜ XỪ LÍ";
                        break;
                    }
                    case 1: {
                        statsTxt = "ĐÃ XỬ LÍ";
                        break;
                    }
                    case 2: {
                        statsTxt = "ĐANG GIAO";
                        break;
                    }
                    case 3: {
                        statsTxt = "ĐÃ GIAO";
                        break;
                    }
                    case 4: {
                        statsTxt = "YÊU CẦU HUỶ ĐƠN HÀNG";
                        break;
                    }
                    case 5: {
                        statsTxt = "ĐƠN HÀNG ĐÃ HUỶ";
                        break;
                    }
                    default:{
                        statsTxt = "Không xác định";
                        break;
                    }
                }
                let checkStatus = item.status > 1 ? 'display: none' : '';
                $content.append("<tr>" +
                    "<td>" +
                    "<button style='"+checkStatus+"' id='"+item.id+"' onclick='deleteInvoice("+item.id+")' class='badge badge-outline-danger'><i class='far fa-times-circle'></i></button> &nbsp;&nbsp;" +
                    "<button style='"+checkStatus+"' onclick='edit("+item.id+")' class='badge badge-outline-success'><i class=\"far fa-user-circle\"></i></button>" +
                    "</td>" +
                    "<td><img class='img-xs rounded-circle' src='"+URL+""+item.user.avatar+"'><a class='pl-2' href='"+URL+"/admin/invoice/info/"+ item.id+"'>"+ item.id+'#'+ item.user.name+"</a></td>"+
                    "<td>"+formatDate(item.createdAt.date.day, item.createdAt.date.month, item.createdAt.date.year, item.createdAt.time.hour, item.createdAt.time.minute, item.createdAt.time.second)+"</td>"+
                    "<td><select name='"+item.id+"' class='form-control' onclick='appendSelect("+item.id+",this)' onchange='updateStatusInvoice("+item.id+",this)' >" +
                    "<option value='"+ item.status+"'>"+statsTxt+"</option>" +
                    "</select></td>"+
                    "<td>"+ item.description+"</td>"+
                    "<td>"+formatMoney(item.total)+"</td>"+
                    "</tr>")
            });
            $('#orders').DataTable({
                "processing":true,
                "bInfo" : false,
                "autoWidth":true,
            });
        }).catch(reason => console.error(reason));
}
document.addEventListener("DOMContentLoaded",function () {
    initInvoice();
    $('#orderStatus').change(function () {
        $('#orders').DataTable().clear().destroy();
        initInvoice($('#orderStatus').val());
    })
})
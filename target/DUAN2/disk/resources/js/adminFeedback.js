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
document.addEventListener("DOMContentLoaded",function () {
    content(0);
    $('select[name=status]').on("change",function () {
        $('#feedback').DataTable().clear().destroy();
        content(this.value);
    })
})

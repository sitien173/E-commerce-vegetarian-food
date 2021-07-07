function content(statusVal) {
    const $content = $('#content');
    $content.html('');
    $.ajax({
        url: URL + '/api/feedback/list/status/'+statusVal,
        success: function (data) {
            const obj = JSON.parse(data);
            const size = obj.length;
            for(let i =0; i < size ; i++){
                let rated = obj[i].rated;
                let rateTxt='';
                for(let i=0;i<rated;i++){
                    rateTxt += '&#9733;';
                }
                let statusStyle = statusVal > 0 ? "display: none" : "";
                $content.append("<tr id="+obj[i].id+">" +
                    "<td><img class='img-xs rounded-circle' src='"+URL+""+obj[i].user.avatar+"'><a class='pl-2' href='"+URL+"/admin/user/edit/"+obj[i].user.username+"'>"+obj[i].user.name+"#"+formatDate( obj[i].createdAt.date.day, obj[i].createdAt.date.month, obj[i].createdAt.date.year, obj[i].createdAt.time.hour, obj[i].createdAt.time.minute, obj[i].createdAt.time.second)+"</a></td>" +
                    "<td><img class='img-xs rounded-circle' src='"+URL+""+obj[i].product.images[0].location+"'><a class='pl-2' href='"+URL+"/admin/product/edit/"+obj[i].product.id+"'>"+obj[i].product.name+"</td>" +
                    "<td>" +
                    "<button  onclick='deleteFeedback("+obj[i].id+")' class=\"badge badge-outline-danger\"><i class=\"far fa-times-circle\"></i></button>\n" +
                    "<button style='"+statusStyle+"' onclick='confirmFeedback("+obj[i].id+")' class=\"badge badge-outline-success\"><i class=\"far fa-check-circle\"></i></button>" +
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
    })

}
function deleteFeedback(id) {
    $.ajax({
        url: URL + '/admin/api/feedback/delete/'+id,
        method: "DELETE",
        success: function () {
            $('#feedback').DataTable().row($('tr#'+id+'')).remove().draw();
        }
    })
}
function confirmFeedback(id) {
    $.ajax({
        url: URL + '/admin/api/feedback/update/'+id+'/'+1+'',
        success: function () {
            $('#feedback').DataTable().row($('tr#'+id+'')).remove().draw();
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


const $navAllBody = $('#nav-all-body');
const $navWaitConfirmBody = $('#nav-wait-confirm-body');
const $navConfirmBody = $('#nav-confirm-body');
const $navDeliveringBody = $('#nav-delivering-body');
const $navDeliveredBody = $('#nav-delivered-body');
const $navConfirmCancelBody = $('#nav-confirm-cancel-body');
const $navCancelBody = $('#nav-cancel-body');

const $navAll = $('#nav-all-tab');
const $navWaitConfirm = $('#nav-wait-confirm-tab');
const $navConfirm = $('#nav-confirm-tab');
const $navDelivering = $('#nav-delivering-tab');
const $navDelivered = $('#nav-delivered-tab');
const $navConfirmCancel =$('#nav-confirm-cancel-tab');
const $navCancel = $('#nav-cancel-tab');

function showInfoItem(invoiceId) {
    const $modalTableBody = $('#modal-table-body');
    const $modalTabInfo = $('#nav-info-content');
    fetch(URL + "/user/api/invoice/" + invoiceId)
        .then(checkStatus)
        .then(convertJson)
        .then((data) => {
            $modalTableBody.html('');
            data.items.forEach(item => {
                $($modalTableBody).append("<tr>" +
                    "<td></td>" +
                    "<td><a href='"+URL+"/product/"+item.product.id+"'>"+item.product.name+"</td>" +
                    "<td><img class='img-xs rounded-circle' style='width: 50px;height: 50px' src='"+URL+""+item.product.images[0].location + "' alt='thumbnail'></td>" +
                    "<td>" + item.quantity + "</td>" +
                    "<td>" + formatMoney(item.product.price) + "</td>" +
                    "<td>" + formatMoney(item.product.salePrice) + "</td>" +
                    "<td>" + formatMoney(item.subTotal) + "</td>" +
                    "</tr>");

            });
            $modalTableBody.append("<tr>" +
                "<td></td>" +
                "<td></td>" +
                "<td></td>" +
                "<td></td>" +
                "<td></td>" +
                "<td></td>" +
                "<td>"+formatMoney(data.total)+"</td>" +
                "</tr>");
            let userInfo = "<tr>" +
                "<th scope='row'>Người nhận hàng</th>" +
                "<td>" + data.user.name + "</td>" +
                "</tr>" +
                "<tr>" +
                "<th scope='row'>Địa chỉ</th>" +
                "<td><textarea class='form-control'>" + data.user.address.addr + ', ' + data.user.address.Ward.wardPrefix + ' ' + data.user.address.Ward.wardName + ', ' + data.user.address.Ward.district.districtPrefix + data.user.address.Ward.district.districtName + ', ' + data.user.address.Ward.province.provinceName + "</textarea></td>" +
                "</tr>" +
                "<tr>" +
                "<th scope='row'>Số điện thoại</th>" +
                "<td>" + data.user.phone + "</td>" +
                "</tr>" +
                "<tr>" +
                "<th scope='row'>Email</th>" +
                "<td>" + data.user.email + "</td>" +
                "</tr>" +
                "<tr>" +
                "<th scope='row'>Phương thức thanh toán</th>" +
                "<td>" + data.payMethod + "</td>" +
                "</tr>";
            $modalTabInfo.html('');
            $modalTabInfo.append(userInfo);
        }).catch(reason => console.error(reason));
    $('#exampleModal').modal('show');
}
function updateStatusInvoice($root,stt) {
    var id = $root.getAttribute('value');
    fetch(URL + "/user/invoice/updateStatus/"+id+"/"+stt+"",{method: 'GET'})
        .then(checkStatus)
        .then(() => {
            $root.innerHTML = 'ĐÃ GỬI YÊU CẦU';
        }).catch(reason => console.error(reason));
}
function getInvoice(url,root){
    fetch(URL + url)
        .then(checkStatus)
        .then(convertJson)
        .then((data) =>{
            root.html('');
            data.forEach(item => {
                let action = '';
                if(item.status == 0 || item.status == 1) {
                    action = "<span onclick='updateStatusInvoice(this,4)' value='"+item.id+"' style='cursor: pointer;color:red;font-weight: 600'>HUỶ ĐƠN HÀNG</span>";
                }else if(item.status == 4){
                    action = "<span onclick='updateStatusInvoice(this,0)' value='"+item.id+"' style='cursor: pointer;color:red;font-weight: 600'>HOÀN TÁC</span>";
                }
                let statusTxt = "";
                switch (item.status) {
                    case 0: {
                        statusTxt = 'Chờ xác nhận';
                        break;
                    }
                    case 1: {
                        statusTxt = 'Chờ lấy hàng';
                        break;
                    }
                    case 2: {
                        statusTxt = 'Đang giao';
                        break;
                    }
                    case 3: {
                        statusTxt = 'Đã giao';
                        break;
                    }
                    case 4: {
                        statusTxt = 'Đang yêu cầu huỷ đơn hàng';
                        break;
                    }
                    case 5: {
                        statusTxt = 'Đã huỷ';
                        break;
                    }
                    default: {
                        statusTxt = 'Không xác định';
                        break;
                    }
                }
                let createdAt = formatDate(item.createdAt.date.day,item.createdAt.date.month,item.createdAt.date.year,item.createdAt.time.hour,item.createdAt.time.minute,item.createdAt.time.second);
                root.append("<tr>" +
                    "<td><span style='cursor: pointer;color: #007bff' onclick='showInfoItem("+item.id+")'>"+item.id+"#"+item.user.name+"</span></td>" +
                    "<td>"+createdAt+"</td>" +
                    "<td>"+statusTxt+"</td>" +
                    "<td>"+formatMoney(item.total)+"</td>" +
                    "<td>"+action+"</td>" +
                    "</tr>");
            });
        })
}
document.addEventListener("DOMContentLoaded",function () {
    const searchBody = $('#nav-search-body');
    $('#search-form').submit(function (event) {
        const invoiceSearch = $("#search-order").val();
        fetch(URL + "/user/api/invoice/"+invoiceSearch)
            .then(checkStatus)
            .then(convertJson)
            .then((item) => {
                let action = '';
                if(item.status == 0 || item.status == 1) {
                    action = "<span onclick='updateStatusInvoice(this,4)' value='"+item.id+"' style='cursor: pointer;color:red;font-weight: 600'>HUỶ ĐƠN HÀNG</span>";
                }else if(item.status == 4){
                    action = "<span onclick='updateStatusInvoice(this,0)' value='"+item.id+"' style='cursor: pointer;color:red;font-weight: 600'>HOÀN TÁC</span>";
                }
                let statusTxt = "";
                switch (item.status) {
                    case 0: {
                        statusTxt = 'Chờ xác nhận';
                        break;
                    }
                    case 1: {
                        statusTxt = 'Chờ lấy hàng';
                        break;
                    }
                    case 2: {
                        statusTxt = 'Đang giao';
                        break;
                    }
                    case 3: {
                        statusTxt = 'Đã giao';
                        break;
                    }
                    case 4: {
                        statusTxt = 'Đang yêu cầu huỷ đơn hàng';
                        break;
                    }
                    case 5: {
                        statusTxt = 'Đã huỷ';
                        break;
                    }
                    default: {
                        statusTxt = 'Không xác định';
                        break;
                    }
                }
                let createdAt = formatDate(item.createdAt.date.day,item.createdAt.date.month,item.createdAt.date.year,item.createdAt.time.hour,item.createdAt.time.minute,item.createdAt.time.second);
                searchBody.html('');
                searchBody.append("<tr>" +
                    "<td><span style='cursor: pointer;color: #007bff' onclick='showInfoItem("+item.id+")'>"+item.id+"#"+item.user.name+"</span></td>" +
                    "<td>"+createdAt+"</td>" +
                    "<td>"+statusTxt+"</td>" +
                    "<td>"+formatMoney(item.total)+"</td>" +
                    "<td>"+action+"</td>" +
                    "</tr>");
            }).catch(() => {
                setTimeout( function () {
                $('#search-error').css('display','block');
            },1000,$('#search-error').css('display','none'));
        })
        event.preventDefault();
    })
        $navAll.click(function () {
            getInvoice("/user/api/invoice/list",$navAllBody);
        });
    $navWaitConfirm.click(function () {
        getInvoice("/user/api/invoice/list/0",$navWaitConfirmBody);
    });
    $navConfirm.click(function () {
        getInvoice("/user/api/invoice/list/1",$navConfirmBody);
    });
    $navDelivering.click(function () {
        getInvoice("/user/api/invoice/list/2",$navDeliveringBody);
    });
    $navDelivered.click(function () {
        getInvoice("/user/api/invoice/list/3",$navDeliveredBody);
    });
    $navConfirmCancel.click(function () {
        getInvoice("/user/api/invoice/list/4",$navConfirmCancelBody);
    });
    $navCancel.click(function () {
        getInvoice("/user/api/invoice/list/5",$navCancelBody);
    });

})

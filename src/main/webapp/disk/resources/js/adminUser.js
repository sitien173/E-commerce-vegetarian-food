var table;
function deleteUser(username) {
    fetch(URL + "/admin/api/user/delete/" + username, {
        method: 'DELETE',
    }).then(checkStatus)
        .then(() => {
            table.row($('button#'+username+'').parents('tr')).remove().draw();
        })
        .catch((err) => console.error(err));
}
function editUser(username) {
    location.href = URL + "/admin/user/edit/" + username;
}
function initTable(){
    $.get(URL + "/admin/api/user/list",function (responseData) {
        var modifierUser = JSON.parse(responseData).map(eachUser => {
            return {
                actions: "<button id="+eachUser.username.trim()+" onclick='deleteUser(\""+eachUser.username.trim()+"\")' class='delete badge badge-outline-danger'><i class='far fa-times-circle'></i></button> &nbsp;&nbsp;" +
                         "<button onclick='editUser(\""+eachUser.username.trim()+"\")' class='edit badge badge-outline-success'><i class=\"far fa-user-circle\"></i></button>",
                username: eachUser.username,
                name: "<img class='img-xs rounded-circle' src='"+URL+""+eachUser.avatar+"'><span class='pl-2'>"+eachUser.name+"</span>",
                email: eachUser.email,
                phone: eachUser.phone,
                address: "<span class=\"d-inline-block text-truncate\" style=\"max-width: 150px;\">"+eachUser.address.addr+"</span>",
                password: eachUser.password,
                role: '<div class="badge badge-outline-success">'+eachUser.grantedAuthorities[0].role+'</div>',
                createdAt: eachUser.createdAt,
            }

        });
        table = $('#list-user').DataTable({
            "processing":true,
            "bInfo" : false,
            "autoWidth":true,
            data: modifierUser,
            columns: [
                {data: 'actions'},
                {data: 'username'},
                {data: 'name'},
                {data: 'address'},
                {data: 'email'},
                {data: 'phone'},
                {data: 'password'},
                {data: 'role'},
                {data: 'createdAt'}
            ]
        })
    }).fail(console.log("initTable error"));
}
document.addEventListener("DOMContentLoaded",function () {
    initTable();
})
function status(response) {
    if (response.status >= 200 && response.status < 300) {
        return Promise.resolve(response)
    } else {
        return Promise.reject(new Error(response.statusText))
    }
}
function json(response) {
    return response.json();
}
function editProduct(id) {
    location.href = URL + "/admin/product/edit/"+id+"";
}
function deleteProduct(id) {
    fetch(URL + "/admin/api/product/delete/" + id, {
        method: 'DELETE',
    })
        .then(status)
        .then(() => {
            $('#products').DataTable().row($('button#'+id+'').parents('tr')).remove().draw();
        }).catch(reason => console.log(reason))
}
function getCategories(root) {
    fetch(URL + "/admin/api/categories/list")
        .then(status)
        .then(json)
        .then((data) => {
            root.innerHTML = "";
            data.forEach(item => {
                let childNode = document.createElement("option");
                childNode.setAttribute("value",item.id);
                childNode.innerHTML = item.name;
                root.appendChild(childNode);
            });
        }).catch(reason => console.log(reason));
}
function initProduct(cateId) {
    fetch(URL + "/admin/api/product/" + cateId)
        .then(status)
        .then(json)
        .then((data) => {
            var modifierProducts = data.map(item => {
                console.log(item);
                return {
                    actions: "<button id='"+item.id+"' onclick='deleteProduct("+item.id+")' class='delete badge badge-outline-danger'><i class='far fa-times-circle'></i></button> &nbsp;&nbsp;" +
                        "<button onclick='editProduct("+item.id+")'  class='badge badge-outline-success'><i class=\"far fa-user-circle\"></i></button>",
                    name: "<img class='img-xs rounded-circle' src='"+URL+""+item.images[0].location+"'><span class='pl-2'>"+item.name+"</span>",
                    price: ""+formatMoney(item.price)+"",
                    salePrice: ""+formatMoney(item.salePrice)+"",
                    highlight: item.isHighlight,
                    description: "<span class=\"d-inline-block text-truncate\" style=\"max-width: 150px;\">"+item.description+"</span>",
                    quantity: item.quantity,
                    category: item.categories.name,
                };
            })
            $('#products').DataTable({
                "processing":true,
                "bInfo" : false,
                "autoWidth":true,
                data: modifierProducts,
                columns: [
                    {data: 'actions'},
                    {data: 'name'},
                    {data: 'price'},
                    {data: 'salePrice'},
                    {data: 'highlight'},
                    {data: 'description'},
                    {data: 'quantity'},
                    {data: 'category'}
                ]
            });
        }).catch(reason => console.log(reason));
}
document.addEventListener("DOMContentLoaded",function () {
    const categories = document.getElementById("categories");
    let promise = new Promise((resolve, reject) => {
        getCategories(categories);
    }).then(() => {
        initProduct(categories.value);
    });
    categories.addEventListener("change",function () {
           $('#products').DataTable().clear().destroy();
           initProduct(this.value);
    });
})
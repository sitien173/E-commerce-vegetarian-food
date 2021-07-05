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
function addToCart(productId,quantity) {
    fetch(URL + "/cart/addToCart/"+productId +"/"+quantity)
        .then(status)
        .then(()=> {
            showPopup("success","ADD TO CART","Thêm sản phẩm vào giỏ hàng thành công");
        }).catch(reason => console.log(reason))
}
function getProduct(url,root) {
    fetch(URL + url)
        .then(status)
        .then(json)
        .then((data) => {
            root.html('');
            data.forEach(item => {
                let price = item.salePrice > 0 ? "<p class='text-center mb-0'><span class='text-decoration-line-through'>"+formatMoney(item.price)+"</span> - <span class='text-danger'>"+formatMoney(item.salePrice)+"</span></p>" : "<p class='text-center mb-0'><span class='text-danger'>"+formatMoney(item.price)+"</span></p>";
                root.append("<div class='p-2 pb-3 slick-slide slick-current slick-active' style='width: 279px;'>\n" +
                    "<div class='product-wap card rounded-0'>\n" +
                    "<div class='card rounded-0'>\n" +
                    "<img class='card-img rounded-0' style='object-fit: cover;width: 100%;height: 250px'  src='"+URL+""+item.images[0].location+"'>\n" +
                    "<div class='card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center'>\n" +
                    "<ul class='list-unstyled'>\n" +
                    "<li><a class='btn btn-success text-white' href='"+URL+"/product/"+item.id+"' tabindex='0'><i class='far fa-heart'></i></a></li>\n" +
                    "<li><a class='btn btn-success text-white mt-2' href='"+URL+"/product/"+item.id+"' tabindex='0'><i class='far fa-eye'></i></a></li>\n" +
                    "<li><a class='btn btn-success text-white mt-2' onclick='addToCart("+item.id+",1)' tabindex='0'><i class='fas fa-cart-plus'></i></a></li>\n" +
                    "</ul>\n" +
                    "</div>\n" +
                    "</div>\n" +
                    "<div class='card-body'>\n" +
                    "<p class='lead text-center mb-0 text-uppercase'>"+item.name+"</p>\n" +
                    "<ul class='w-100 list-unstyled d-flex justify-content-between mb-0'>\n" +
                    "<li class='pt-2'>\n" +
                    "<span class='product-color-dot color-dot-red float-left rounded-circle ml-1'></span>\n" +
                    "<span class='product-color-dot color-dot-blue float-left rounded-circle ml-1'></span>\n" +
                    "<span class='product-color-dot color-dot-black float-left rounded-circle ml-1'></span>\n" +
                    "<span class='product-color-dot color-dot-light float-left rounded-circle ml-1'></span>\n" +
                    "<span class='product-color-dot color-dot-green float-left rounded-circle ml-1'></span>\n" +
                    "</li>\n" +
                    "</ul>\n" +
                    "<ul class='list-unstyled d-flex justify-content-center mb-1'>\n" +
                    "<li>\n" +
                    "<i class='text-warning fa fa-star'></i>\n" +
                    "<i class='text-warning fa fa-star'></i>\n" +
                    "<i class='text-warning fa fa-star'></i>\n" +
                    "<i class='text-warning fa fa-star'></i>\n" +
                    "<i class='text-muted fa fa-star'></i>\n" +
                    "</li>\n" +
                    "</ul>\n" +
                    ""+price+"" +
                    "</div>\n" +
                    "</div>\n" +
                    "</div>");
            });
        })
}
function getCategories(){
    const categories = $("#categories");
    fetch(URL + "/api/categories/list")
        .then(status)
        .then(json)
        .then((data) => {
            categories.html('');
            data.forEach(item => {
                categories.append("<a class='dropdown-item' href='"+URL+"/categories/"+item.id+"'>"+item.name+"</a>")
            })
        })
        .catch(reason => console.error(reason))
}
document.addEventListener("DOMContentLoaded",function () {
    getProduct("/api/product/highlight",$('#slick-track-highlight'));
    getProduct("/api/product/best-seller",$('#slick-track-best-seller'));
    getCategories();
})
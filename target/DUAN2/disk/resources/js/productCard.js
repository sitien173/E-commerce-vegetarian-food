function getProduct(url,root) {
    var arr = [];
    fetch(URL + url)
        .then(checkStatus)
        .then(convertJson)
        .then((data) => {
            root.html('');
            data.forEach(item => {
                arr.push(item.id);
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
                    "<p class='lead text-center mb-0 text-uppercase text-truncate' style='max-width: 300px'>"+item.name+"</p>\n" +
                    "<ul class='w-100 list-unstyled d-flex justify-content-between mb-0'>\n" +
                    "<li class='pt-2'>\n" +
                    "<span class='product-color-dot color-dot-red float-left rounded-circle ml-1'></span>\n" +
                    "<span class='product-color-dot color-dot-blue float-left rounded-circle ml-1'></span>\n" +
                    "<span class='product-color-dot color-dot-black float-left rounded-circle ml-1'></span>\n" +
                    "<span class='product-color-dot color-dot-light float-left rounded-circle ml-1'></span>\n" +
                    "<span class='product-color-dot color-dot-green float-left rounded-circle ml-1'></span>\n" +
                    "</li>\n" +
                    "</ul>\n" +
                    "<ul class='text-center list-unstyled d-flex justify-content-center mb-1'>\n" +
                    "<li class='fb' id='"+item.id+"'>\n" +
                    "</li>\n" +
                    "</ul>\n" +
                    "<p class=\"text-center text-info text-monospace\">Đã bán "+item.sold+" sp</p>"+
                    ""+price+"" +
                    "</div>\n" +
                    "</div>\n" +
                    "</div>");
            });
        }).then(()=> {arr.forEach(item => getFeedback(item))})
}
function getFeedback(productId){
    fetch(URL + "/api/feedback/rating-comment/"+productId+"")
        .then(checkStatus)
        .then(convertJson)
        .then((data) => {
            const  ratingAVG = data[0].key;
            const comment = data[0].value;
            var appendBody = $('li#'+productId+'');
            appendBody.html('');
            for(let i=1;i<=5;i++){
                if(i<=ratingAVG)appendBody.append("<i class='fa fa-star text-warning'></i>")
                else appendBody.append("<i class='fa fa-star text-secondary'></i>")
            }
            appendBody.append(' <span class="list-inline-item text-dark">  Rating  '+ratingAVG+' | '+comment+' Đánh giá</span>');
        }).then(() => {$('li#'+productId+'').removeAttr('id')})
        .catch(reason => console.log(reason))
}

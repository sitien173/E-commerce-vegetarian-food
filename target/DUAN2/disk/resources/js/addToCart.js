function addToCart(productId,quantity) {
    fetch(URL + "/cart/addToCart/"+productId +"/"+quantity)
        .then(checkStatus)
        .then(()=> {
            showPopup("success","ADD TO CART","Thêm sản phẩm vào giỏ hàng thành công");
            totalCart = parseInt($('#cart-total').text());
            totalCart++;
            $('#cart-total').text(totalCart)
        }).catch(reason => console.log(reason))
}
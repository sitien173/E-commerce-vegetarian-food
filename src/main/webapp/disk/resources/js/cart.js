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
function updateQuantity(productId,quantity) {
    fetch(URL + "/cart/updateCart?productId="+productId+"&quantity="+quantity+"")
        .then(status)
        .catch(reason => console.error(reason));
}
function deleteItem(productId) {
    fetch(URL + "/cart/delete/" + productId, {method: "DELETE",})
        .then(status)
        .then(() => {
            showPopup("success","Delete Item","Xoá sản phẩm thành công");
            $('tr[value="'+productId+'"]').remove();
        })
        .catch((err) => console.log(err))
}

function isValid(){
    const arr = document.getElementsByTagName("input");
    let check = true;
    for(let item of arr){
        check = item.length !== 0;
    }
    return check;
}
function checkPassword(){
    const password = document.getElementById("password");
    const rePassword = document.getElementById("rePassword");
    return password.value === rePassword.value;
}
document.addEventListener("DOMContentLoaded", function(event) {
    const form = document.getElementsByTagName("form")[0];
    form.addEventListener('submit', function (evt) {
        if (!isValid()) {
            alert("input not null");
            evt.preventDefault();
        }else if(!checkPassword()){
            alert("password incorrect");
            evt.preventDefault();
        }
    });
});
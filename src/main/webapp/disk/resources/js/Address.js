const province = document.getElementById("address.ward.province.provinceId");
const district = document.getElementById("address.ward.district.districtId");
const ward = document.getElementById("address.ward.wardId");
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
function getProvince() {
   fetch(URL + '/api/address/province')
       .then(status)
       .then(json)
       .then((data) => {
           province.innerHTML = "";
         data.forEach(item => {
             let e = document.createElement('option');
             e.setAttribute("value",item.provinceId);
             e.innerHTML = item.provinceName;
             province.appendChild(e);
         })
           getDistrict(data[0].provinceId);
       })
       .catch((err) => console.log(err))
}
function getDistrict(provinceId) {
    fetch(URL + '/api/address/district/' + provinceId)
        .then(status)
        .then(json)
        .then((data) => {
            district.innerHTML = "";
            data.forEach(item => {
                let e = document.createElement('option');
                e.setAttribute("value",item.districtId);
                e.innerHTML = item.districtName;
                district.appendChild(e);
            })
            getWard(data[0].districtId);
        })
        .catch((err) => console.log(err))
}
function getWard(districtId) {
    fetch(URL + '/api/address/ward/' + districtId)
        .then(status)
        .then(json)
        .then((data) => {
            ward.innerHTML = "";
            data.forEach(item => {
                let e = document.createElement('option');
                e.setAttribute("value",item.wardId);
                e.innerHTML = item.wardName;
                ward.appendChild(e);
            })
        })
        .catch((err) => console.log(err))
}
document.addEventListener("DOMContentLoaded",function () {
     getProvince();
   province.addEventListener("change",function () {
       getDistrict(this.value);
   });
   district.addEventListener("change",function () {
        getWard(this.value);
   })
})


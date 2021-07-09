const province = document.getElementById("address.ward.province.provinceId");
const district = document.getElementById("address.ward.district.districtId");
const ward = document.getElementById("address.ward.wardId");
function getProvince(provinceId) {
    fetch(URL + '/api/address/province')
        .then(checkStatus)
        .then(convertJson)
        .then((data) => {
            province.innerHTML = "";
            data.forEach(item => {
                if(item.provinceId == provinceId){
                    let e = document.createElement('option');
                    e.setAttribute("value",item.provinceId);
                    e.setAttribute("selected","selected");
                    e.innerHTML = item.provinceName;
                    province.appendChild(e);
                }else if(item.provinceId != province.value){
                    let e = document.createElement('option');
                    e.setAttribute("value",item.provinceId);
                    e.innerHTML = item.provinceName;
                    province.appendChild(e);
                }
            })
        })
        .catch((err) => console.log(err))
}
function getDistrict(provinceId) {
    fetch(URL + '/api/address/district/' + provinceId)
        .then(checkStatus)
        .then(convertJson)
        .then((data) => {
            const districtId =document.getElementById("address.ward.district.districtId").value;
            district.innerHTML = "";
            data.forEach(item => {
                if(item.districtId == districtId){
                    let e = document.createElement('option');
                    e.setAttribute("value",item.districtId);
                    e.setAttribute("selected","selected");
                    e.innerHTML = item.districtName;
                    district.appendChild(e);
                }else{
                    let e = document.createElement('option');
                    e.setAttribute("value",item.districtId);
                    e.innerHTML = item.districtName;
                    district.appendChild(e);
                }
            })
        })
        .catch((err) => console.log(err))
}
function getWard(districtId) {
    fetch(URL + '/api/address/ward/' + districtId)
        .then(checkStatus)
        .then(convertJson)
        .then((data) => {
            const wardId = document.getElementById("address.ward.wardId").value;
            ward.innerHTML = "";
            data.forEach(item => {
                if(item.wardId == wardId) {
                    let e = document.createElement('option');
                    e.setAttribute("value",item.wardId);
                    e.setAttribute("selected","selected");
                    e.innerHTML = item.wardName;
                    ward.appendChild(e);
                }else{
                    let e = document.createElement('option');
                    e.setAttribute("value",item.wardId);
                    e.innerHTML = item.wardName;
                    ward.appendChild(e);
                }
            })
        })
        .catch((err) => console.log(err))
}
document.addEventListener("DOMContentLoaded",function () {
    province.addEventListener("click",function () {
       getProvince(this.value);
    });
    province.addEventListener("change",function () {
        getDistrict(this.value);
    })
    district.addEventListener("click",function () {
            getDistrict(province.value);
    })
    district.addEventListener("change",function () {
        getWard(this.value);
    })
    ward.addEventListener("click",function () {
        getWard(district.value);
    })
})


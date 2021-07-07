const totalUser = document.getElementById("totalUser");
const totalOrder = document.getElementById("totalOrder");
const totalProduct = document.getElementById("totalProduct");
const totalFeedback = document.getElementById("totalFeedback");
const totalCategories = document.getElementById("totalCategories");
const totalRevenue = document.getElementById("totalRevenue");
const totalRevenueCod = document.getElementById("revenueCod");
const totalRevenueBanking = document.getElementById("revenueBanking");
const tbodyTop10 = document.getElementById("top10");
const top10UserHighest = document.getElementById("top10UserHighest");
const orderRecently = document.getElementById("orderRecently");
const totalRevenueMonth = document.getElementById("totalRevenueByMonth");
const totalRevenueCodMonth = document.getElementById("revenueCodByMonth");
const totalRevenueBankingMonth = document.getElementById("revenueBankingByMonth");
const parentTotalUser = document.getElementById("ParentTotalUser");
const parentTotalOrder = document.getElementById("ParentTotalOrder");
const parentTotalFeedback = document.getElementById("ParentTotalFeedback");
const parentTotalProduct = document.getElementById("ParentTotalProduct");
const parentTotalCategories = document.getElementById("ParentTotalCategories");
const url = location.origin;
function loadTotal(url,root) {
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function() {
        root.innerHTML = ' ';
        root.innerHTML = this.responseText;
    }
    xhttp.open("GET", url, true);
    xhttp.send();
}
function getTotalRevenue(url,root) {
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function() {
        root.innerHTML = ' ';
        root.innerHTML = formatMoney(this.responseText);
    }
    xhttp.open("GET", url, true);
    xhttp.send();
}
function getTotalRevenueByMonth() {
    const xhttp = new XMLHttpRequest();
    var date = new Date();
    var month = date.getMonth() + 1;
    xhttp.onload = function() {
        totalRevenueMonth.innerHTML = formatMoney(this.responseText);
    }
    xhttp.open("GET", url + '/admin/api/invoice/revenue/'+month+'', true);
    xhttp.send();
}
function getTotalRevenueMethodByMonth(payMethod,root) {
    const xhttp = new XMLHttpRequest();
    var date = new Date();
    var month = date.getMonth() + 1;
    xhttp.onload = function() {
        root.innerHTML = formatMoney(this.responseText);
    }
    xhttp.open("GET", url + '/admin/api/invoice/revenue/'+month+'/'+payMethod+'', true);
    xhttp.send();
}
function getOrderRecently() {
    const xhttp = new XMLHttpRequest();
    // get count
    xhttp.onload = function() {
        orderRecently.innerHTML = "<h4 class=card-title'>Transaction History</h4>";
        const obj = JSON.parse(xhttp.responseText);
        let eParentNode,eChildrenNode;
        for(let i=0;i<obj.length;i++){

            eParentNode = document.createElement("div");
            eParentNode.setAttribute("class","bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3");
            let transferTxt = obj[i].payMethod === "COD" ? 'Payment on Delivery' : 'Transfer to Paypal';
            eParentNode.innerHTML = "<div class=\"text-md-center text-xl-left\">\n" +
                "<a href='"+URL+"/admin/invoice/info/"+obj[i].id+"' class='h6 mb-1'>"+transferTxt+"</a>\n" +
                "<p class='text-muted mb-0'>"+formatDate(obj[i].createdAt.date.day, obj[i].createdAt.date.month, obj[i].createdAt.date.year, obj[i].createdAt.time.hour, obj[i].createdAt.time.minute, obj[i].createdAt.time.second)+"</p>\n" +
                "</div>\n" +
                "<div class='align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0'>\n" +
                "<h6 class='font-weight-bold mb-0'>"+formatMoney(obj[i].total)+"</h6>\n" +
                "</div>"
            orderRecently.appendChild(eParentNode);
        }
    }
    xhttp.open("GET",""+url+"/admin/api/invoice/recently", true);
    xhttp.send();
}
function getTop10Order() {
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function() {
        const obj = JSON.parse(xhttp.responseText);
        var tr,td;
        tbodyTop10.innerHTML = ' ';
        for(let i=0;i<obj.length;i++){
            tr = document.createElement("tr");
            // td 1
            td = document.createElement("td");
            let tdImg = document.createElement("img");
            tdImg.setAttribute("src", url + obj[i].user.avatar);
            tdImg.setAttribute("class","img-xs rounded-circle ");
            let tdSpan = document.createElement("span");
            tdSpan.setAttribute("class","pl-2");
            tdSpan.innerHTML = obj[i].user.name;
            td.appendChild(tdImg);
            td.appendChild(tdSpan);
            tr.appendChild(td);


            // td 2
            td = document.createElement("td");
            td.innerHTML = obj[i].id;
            tr.appendChild(td);

            // td 3
            td = document.createElement("td");
            td.innerHTML = formatMoney(obj[i].total);
            tr.appendChild(td);

            // td 4
            td = document.createElement("td");
            td.innerHTML = obj[i].payMethod;
            tr.appendChild(td);

            // td 5
            td = document.createElement("td");
            td.innerHTML = formatDate(obj[i].createdAt.date.day, obj[i].createdAt.date.month, obj[i].createdAt.date.year, obj[i].createdAt.time.hour, obj[i].createdAt.time.minute, obj[i].createdAt.time.second);
            tr.appendChild(td);

            // td 6
            td = document.createElement("td");
            let tdDiv = document.createElement("div");
            tdDiv.setAttribute("class","badge badge-outline-success");
            tdDiv.innerHTML = "Accomplished";
            td.appendChild(tdDiv)
            tr.appendChild(td);

            tbodyTop10.appendChild(tr);
        }
    }
    xhttp.open("GET",url + '/admin/api/invoice/top10', true);
    xhttp.send();
}
function getTop10UserHighest() {
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function() {
        top10UserHighest.innerHTML = ' ';
        const obj = JSON.parse(xhttp.responseText);
        const arr1 = obj[0].map(item => {
            return {
                name: item.name,
                avatar: item.avatar,
            };
        });
        const arr2 = obj[1].map(item => {
            return {
                total: item
            };
        });
        let eParentNode,eChildrenNode1,eChildrenNode2;
        for(let i=0;i<arr1.length;i++){
            eParentNode = document.createElement("div");
            eParentNode.setAttribute("class","preview-item border-bottom");

            eChildrenNode1 = document.createElement("div");
            eChildrenNode1.setAttribute("class","preview-thumbnail");
            let eImg = document.createElement("img");
            eImg.setAttribute("class","rounded-circle")
            eImg.setAttribute("src",location.origin + arr1[i].avatar);
            eChildrenNode1.appendChild(eImg);
            eParentNode.appendChild(eChildrenNode1);

            eChildrenNode2 = document.createElement("div");
            eChildrenNode2.setAttribute("class","preview-item-content d-flex flex-grow");
            eChildrenNode2.innerHTML = "<div class=\"flex-grow\">\n" +
                "<div class='d-flex d-md-block d-xl-flex justify-content-between'>\n" +
                "<h6 class='preview-subject'>"+arr1[i].name+"</h6>\n" +
                "<p class='text-muted text-small'>"+formatMoney(arr2[i].total)+"</p>\n" +
                "</div>\n" +
                "<p class='text-muted'>Well, it seems to be working now.</p>\n" +
                "</div>";
            eParentNode.appendChild(eChildrenNode2);
            top10UserHighest.appendChild(eParentNode);
        }
    }
    xhttp.open("GET",""+url+"/admin/api/invoice/top10BestTotal", true);
    xhttp.send();
}
// canvas Revenue
function revenueChart(){
    const xhttp = new XMLHttpRequest();
    var xValues = ["January", "February", "March", "April", "May","June","July","August","September","October","November","December"];
    var yValues = [];
    var barColors = ["red", "green","blue","orange","brown","purple","white","white","white","white","white","white"];
    // loop months get revenue
    for(let i=0;i<xValues.length;i++){
        xhttp.onload = function() {
            yValues.push(xhttp.responseText);
        }
        let index = i + 1;
        xhttp.open("GET",""+url+"/admin/api/invoice/revenue/" +index , false);
        xhttp.send();
    }
    new Chart("revenue", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: true,
                text: "Total Revenue",
            }
        }
    });
}
function loadContent(){
    loadTotal(""+url+"/admin/api/user/total",totalUser);
    loadTotal(""+url+"/admin/api/feedback/total",totalFeedback);
    loadTotal(""+url+"/admin/api/invoice/total",totalOrder);
    loadTotal(""+url+"/admin/api/product/total",totalProduct);
    loadTotal(""+url+"/admin/api/categories/total",totalCategories);
    getTotalRevenue(""+url+"/admin/api/invoice/total/revenue",totalRevenue);
    getTotalRevenue(""+url+"/admin/api/invoice/total/cod",totalRevenueCod);
    getTotalRevenue(""+url+"/admin/api/invoice/total/banking",totalRevenueBanking);
    getTotalRevenueByMonth();
    getTotalRevenueMethodByMonth("COD",totalRevenueCodMonth);
    getTotalRevenueMethodByMonth("PAYPAL",totalRevenueBankingMonth);
    getTop10Order();
    getTop10UserHighest();
    getOrderRecently()
    revenueChart();

}

document.addEventListener("DOMContentLoaded", function(event) {
    loadContent();
});
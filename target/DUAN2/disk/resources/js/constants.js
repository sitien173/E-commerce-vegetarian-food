const URL = location.origin;
var totalCart = 0;
function checkStatus(response) {
    if (response.status >= 200 && response.status < 300) {
        return Promise.resolve(response)
    } else {
        return Promise.reject(new Error(response.statusText))
    }
}
function convertJson(response) {
    return response.json();
}
function formatDate(day,month,year,hour,minute,second) {
    var date = new Date(Date.UTC(year,month-1,day,hour,minute,second));
    return date.toISOString().replace("T"," ").replace('.000Z','');
}

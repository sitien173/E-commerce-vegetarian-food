function formatDate(day,month,year,hour,minute,second) {
    var date = new Date(Date.UTC(year,month-1,day,hour,minute,second));
    return date.toISOString().replace("T"," ").replace('.000Z','');
}
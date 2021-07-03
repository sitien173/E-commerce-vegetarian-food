function formatMoney(money) {
    return new Intl.NumberFormat('en-VN',
        { style: 'currency', currency: 'VND' }
    ).format(money);
}
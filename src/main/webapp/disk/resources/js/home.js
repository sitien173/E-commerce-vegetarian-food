function slick(root){
    root.slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 4,
        accessibility: true,
        autoplay: true,
        autoplaySpeed: 2000,
        centerMode: true,
        speed: 500,
        cssEase: 'linear',
    });
}
document.addEventListener("DOMContentLoaded",function () {
    const $slickTrackHighlight = $('#slick-track-highlight');
    const $slickTrackBestSeller = $('#slick-track-best-seller');
    const $slickTrackSaleOff = $('#slick-track-sale-off');
     getProduct("/api/product/highlight",$slickTrackHighlight);
     getProduct("/api/product/best-seller",$slickTrackBestSeller);
     getProduct("/api/product/sale-off",$slickTrackSaleOff);
        setTimeout(function () {
            slick($slickTrackHighlight);
            slick($slickTrackBestSeller);
            slick($slickTrackSaleOff);
        },3000);
})
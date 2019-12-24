$(document).on('turbolinks:load', function() {
    $(function() {
        $('.slider').slick({
            autoplay: true,
            dots: true,
            arrows: false,
        });
    });

    $(function() {
        $('#nav-toggle').click(function() {
            $('body').toggleClass('open');
        });    
    });
});
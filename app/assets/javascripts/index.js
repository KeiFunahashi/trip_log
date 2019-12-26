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
    $(function() {

        $('.contents_boxs').slick({
            autoplay: true,
            accessibility: true,
            // arrows: true,
            centerMode: true,
            centerPadding: '60px',
            slidesToShow: 3,
            responsive: [{
                    breakpoint: 768,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 1
                    }
                }
            ]
        });
    });
});
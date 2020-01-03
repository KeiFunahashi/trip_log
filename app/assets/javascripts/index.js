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
            arrows: false,
            dots: true,
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
    $(function() {

        // ①タブをクリックしたら発動
        $('.tab li').click(function() {

            // ②クリックされたタブの順番を変数に格納
            var index = $('.tab li').index(this);

            // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
            $('.tab li').removeClass('active');

            // ④クリックされたタブにクリック済みデザインを適用する
            $(this).addClass('active');

            // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
            $('.area ul').removeClass('show').eq(index).addClass('show');

        });
    });
});
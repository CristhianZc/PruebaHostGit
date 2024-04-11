(function ($) {
    var $body = $('body');
    var $loader = $('.dt-loader-container');

    if ($loader.length) {
        $loader.delay(300).fadeOut('noraml', function () {
            $body.css('overflow', 'auto');
            $root.css('opacity', '1');
            $(document).trigger('loader-hide');
        });
    } else {
        $(document).trigger('loader-hide');
    }
})(jQuery);
$(document).ready(function() {
    var trick = false;
    
    // Mobile menu initialization
    $('body').append(
        '<div class="overlay"></div>' +
        '<div class="mobile-menu" id="mobile-menu"></div>' +
        '<div class="mobile-menu-close"><span class="fas fa-times"></span></div>' +
        '<div id="scrolltop"><span class="fas fa-long-arrow-up"></span></div>'
    );
    
    $('.js-this-in-mobile-menu').each(function() {
        $(this).clone().appendTo('#mobile-menu');
    });

    // Mobile menu events
    $(".js-show-mobile-menu").click(function() {
        $('.overlay').fadeIn(200);
        $('#mobile-menu, .mobile-menu-close').addClass('is-active');
        $('body').addClass('mobile-menu-is-opened');
    });
    
    $(document).on('click', '.overlay, .mobile-menu-close', function() {
        $('.overlay').fadeOut(200);
        $('#mobile-menu, .mobile-menu-close').removeClass('is-active');
        $('body').removeClass('mobile-menu-is-opened');
    });

    // Scroll to top functionality
    var gotop = $('#scrolltop');
    
    $(window).scroll(function() {
        if (trick === false) {
            trick = true;
            // Lazy loading for category menu images if needed
            $('.tabs-block__content [data-src]').each(function() {
                var trg = $(this).data('src');
                $(this).attr('src', trg).removeAttr('data-src');
            });
            
            // Comments functionality
            $('.page__comments-list').each(function() {
                var quantity = $('.comment-item', this).length;
                if (quantity > 3) {
                    $('.comment-item:gt(2)', this).hide();
                    $(this).append('<div class="show-comms"><a href="#">Открыть все ('+quantity+')</a></div>');
                }
            });
        }
        
        if ($(this).scrollTop() > 300) {
            gotop.fadeIn(200);
        } else {
            gotop.fadeOut(200);
        }
    });
    
    gotop.click(function() {
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    });

    // Category tabs functionality
    $('.tabs-block').each(function() {
        $(this).find('.tabs-block__select span:first').addClass('is-active');
        $(this).find('.tabs-block__content:first').removeClass('d-none');
    });
    
    $('.tabs-block__select').on('click', 'span:not(.is-active)', function() {
        $(this).addClass('is-active').siblings().removeClass('is-active')
            .parents('.tabs-block').find('.tabs-block__content').hide().eq($(this).index()).fadeIn(0);
    });

    // Desktop menu toggle
    $(".js-show-menu").click(function() {
        $('.header__menu').fadeToggle(200);
        $(this).find('.fal').toggleClass('fa-bars fa-times');
        $('body').toggleClass('menu-is-opened');
    });

    // ====================== COMMENTS FUNCTIONALITY ======================
    
    // Show/hide comment form
    $(".js-show-comments-form").click(function() {
        $('.add-comments-form').slideToggle(200);
    });
    
    // Reply to comment
    $(".comment-item__reply").click(function() {
        $('.add-comments-form').slideDown(200);
    });
    
    // Show protection field when focusing on textarea
    $(document).on('click', '.form__textarea-inside textarea, .fr-wrapper', function() {
        $('.add-comments-form').find('.form__row--protect').removeClass('d-none');
    });
    
    // Move AJAX comments to comments list
    $('#dle-content > #dle-ajax-comments').appendTo($('#page__comments-list'));
    
    // Social auth buttons
    $('.login__social-btns a').on('click', function() {
        var href = $(this).attr('href'),
            width = 820,
            height = 420,
            left = (screen.width - width) / 2,
            top = (screen.height - height) / 2 - 100;
        
        auth_window = window.open(href, 'auth_window', "width="+width+",height="+height+",top="+top+",left="+left+",menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no");
        return false;
    });
    
    // Generate avatar colors for comments without avatar
    $('.js-comm-author').each(function() {
        var a = $(this),
            b = a.closest('.js-comm'),
            c = a.text().substr(0, 1),
            f = b.find('.js-comm-avatar'),
            e = f.children('img').attr('src'),
            d = ["#c57c3b", "#753bc5", "#79c53b", "#eb3b5a", "#45aaf2", "#2bcbba", "#778ca3"],
            rand = Math.floor(Math.random() * d.length);
        
        if (e == '/templates/' + dle_skin + '/dleimages/noavatar.png') {
            f.html('<div class="comment-item__letter d-flex jc-center ai-center" style="background-color:' + d[rand] + '">' + c + '</div>');
        }
    });
    
    // Show all comments
    $(document).on('click', '.show-comms > a', function() {
        $(".comment-item").show();
        $(this).parent().remove();
        return false;
    });
});
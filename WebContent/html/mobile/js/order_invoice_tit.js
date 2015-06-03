$('.cpick').on('click',function () {
    var othpick=$(this).parent().siblings('.fl-item').children('.cpick');
        $(this).attr('name','on');
        othpick.children('div').removeClass('on');
        othpick.attr('name','off');
        $(this).children('div').addClass('on');
        othpick.next('span').children('input').hide();
});
$('.ipt-pick').on('click',function () {
    $(this).next('span').children('input').show();
    $(this).next('span').children('input').focus();
});
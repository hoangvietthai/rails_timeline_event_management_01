var invite_mem;
invite_mem = function () {
  $(".dcmbt").each(function () {
      $(this).on('click',function () {
        var id = $(this).data('event-id');
        var ev = $('#event-'+id).clone();
        ev = ev.css({ display: "inline-block" });
        $('.modal-body.members').html('')
        $('.modal-body.members').html(ev);
        $('.email-close').each(function (element) {
          $(this).click(function () {
              $(this).parents('.email-item').remove();
          });
        });
    });
  });

  $("#dcmfg").each(function(){
    $(this).blur(function(){
      var id = $('.modal-body.members .event-item').data('ev-id');
      var valu = $('#dcmfg').val();
      if (valu != ''){
        $('#dcmfg').val('')
        $('.ev_mem_'+id).append(
          '<div class="email-item email-'+valu+'"><span><div class="email-name">'
          +valu+'</div><button class="email-close"></button></span></div>')
        $('.email-close').each(function (element) {
          $(this).on('click', function () {
            $('.email-'+valu).remove();
          });
        });
      }
    });
  })
};

$(document).ready(invite_mem);

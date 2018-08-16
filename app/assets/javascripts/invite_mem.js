var invite_mem;
invite_mem = function () {
  $(".dcmbt").each(function () {
      $(this).on('click',function () {
        var id = $(this).data('event-id');
        var ev = $('#event-'+id).clone();
        ev = ev.css({ display: "inline-block" });
        $('.modal-body.members').html('')
        $('.modal-body.members').append(ev);
    });
  });

  $("#add_btn").each(function(){
    $(this).on('click',function(){
      var valu = $('#dcmfg').val();
      $('#dcmfg').val('')
      $('.add_mem_in').append(
        '<div class="email-item"><span><div class="email-name">'
        +valu+'</div><div class="email-close"></div></span></div>')
    });
  })
};

$(document).ready(invite_mem);

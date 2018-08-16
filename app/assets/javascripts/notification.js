var initialize_notification = function () {

    function setValueNoti(s) {
        $(s).click(function () {
            var myEventDes = $(this).data('description');
            $(".modal-body #eventDes").val(myEventDes);
            var myEventPlace = $(this).data('place');
            $(".modal-body #eventPlace").val(myEventPlace);
            var myEventStart = $(this).data('start');
            $(".modal-body #eventStart").val(myEventStart);
            var myEventEnd = $(this).data('end');
            $(".modal-body #eventEnd").val(myEventEnd);
            var myEventImportance = $(this).data('importance');
            $(".modal-body #eventImportance").val(myEventImportance);
            var myEventRemind = $(this).data('remind');
            $(".modal-body #eventRemind").val(myEventRemind ? 'Remind' : 'Not Remind');
        });
    }

    var noti_dont = $('#noti_dont').data('noti');
    $.each(noti_dont, function (i, id) {
        setValueNoti('#noti_event-' + id)
    });

    var notied = $('#notied').data('noti');
    $.each(notied, function (i, id) {
        setValueNoti('#noti_event-' + id)
    });
};
$(document).ready(initialize_notification);

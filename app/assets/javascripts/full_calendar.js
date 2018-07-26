var initialize_calendar;
initialize_calendar = function () {
    $('.calendar').each(function () {
        var calendar = $(this);
        calendar.fullCalendar({
            themeSystem: 'bootstrap4',
            header: {
                left: 'prev,next, today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay',
                prev: 'circle-triangle-w',
                next: 'circle-triangle-e',
            },
            selectable: true,
            selectHelper: true,
            editable: true,
            eventLimit: true,
            events: '/events.json',

            select: function (start, end) {
                $.getScript('/events/new', function () {
                    $('.date-range-picker').daterangepicker({
                        singleDatePicker: true,
                        timePicker: true,
                        applyButtonClasses: 'btn btn-color btn-md btn-signup',
                        cancelButtonClasses: 'btn btn-close',
                        drops: 'up',
                        locale: {
                            format: 'M/DD hh:mm A'
                        }
                    });
                    time_from = $('.start_hidden');
                    time_to = $('.end_hidden');
                    value1 = moment(start).format('M/DD hh:mm A');
                    value2 = moment(end).format('M/DD hh:mm A');
                    time_from.val(value1);
                    time_to.val(value2);
                });
                calendar.fullCalendar('unselect');
            },

            eventDrop: function (event, delta, revertFunc) {
                event_data = {
                    event: {
                        id: event.id,
                        time_from: event.start.format('M/DD hh:mm A'),
                        time_to: event.end.format('M/DD hh:mm A')
                    }
                };
                $.ajax({
                    url: event.update_url,
                    data: event_data,
                    type: 'PATCH'
                });
            },

            eventClick: function (event, jsEvent, view) {
                $.getScript(event.edit_url, function() {
                    $('.start_hidden').val(moment(event.start).format('M/DD hh:mm A'));
                    $('.end_hidden').val(moment(event.end).format('M/DD hh:mm A'));
                    $('.date-range-picker').daterangepicker({
                        singleDatePicker: true,
                        timePicker: true,
                        applyButtonClasses: 'btn btn-color btn-md btn-signup',
                        cancelButtonClasses: 'btn btn-close',
                        drops: 'up',
                        locale: {
                            format: 'M/DD hh:mm A'
                        }
                    });
                });
            }
        });
    });

    var noti_dont = $('#noti_dont').data('noti');
    $.each(noti_dont, function(i, id){
        var s = '#' + id;
        $(s).click(function() {
            $.getScript('/notifications/' + id, function () {
                alert(id);
            });
        });
    });
};
$(document).on('turbolinks:load', initialize_calendar);

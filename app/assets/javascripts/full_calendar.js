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
                });

            },

            eventDrop: function (event, delta, revertFunc) {
                event_data = {
                    event: {
                        id: event.id,
                        start: event.start.format(),
                        end: event.end.format()
                    }
                };
                $.ajax({
                    url: event.update_url,
                    data: event_data,
                    type: 'PATCH'
                });
            },

            eventClick: function (event, jsEvent, view) {
                $.getScript(event.edit_url, function () {
                });
            }
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);

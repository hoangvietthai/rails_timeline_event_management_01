var initialize_auto_load_email = function () {
    var i = 1;
    $('#invite_to').bind('keyup', function (e) {
        if (!e) var e = window.event;
        if (!Number.isInteger(e.keyCode)) {
            var email = this.value;
            if (validateEmail(email)) {
                var html = "<div class=\"email-item\">\n" + "<span>\n" +
                    "<div class=\"email-name\">" + email + "</div>\n" +
                    "<div class=\"email-close\" id =\"email-" + i + "\"></div>\n" + "</span>\n" +
                    "<input placeholder=\"example@gmail.com\" autofocus=\"autofocus\" autocomplete=\"email\"" +
                    "value=\"" + email +
                    "\" class=\"form-control\" type=\"hidden\" name=\"invite[email][]\" id=\"invite_email\">" +
                    "</div>";

                $('#list-items').append(html);
                $(this).val("");
                i = i + 1;
                $('.email-close').each(function (element) {
                    $(this).click(function () {
                        $(this).parents('.email-item').remove();
                    });
                });
            }
        }
    });
    $('#invite_to').blur(function () {
        var email = this.value;
        if (email != '' && validateEmail(email)) {
            var html = "<div class=\"email-item\">\n" + "<span>\n" +
                "<div class=\"email-name\">" + email + "</div>\n" +
                "<div class=\"email-close\" id =\"email-" + i + "\"></div>\n" + "</span>\n" +
                "<input placeholder=\"example@gmail.com\" autofocus=\"autofocus\" autocomplete=\"email\"" +
                "value=\"" + email +
                "\" class=\"form-control\" type=\"hidden\" name=\"invite[email][]\" id=\"invite_email\">" +
                "</div>";

            $('#list-items').append(html);
            $(this).val("");
            i = i + 1;
            $('.email-close').each(function (element) {
                $(this).click(function () {
                    $(this).parents('.email-item').remove();
                });
            });
        }
    });
};

function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

$(document).ready(initialize_auto_load_email);

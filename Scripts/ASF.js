
$(function () {

    initNumericTextboxes();
    $("#MainMenu").removeAttr("style");

    $('input:submit').not('.toolbarImageButton').button();

    positionFooter();

    $(window).scroll(positionFooter).resize(positionFooter);

    LeavePageNotification();
});

function initNumericTextboxes() {
    $.each($('.numeric,.numericInput'), function (i, val) {
        var e = $(val);
        e.numeric();

        if (e.attr("maxvalue") != null || e.attr("minvalue")) {
            var dta = {};
            var min = parseInt(e.attr("minvalue"));
            if (!isNaN(min))
                dta.minValue = min;
            var max = parseInt(e.attr("maxvalue"));
            if (!isNaN(max))
                dta.maxValue = max;
            e.jStepper(dta);
        }
    });
    $('.integer').numeric(false, null);

    $('input:text').not(".noresize").css("width", "160px");
    $('.numericInput').css("width", "80px");

    $.each($('input:text'), function (i, val) {
        var e = $(val);
        if (e.attr('maxlength') == null)
            e.attr('maxlength', '200');
    });

    $.each($('textarea:not(.longText)'), function (i, val) {
        var e = $(val);
        if (e.attr('maxlength') == null)
            e.attr('maxlength', '500');
    });

    $(".date").mask("9999-99-99");
    $(".phone").mask("(999) 999-9999");
    $(".ssn").mask("999-99-9999");
    $(".postcode").mask("9999");
    $(".idNumber").mask("999999 9999 99 9");

    BindCalendars(1900, new Date().getFullYear(), new Date().getFullYear());
}

function positionFooter()
{
    $("#footer").css({ position: "absolute", top: ($(window).scrollTop() + $(window).height() - $("#footer").height()) + "px" });
}

function BindCalendars(yearStart, yearEnd, selectedYear, selector)
{
    if (selector == null)
        selector = ".datepicker";
    
    var options = {
        showOn: 'both',
        buttonImage: '/Images/Calendar.png',
        buttonImageOnly: true,
        dateFormat: 'yy-mm-dd',
        changeYear: true,
        changeMonth: true,
        yearRange: yearStart + ':' + yearEnd
    };

    if (selectedYear != null)
        options.defaultDate = selectedYear + "-01-01";    

    $(selector).datepicker(options);

    $(selector).next("img").css("cursor", "pointer").css("position", "relative").css("top", "3px").css("margin-left", "3px");
}

var showLeavePageNotification = false;

function LeavePageNotification() {
    checkForFormChanges();
    $('.NoLeavePageNotiDialog').click(function () {
        showLeavePageNotification = false;
    });

    $(window).bind('beforeunload', function(e) {
        if (showLeavePageNotification) {
            return '';
        }
    });
}

function checkForFormChanges() {
    $('.LeavePageNotiDialog :input').bind("change", function () {
        showLeavePageNotification = true;
    });
}
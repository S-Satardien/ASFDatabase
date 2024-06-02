
$(document).ready(function ()
{
    $('.numeric').numeric();
    $('.integer').numeric(false, null);

    positionFooter();

    $(window).scroll(positionFooter).resize(positionFooter)
});

/*
function positionFooter()
{
    if ($(document).height() < $(window).height())
    {
        $("#footer").css({ position: "absolute", top: ($(window).scrollTop() + $(window).height() - $("#footer").height()) + "px" })
    }
}
*/

function positionFooter()
{
    $("#footer").css({ position: "absolute", top: ($(window).scrollTop() + $(window).height() - $("#footer").height()) + "px" })
}

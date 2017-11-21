$(document).ready(function () {
    $('a').tooltip({placement: 'top'});

    $("#widget-body1").slideToggle("slow"); //collapse #widget-body1(create user panel) by default
    $("#toggle1").click(function () {
        $("#widget-body1").slideToggle("slow");

        $('#toggle1').toggleClass(function () {
            if ($(this).is('.fa fa-chevron-down')) {
                return '.fa fa-chevron-up';
            } else {
                return '.fa fa-chevron-down';
            }
        })
    });

    $("#toggle2").click(function () {
        $("#widget-body2").slideToggle("slow");

        $('#toggle2').toggleClass(function () {
            if ($(this).is('.fa fa-chevron-down')) {
                return '.fa fa-chevron-up';
            } else {
                return '.fa fa-chevron-down';
            }
        })
    });

    /*$("#toggle3").click(function () {
     $("#widget-body3").slideToggle("slow");
     
     $('#toggle3').toggleClass(function () {
     if ($(this).is('.fa fa-chevron-down')) {
     return '.fa fa-chevron-up';
     } else {
     return '.fa fa-chevron-down';
     }
     })
     });*/

    jQuery(".delete-link").click(function () {
        if (!confirm("Are you sure you want to delete?")) {
            // Save it!
            return false;
        }
    });

});

/**
 * Contact Form
 */
jQuery(document).ready(function ($) {
    var debug = false; //show system errors

    $('.validateIt').submit(function () {
        var $f = $(this);
        var showErrors = $f.attr('data-show-errors') == 'true';
        var hideForm = $f.attr('data-hide-form') == 'true';

        var emailSubject = $f.attr('data-email-subject');

        var $submit = $f.find('[type="submit"]');

        //prevent double click
        if ($submit.hasClass('disabled')) {
            return false;
        }

        $('[name="field[]"]', $f).each(function (key, e) {
            var $e = $(e);
            var p = $e.attr('placeholder');

            if (p) {
                var t = $e.attr('required') ? '[required]' : '[optional]';
                var type = $e.attr('type') ? $e.attr('type') : 'unknown';
                t = t + '[' + type + ']';

                var n = $e.attr('name').replace('[]', '[' + p + ']');

                n = n + t;
                $e.attr('data-previous-name', $e.attr('name'));
                $e.attr('name', n);
            }
        });

        $submit.addClass('disabled');

        $f.append('<input class="temp" type="hidden" name="email_subject" value="' + emailSubject + '">');
        $f.append('<input type="hidden" name="js" value="1">');
        $.ajax({
            url: $f.attr('action'),
            method: 'post',
            data: $f.serialize(),
            dataType: 'json',
            success: function (data) {
                $('span.error', $f).remove();
                $('.error', $f).removeClass('error');
                $('.form-group', $f).removeClass('has-error');

                if (data.errors) {
                    $.each(data.errors, function (i, k) {
                        if (i == 'global') {
                            alert(k);
                        } else {
                            var input = $('[name^="' + i + '"]', $f).addClass('error');
                            if (showErrors) {
                                input.after('<span class="error help-block">' + k + '</span>');
                            }

                            if (input.parent('.form-group')) {
                                input.parent('.form-group').addClass('has-error');
                            }
                        }
                    });
                } else {
                    var item = data.success ? '.successMessage' : '.errorMessage';
                    if (hideForm) {
                        $f.fadeOut(function () {
                            $f.parent().find(item).show();
                        });
                    } else {
                        $f.parent().find(item).fadeIn();
                        $f[0].reset();
                    }
                }

                $submit.removeClass('disabled');
                cleanupForm($f);
            },
            error: function (data) {
                if (debug) {
                    alert(data.responseText);
                }
                $submit.removeClass('disabled');
                cleanupForm($f);
            }
        });

        return false;
    });

    function cleanupForm($f) {
        $f.find('.temp').remove();

        $f.find('[data-previous-name]').each(function () {
            var $e = jQuery(this);
            $e.attr('name', $e.attr('data-previous-name'));
            $e.removeAttr('data-previous-name');
        });
    }
    $('#treatments a.active').each(function(index,el){
        $(el).clone().appendTo(".selected-values");
    });
});

var placeSearch, autocomplete;
var componentForm = {
    route: 'short_name'+' '+'long_name',
    locality: 'long_name',
    administrative_area_level_1: 'short_name',
    administrative_area_level_2: 'short_name',
    country: 'long_name',
    postal_code: 'short_name'
};

function initAutocomplete() {
    // Create the autocomplete object, restricting the search to geographical
    // location types.
    var input = /** @type {!HTMLInputElement} */( document.getElementById('autocomplete'));
    if(!input){
        return
    }
    autocomplete = new google.maps.places.Autocomplete(
        input,
        {types: ['geocode']});

    // When the user selects an address from the dropdown, populate the address
    // fields in the form.
    autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();
    var lat =place.geometry.location.lat()
    var lng =place.geometry.location.lng()
    document.getElementById('lat').value = lat;
    document.getElementById('lng').value = lng;
    for (var component in componentForm) {
        document.getElementById(component).value = '';
        document.getElementById(component).disabled = false;
    }

    // Get each component of the address from the place details
    // and fill the corresponding field on the form.
    for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
        }
    }
}

// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.
function geolocate() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
                center: geolocation,
                radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
        });
    }
}
$(document).on('click', '.js-add-to-list', function () {
    var idVal= $(this).data('id');
    $(".js-add-to-list[data-id='" + idVal +"']").toggleClass('active');
    $('.selected-values a').remove();
    $('#treatments a.active').each(function(index,el){
        $(el).clone().appendTo(".selected-values");
    });
});
$(document).on('click', '.js-treat-sbt', function (e) {
    e.preventDefault();
    var treatments = [];
    var formName= $(this).closest('form');
    $('#treatment-content .treatment-type').each(function( index ) {
       if($(this).hasClass('active')){
           treatments.push($(this).data('id'));
       }
    });
    $('.js-treatments').val('').val(treatments);
    $(formName).submit();
});

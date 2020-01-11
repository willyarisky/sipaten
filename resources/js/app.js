/**
 * Import bootstrap depencies
 */
require('./bootstrap');

/**
 * Import select2
 */
require('select2');

/**
 * Import template
 */
import template from './template';

$(document).ready(function() {
    $('.symptoms').select2({placeholder: 'Cari atau pilih gejala'});
});

$('#analyze').submit((e) => {
    e.preventDefault();

    $('#results .disease').remove();

    $.ajax({
        url: '/analyze',
        type: 'POST',
        dataType: 'json',
        data: $(e.currentTarget).serialize(),
        beforeSend: () => {
            $('#btn-analyze').prop('disabled', true);
            $('.form-control').prop('disabled', true);
        }
    })
    .done((data) => {
        console.log(data);

        $.each(data, function (index, result) { 
            console.log(result);
            template.listItem(result);
        });
    })
    .fail((err) => {
        console.log("error");
    })
    .always( () => {
        $('#btn-analyze').prop('disabled', false);
        $('.form-control').prop('disabled', false);
    });
});
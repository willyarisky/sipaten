require('./bootstrap');
require('select2');

$(document).ready(function() {
    $('.diseases').select2({placeholder: 'Choose diseases you found on your Paddy'});
});
$(document).ready(function () {

    $(document).on("change", "#fechaSalida", function(e) {

        if (idRecorrido && idRecorrido !== 0) {
            $('#select-colectivo').removeAttr('disabled');
        }

    });

});

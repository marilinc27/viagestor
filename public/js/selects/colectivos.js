$(document).ready(function () {
    $("#select-colectivo").select2();

    $("#fechaSalida").on("input", function (e) {
        let fechaSalida = $('#fechaSalida').val();
        let selectColectivo = $("#select-colectivo");

        $(selectColectivo).select2({
            ajax: {
                url: urlDatosColectivos,
                type: "POST",
                dataType: "json",
                data: function (params) {
                    return { fechaSalida: fechaSalida };
                },
                headers: {
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                        "content"
                    ),
                },
                processResults: function (data) {
                    return {
                        results: data.map((colectivo) => ({
                            id: colectivo.id,
                            text: colectivo.nro_colectivo,
                        })),
                    };
                },
            },
            language: "es",
            placeholder: "Seleccione un colectivo",
            allowClear: true,
        });
    });
});

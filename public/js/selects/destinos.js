$(document).ready(function () {
    $("#select-origen").select2();
    $("#select-destino").select2();

    $(document).on("change", "#select-origen", function (e) {
        e.preventDefault();
        let idOrigen = $(this).find(':selected').data('idorigen');
        let selectDestino = $("#select-destino");

        $(selectDestino).select2({
            ajax: {
                theme: 'bootstrap4',
                url: urlDatosOrigen,
                type: "POST",
                data: function (params) {
                    return { idOrigen: idOrigen };
                },
                headers: {
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                        "content"
                    ),
                },
                processResults: function (data) {
                    return {
                        results: data.map((ciudad) => ({
                            id: ciudad.id,
                            text: ciudad.ciudad_destino + "-" + ciudad.provincia_destino,
                        })),
                    };
                },
            },
            language: "es",
            placeholder: "Seleccione una ciudad",
            allowClear: true,
        });
    });
});

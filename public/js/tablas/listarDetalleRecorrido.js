$(document).ready(function () {
    $(document).on("click", "#btnVerDetalle", function (e) {
        idRecorrido = $(this).data("id");
        urlDatosParadas = baseUrl.replace("__ID__", idRecorrido);
        tablaDetalle(urlDatosParadas);
    });

    $(document).on("change", "#select-destino", function (e) {
        idRecorrido = $(this).val();
        if (idRecorrido !== 0) {
            urlDatosParadas = baseUrl.replace("__ID__", idRecorrido);
            tablaDetalle(urlDatosParadas);
        }
    });

    function tablaDetalle(urlDatosParadas) {
        $("#tableDetalleRecorrido").DataTable({
            //configuraciones de la tabla
            language: {
                emptyTable: "No hay recorridos",
            },
            responsive: true,
            ajax: {
                url: urlDatosParadas,
                type: "GET",
                dataType: "json",

                data: function (d) {

                },
            },
            searching: false,
            pageLength: 5,
            bDestroy: true,
            lengthChange: false,
            info: false,
            columns: [
                {
                    data: "id",
                    visible: false,
                },

                {
                    data: null,
                    render: function (data, type, row) {
                        return `PARADA #${row.orden}`;
                    },
                },

                {
                    data: "ciudad_origen",
                },

                {
                    data: "ciudad_destino",
                },
            ],
        });
    }
});

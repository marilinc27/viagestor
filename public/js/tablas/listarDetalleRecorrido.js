$(document).ready(function () {
    $(document).on("click", "#btnVerDetalle", function (e) {
        idRecorrido = $(this).data("id");
        urlDatosParadas = baseUrl.replace("__ID__", idRecorrido);
        tablaDetalle(urlDatosParadas, false);
    });

    $(document).on("change", "#select-destino", function (e) {
        idRecorrido = $(this).val();
        $("#idRecorrido").val(idRecorrido);
        if (idRecorrido !== 0) {
            urlDatosParadas = baseUrl.replace("__ID__", idRecorrido);
            tablaDetalle(urlDatosParadas, true);
        }
    });

    function tablaDetalle(urlDatosParadas, setPrecio) {
        if ($.fn.DataTable.isDataTable("#tableDetalleRecorrido")) {
            $("#tableDetalleRecorrido").DataTable().clear().destroy();
        }

        const dtable = $("#tableDetalleRecorrido").DataTable({
            //configuraciones de la tabla
            info: false,
            lengthChange: false,
            paging: true,
            processing: false,
            searching: false,
            pageLength: 10,
            language: {
                url: "languaje/espanoltabla.json",
                emptyTable: "No hay recorridos",
            },
            responsive: true,
            ajax: {
                url: urlDatosParadas,
                type: "GET",
                dataType: "json",
                data: function (d) {},
            },
            columns: [
                {
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

                {
                    render: function (data, type, row) {
                        if (setPrecio) {
                            return `
                            <div class="input-group mb-3">
                                <span class="input-group-text">$</span>
                                <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name='precios[]' data-id="${row.id}" id="${row.id}">
                                <span class="input-group-text">.00</span>
                            </div>`;
                        } else {
                            return "";
                        }
                    },
                },
            ],
        });
    }
});

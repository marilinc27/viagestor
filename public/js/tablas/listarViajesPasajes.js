$(document).ready(function () {
    function ocultarFilas() {
        $(".listView:visible").each(function () {
            const listView = $(this).data("kendoListView");
            if (listView) {
                listView.destroy();
            }
            $(this).empty().hide();
        });
    }

    $(document).on(
        "click",
        "#tablePasajes tbody tr:not(.listView)",
        function (e) {
            ocultarFilas();

            const idRecorrido = $(this).data("id-recorrido");
            const idViaje = $(this).data("id-viaje");
            const $filaDetalle = $("#fila-viaje-" + idViaje);
            console.log(idViaje);
            $filaDetalle.show();

            const datosParadas = new kendo.data.DataSource({
                transport: {
                    read: {
                        url: urlParadasPrecios,
                        headers: {
                            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                                "content"
                            ),
                        },
                        dataType: "json",
                        type: "POST",
                        data: {
                            idRecorrido: idRecorrido,
                            idViaje: idViaje,
                        },
                    },
                },
                schema: {
                    model: {
                        fields: {
                            fecha_salida: {
                                type: "date",
                                parse: function (value) {
                                    return kendo.parseDate(
                                        value,
                                        "yyyy-MM-dd HH:mm:ss"
                                    );
                                },
                            },
                        },
                    },
                    data: "data",
                },
            });

            $filaDetalle.kendoListView({
                dataSource: datosParadas,
                template: kendo.template($("#listViewTemplate").html()),
            });
        }
    );

    let table = $("#tablePasajes").DataTable({
        info: false,
        lengthChange: false,
        paging: true,
        processing: false,
        serverSide: true,
        language: {
            url: "languaje/espanoltabla.json",
            search: "",
            searchPlaceholder: "Buscar ciudad",
        },
        ajax: {
            url: urlDatosViajePasaje,
            type: "POST",
            cache: false,
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
            },
            error: function (xhr, status, error) {
                console.log(
                    "Error en la respuesta del servidor:",
                    xhr.responseText
                );
            },
        },
        columns: [
            { data: "ciudad_origen" },
            { data: "ciudad_destino" },
            {
                data: null,
                render: function (data, type, row) {
                    return (
                        row.nro_colectivo ||
                        `<span class="text-secondary">Sin asignar</span>`
                    );
                },
            },
            {
                data: null,
                render: function (data, type, row) {
                    return (
                        row.servicios ||
                        `<span class="text-secondary">Sin asignar</span>`
                    );
                },
            },
            { data: null, render: (data, type, row) => row.fecha_s },
            { data: "hora_s" },
            { data: "pasajes_disponibles" },
            { data: "estado" },
        ],
        createdRow: function (row, data, dataIndex) {
            $(row).attr("data-id-recorrido", data.id_recorrido);
            $(row).attr("data-id-viaje", data.id);
        },
        drawCallback: function (settings) {
            let api = this.api();
            $("#tablePasajes tbody tr td div.listView").remove();

            api.rows({ page: "current" }).every(function () {
                let data = this.data();
                let row = this.node();
                let filaNueva = `<tr>
                    <td colspan="7" class="p-0">
                        <div id="fila-viaje-${data.id}" class="listView item d-flex detalleFila"></div>
                    </td>
                </tr>`;
                $(row).after(filaNueva);
            });
        },
        initComplete: function () {
            const input = $("#tablePasajes_filter input");

            $("#tablePasajes_filter label").html(`
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></i></span>
                ${input.prop("outerHTML")}
            </div>
        `);
        },
    });
});

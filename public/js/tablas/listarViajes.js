$(document).ready(function () {
    tablaViajes();
    $(document).on("change", "#fechaDesde", function (e) {
        fechaDesde = $("#fechaDesde").val();
        let fHasta = $("#fechaHasta").val();
        let fechaHoy = moment().format("YYYY-MM-DD");
        fechaHasta = !fHasta ? fechaHoy : fHasta;
        $("#fechaHasta").val(fechaHoy);
        $("#tablaviajes").DataTable().destroy();
        tablaViajes();
    });

    $(document).on("change", "#fechaHasta", function (e) {
        if ($("#fechaDesde").val()) {
            fechaDesde = $("#fechaDesde").val();
            fechaHasta = $("#fechaHasta").val();
            $("#tablaviajes").DataTable().destroy();
            tablaViajes();
        }
    });

    function tablaViajes() {
        let table = new DataTable("#tablaviajes", {
            processing: true,
            serverSide: true,
            lengthChange: false,
            language: {
                url: "languaje/espanoltabla.json",
                search: "",
                searchPlaceholder: "Buscar ciudad",
            },
            ajax: {
                url: urlDatosViaje,
                type: "POST",
                cache: false,
                headers: {
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                        "content"
                    ), // Se añade el token CSRF
                },
                data: function (d) {
                    d.fechaDesde = fechaDesde;
                    d.fechaHasta = fechaHasta;
                },
            },
            type: "post",
            columns: [
                {
                    data: "id",
                    visible: false,
                },
                {
                    data: "ciudad_origen",
                },
                {
                    data: "ciudad_destino",
                },
                {
                    data: null,
                    render: function (data, type, row) {
                        if (row.nro_colectivo) {
                            return row.nro_colectivo;
                        } else {
                            return `<span class="text-secondary">Sin asignar</span>`;
                        }
                    },
                },
                {
                    data: "pasajes_disponibles",
                },
                {
                    data: null,
                    render: function (data, type, row) {
                        return moment(row.fecha_s).format("DD/MM/YYYY");
                    },
                },
                {
                    data: "hora_s",
                },
                {
                    data: null,
                    render: function (data, type, row) {
                        return moment(row.fecha_ll).format("DD/MM/YYYY");
                    },
                },
                {
                    data: "hora_ll",
                },
                {
                    data: "estado",
                },

                {
                    data: null,
                    render: function (data, type, row) {
                        if (
                            row.id_estado == 2 ||
                            (row.id_estado == 7 && !row.id_colectivo)
                        ) {
                            return `<button id='' class='btn txt-verde-oscuro btnVerViaje'
                            data-bs-toggle="modal"
                            data-bs-target="#modalEditar"
                            data-id="${row.id}"
                            data-salida="${row.fh_salida}"
                            data-asientos="${row.pasajes_disponibles}"
                            data-estado="${row.id_estado}"
                            data-id-colectivo="${row.id_colectivo}"
                            data-colectivo="${row.nro_colectivo}"
                            data-id-recorrido="${row.id_recorrido}"
                            data-butacas-colectivo="${row.cant_butacas}"
                            >
                            <i class="bi bi-pencil-fill"></i>
                            </button>`;
                        } else {
                            return "";
                        }
                    },
                },
            ],
        });
    }
});

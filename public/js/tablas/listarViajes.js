$(document).ready(function () {
    let table = new DataTable("#tablaviajes", {
        processing: true,
        serverSide: true,
        language: {
            url: "languaje/espanoltabla.json",
        },
        ajax: {
            url: urlDatosViaje,
            type: "POST",
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"), // Se añade el token CSRF
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
                        return 'Sin asignar';
                    }
                },
            },
            {
                data: "fecha_salida",
            },
            {
                data: "estado",
            },
        ],
    });
});

$(document).ready(function () {
    let table = new DataTable("#tableRecorridos", {
        //configuraciones de la tabla
        processing: true,
        serverSide: true,
        language: {
            url: "languaje/espanoltabla.json",
        },
        ajax: {
            url: urlDatosRecorridos,
            type: "POST",
            dataType: "json",

            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"), // Se añade el token CSRF
            },
        },
        columns: [
            { data: "id", visible: false },
            { data: "ciudad_origen", title: "Origen" },
            { data: "ciudad_destino", title: "Destino" },
            { data: "hs_total", title: "Horas totales" },
            { data: "estado", title: "Estado" },
            {
                data: null,
                title: "Acciones",
                orderable: false,
                searchable: false,
                render: function (data, type, row) {
                    return `<button id='btnVerDetalle' class='btn btn-primary' data-id='${row.id}'  data-bs-toggle="modal" data-bs-target="#modalDetalles">Ver</button>`;
                },
            },
        ],
    });
});

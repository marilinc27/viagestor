$(document).ready(function () {

    let table = $("#tableRecorridos").DataTable({
        //configuraciones de la tabla
        info: false,
        lengthChange: false,
        paging: true,
        processing: false,
        serverSide: true,
        language: {
                url: "languaje/espanoltabla.json",
                search: "",
                searchPlaceholder: `Buscar`,
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
            {
                data: "ciudad_origen",
            },
            {
                data: "ciudad_destino",
            },
            {
                data: "hs_formateado",
            },
            {
                data: "estado",
            },
            {
                data: null,
                title: "Acciones",
                orderable: false,
                searchable: false,
                render: function (data, type, row) {
                    return `<button id='btnVerDetalle' class='btn btn-sm btn-verde' data-id='${row.id}'  data-bs-toggle="modal" data-bs-target="#modalDetalles">Ver</button>`;
                },
            },
        ],
        columnDefs: [
            {
                targets: [2, 3, 4], // Índices de las columnas que querés centrar
                className: "dt-center",
            },
        ],
        dom: '<"top d-flex justify-content-end align-items-center gap-2"f<"crear-recorrido-btn">>rt<"bottom"lip><"clear">',
        initComplete: function () {
            $(".crear-recorrido-btn").html(`
            <a href="${urlCrearRecorrido}" class="btn btn-verde">
                <i class="bi bi-map"></i> Crear recorrido
            </a>
        `);

        const input = $('#tableRecorridos_filter input');

        $('#tableRecorridos_filter label').html(`
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></i></span>
                ${input.prop('outerHTML')}
            </div>
        `);
        },
    });
});

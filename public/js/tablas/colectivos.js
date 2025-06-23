$(document).ready(function () {
    let table = $("#tablacolectivos").DataTable({
        info: false,
        lengthChange: false,
        paging: true,
        processing: false,
        language: {
            url: "languaje/espanoltabla.json",
        },
        ajax: {
            url: urlDatosColectivo,
            type: "POST",
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"), // Se añade el token CSRF
            },
        },
        type: "post",
        columns: [
            { data: "id", visible: false },
            { data: "nro_colectivo", title: "Nro de colectivo" },
            { data: "cant_butacas", title: "Cantidad de butacas" },
            { data: "servicios", title: "Servicios ofrecidos" },
            {
                data: null,
                title: "Acciones",
                orderable: false,
                searchable: false,
                render: function (data, type, row) {
                    return `
                        <a href="${baseUrlEdit}/${row.id}/edit" class="btn btn-sm btn-verde me-1"><i class="bi bi-pencil-fill"></i> Editar</a>
                        <button class="btn btn-sm btn-rojo btn-borrar" data-id="${row.id}"><i class="bi bi-trash3-fill"></i> Deshabilitar</button>
                    `;
                },
            },
        ],
         columnDefs: [
            {
                targets: [4], // Índices de las columnas que querés centrar
                className: "dt-center",
            },
        ],
        dom: '<"top d-flex justify-content-end align-items-center mb-2 gap-2"f<"crear-colectivo-btn">>rt<"bottom"lip><"clear">',

        initComplete: function () {


            $(".crear-colectivo-btn").html(`
            <a href="${urlCrearColectivo}" class="btn btn-verde">
                <i class="bi bi-bus-front"></i> Crear colectivo
            </a>
        `);
                const input = $("#tablacolectivos_filter input");
            $("#tablacolectivos_filter label").html(`
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-search"></i></i></span>
                        ${input.prop("outerHTML")}
                    </div>
                `);
        },
    });
});

$("#tablacolectivos").on("click", ".btn-borrar", function () {
    const id = $(this).data("id");

    if (confirm("¿Estás seguro de que querés dar de baja este colectivo?")) {
        fetch(`/colectivos/${id}`, {
            method: "DELETE",
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
                Accept: "application/json",
                "Content-Type": "application/json",
            },
        })
            .then((response) => response.json())
            .then((data) => {
                if (data.success) {
                    alert(data.message);
                    $("#tablacolectivos").DataTable().ajax.reload();
                } else {
                    alert("Ocurrió un error.");
                }
            });
    }
});

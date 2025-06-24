$(document).ready(function () {
    let table = new DataTable("#tablaempleados", {
        info: false,
        processing: true,
        serverSide: false,
        lengthChange: false,
        paging: true,
        language: {
            url: "languaje/espanoltabla.json",
        },
        ajax: {
            url: urlDatosEmpleado,
            type: "POST",
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"), // Se añade el token CSRF
            },
        },
        type: "post",
        columns: [
            { data: "id", visible: false },
            { data: "name", title: "Nombre y apellido" },
            { data: "email", title: "Correo" },
            { data: "tipo", title: "Tipo" },
            {
                data: null,
                title: "Acciones",
                orderable: false,
                searchable: false,
                render: function (data, type, row) {
                    console.log(data);
                    if (row.tipo == "VENDEDOR") {
                        if (row.estado == 2) {
                            return `<button class="btn btn-sm btn-danger btn-borrar" data-id="${row.id}">🗑️ Borrar</button>`;
                        } else {
                            return `<button class="btn btn-sm btn-success btn-reactivar" data-id="${row.id}">♻️ Reactivar</button>`;
                        }
                    }
                    return "";
                },
            },
        ],
    });
});

$("#tablaempleados").on("click", ".btn-borrar", function () {
    const id = $(this).data("id");

    if (confirm("¿Estás seguro de que querés dar de baja este empleado?")) {
        fetch(`${baseUrlEdit}/${id}`, {
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
                    $("#tablaempleados").DataTable().ajax.reload();
                } else {
                    alert("Ocurrió un error.");
                }
            });
    }
});

$("#tablaempleados").on("click", ".btn-reactivar", function () {
    const id = $(this).data("id");

    if (confirm("¿Querés reactivar este empleado?")) {
        fetch(`${baseUrlEdit}/reactivar/${id}`, {
            method: "POST",
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
                    $("#tablaempleados").DataTable().ajax.reload();
                } else {
                    alert("Ocurrió un error.");
                }
            });
    }
});

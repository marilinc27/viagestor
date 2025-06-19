$(document).ready(function() {
    let table = new DataTable('#tablaempleados', {
        processing: true,
        serverSide: false,
        language:{
            url : 'languaje/espanoltabla.json'
        },
        ajax: {
            url: urlDatosEmpleado,
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')  // Se añade el token CSRF
            }
        },
        type:'post', 
        columns: [
            { data: 'id', visible: false },
            { data: 'nombre', title: 'Nombre' },
            { data: 'apellido', title: 'Apellido' },
            { data: 'email', title: 'Correo' },
            { data: 'tipo', title: 'Tipo' },
            {
                data: null,
                title: 'Acciones',
                orderable: false,
                searchable: false,
                render: function (data, type, row) {
                    return `
                        <a href="${baseUrlEdit}/${row.id}/edit" class="btn btn-sm btn-primary me-1">✏️ Editar</a>
                        <button class="btn btn-sm btn-danger btn-borrar" data-id="${row.id}">🗑️ Borrar</button>
                    `;
                }
            }
        ]

    });
});


$('#tablaempleados').on('click', '.btn-borrar', function () {
    const id = $(this).data('id');

    if (confirm('¿Estás seguro de que querés dar de baja este empleado?')) {
        fetch(`/empleados/${id}`, {
            method: 'DELETE',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                $('#tablaempleados').DataTable().ajax.reload();
            } else {
                alert('Ocurrió un error.');
            }
        });
    }
});

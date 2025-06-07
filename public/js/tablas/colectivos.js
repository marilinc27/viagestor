$(document).ready(function() {
    let table = new DataTable('#tablacolectivos', {
        processing: true,
        serverSide: true,
        language:{
            url : 'languaje/espanoltabla.json'
        },
        ajax: {
            url: urlDatosColectivo,
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')  // Se añade el token CSRF
            }
        },
        type:'post', 
        columns: [
            { data: 'id', visible: false },
            { data: 'nro_colectivo', title: 'Nro de colectivo' },
            { data: 'cant_butacas', title: 'Cantidad de butacas' },
            { data: 'servicios', title: 'Servicios ofrecidos' },
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


$('#tablacolectivos').on('click', '.btn-borrar', function () {
    const id = $(this).data('id');

    if (confirm('¿Estás seguro de que querés dar de baja este colectivo?')) {
        fetch(`/colectivos/${id}`, {
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
                $('#tablacolectivos').DataTable().ajax.reload();
            } else {
                alert('Ocurrió un error.');
            }
        });
    }
});


$(document).ready(function() {
    let table = new DataTable('#tablaviajes', {
        processing: true,
        serverSide: true,
        language:{
            url : 'languaje/espanoltabla.json'
        },
        ajax: {
            url: urlDatosViaje,
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')  // Se añade el token CSRF
            }
        },
        type:'post',
        columns: [
            { data: 'id', title: 'ID' },
            { data: 'id_recorrido', title: 'Recorrido' },
            { data: 'id_colectivo', title: 'Colectivo' },
            { data: 'fecha_salida', title: 'Fecha salida' },
            { data: 'hora_salida', title: 'Hora salida' },
            // {
            //     data: null,
            //     title: 'Acciones',
            //     orderable: false,
            //     searchable: false,
            //     render: function (data, type, row) {
            //         return `
            //             <a href="/viajes/${row.id}/edit" class="btn-editar">✏️ Editar</a>
            //             <button class="btn-borrar" data-id="${row.id}">🗑️ Borrar</button>
            //         `;
            //     }
            // }
        ]

    });
});

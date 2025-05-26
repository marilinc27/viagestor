
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
            { data: 'id', title: 'ID' },
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
                        <a href="/colectivos/${row.id}/edit" class="btn-editar">✏️ Editar</a>
                        <button class="btn-borrar" data-id="${row.id}">🗑️ Borrar</button>
                    `;
                }
            }
        ]

    });
});
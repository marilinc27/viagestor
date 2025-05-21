$(document).ready(function () {
    $('.select-provincia').select2();
    $('.select-ciudad').select2();

    $(document).on('change', '.select-provincia', function (e) {
        e.preventDefault();
        let idProvincia = $(this).val();
        let selectCiudad = $(this).data("ciudad");

        $(selectCiudad).select2({
            ajax: {
                url: urlDatosCiudades,
                type: 'POST',
                data: function (params) {
                    return { idProvincia: idProvincia };
                },
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                processResults: function (data) {
                    return {
                        results: data.map(ciudad => ({
                            id: ciudad.id,
                            text: ciudad.nombre
                        }))
                    };
                }
            },
            language: 'es',
            placeholder: 'Seleccione una ciudad',
            allowClear: true
        });
    });
});

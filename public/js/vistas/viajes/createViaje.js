$(document).ready(function () {
$(document).on('click', "#btnGuardar", function(e) {
e.preventDefault();
var arrayPrecios =[];
$('input[name="precios[]"]').each(function(index, element) {
    let idParada = $(this).data('id');
    let precio = $(element).val();

    paradaPrecio = {
        idParada: idParada,
        precio: precio
    }
    if (precio) {
        $('#'+idParada).removeClass('is-invalid');
        console.log(precio);
        arrayPrecios.push(paradaPrecio);
    } else {
        $('#'+idParada).addClass('is-invalid');
        return;
    }

    $('#preciosFinal').val(JSON.stringify(arrayPrecios));

    $('#formViajes').submit();
});

});


});

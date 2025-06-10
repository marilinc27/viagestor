$(document).ready(function () {
    $(document).on("click", "#btnGuardar", function (e) {
        e.preventDefault();
        var arrayPrecios = [];
        error = false;

        $("#fechaSalida").removeClass("is-invalid");
         $("#pasajesDisponibles").removeClass("is-invalid");

         console.log()
        if (!$("#fechaSalida").val()) {
            $("#fechaSalida").addClass("is-invalid");
            error=true;
        }


        if ($("#pasajesDisponibles").val()=="0") {
            $("#pasajesDisponibles").addClass("is-invalid");
            error=true;
        }

        $('input[name="precios[]"]').each(function (index, element) {
            let idParada = $(this).data("id");
            let precio = $(element).val();
            paradaPrecio = {
                idParada: idParada,
                precio: precio,
            };
            if (precio) {
                $("#" + idParada).removeClass("is-invalid");
                console.log(precio);
                arrayPrecios.push(paradaPrecio);
            } else {
                $("#" + idParada).addClass("is-invalid");
                return;
            }
            $("#preciosFinal").val(JSON.stringify(arrayPrecios));
            if (error) {
                return;
            }
            $("#formViajes").submit();
        });
    });
});

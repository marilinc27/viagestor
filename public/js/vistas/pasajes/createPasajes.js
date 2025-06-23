$(document).ready(function (e) {
    var cont = 1;
    var arrayPasajeros = [];

    function formValidado() {
        let nombre = $("#nombre").val();
        let apellido = $("#apellido").val();
        let dni = $("#dni").val();
        let butaca = $("#butaca").val();
        let val = true;

        $("#nombre, #apellido, #dni, #butaca").removeClass('is-invalid');

        if (!nombre) {
            $("#nombre").addClass('is-invalid');
            val = false;
        }
        if (!apellido) {
            $("#apellido").addClass('is-invalid');
            val = false;
        }
        if (!dni) {
            $("#dni").addClass('is-invalid');
            val = false;
        }

        if (butaca == 0) {
            $("#butaca").addClass('is-invalid');
            val = false;
        }

        return val;
    }

    $("#btnAgregarPasajero").on("click", function (e) {
        e.preventDefault();
        if (formValidado()) {
            let nombre = $("#nombre").val();
            let apellido = $("#apellido").val();
            let dni = $("#dni").val();
            let butaca = $("#butaca").val();
            let pasajeHTML = `
        <div id="fila-${cont}" class="border-bottom p-2 d-flex">
            <div class="w-75">
                <div>NOMBRE: ${nombre}</div>
                <div>APELLIDO: ${apellido}</div>
                <div>DNI: ${dni}</div>
                <div>BUTACA: ${butaca}</div>
                <div>PRECIO: ${precio}</div>
            </div>
            <div class="w-25 align-content-center text-center">
                <a href="#" class="btnEliminarPasajero text-danger"
                data-id="#fila-${cont}"
                data-pasajero="${cont}"><i class="bi bi-x-square-fill"></i></a>
            </div>
        </div>`;
            $("#contenedorPasajeros").append(pasajeHTML);
            agregarPasajero(cont,nombre, apellido, dni, butaca, precio);
            reservarButaca(butaca);
            actualizarTotal(precio);
            cont++;
            verficarDisponibilidad();
        }


        $("#nombre").val("");
        $("#apellido").val("");
        $("#dni").val("");
    });

    function verficarDisponibilidad() {
        disponibilidad--;
        console.log(disponibilidad);
        if (disponibilidad == 0) {
            $("#btnAgregarPasajero").prop("disabled", true);
        }
    }

    function agregarPasajero(cont,nombreP, apellidoP,dniP, butacaP, precioP) {
        let nuevoElemento = {
                    id: cont,
                    nombre: nombreP,
                    apellido: apellidoP,
                    dni: dniP,
                    butaca: butacaP,
                    precio: precioP,
                };

        arrayPasajeros.push(nuevoElemento);
    }
    function reservarButaca(butaca) {
        $('#butaca').val(0);
        $('#butaca').find(`option[value=${butaca}]`).hide();
    }

    function actualizarTotal(precio) {
        let total = parseInt($("#precioTotal").text());
        total = total + precio;
        $("#precioTotal").text("");
        $("#precioTotal").text(total);
    }

    $(document).on("click", ".btnEliminarPasajero", function (e) {
        let pasajero = $(this).data('pasajero');

        let id = $(this).data('id');
        $(id).remove();

        // Devuelvo el asiento reservado a mi select
        let resul = arrayPasajeros.find((p) => p.id == pasajero);
        $('#butaca').find(`option[value=${resul.butaca}]`).show();

        //Borro el pasajero de mi lista
        arrayPasajeros = arrayPasajeros.filter((f)=> f.id !== pasajero);

        //actualizo el precio
        actualizarTotal(-precio);
        disponibilidad++;
    });


    $("#btnConfirmar").on("click", function(e) {

        if (arrayPasajeros.length === 0) {
            e.preventDefault
            alert("Agregue al menos un pasajero");
        } else {
            let total = parseInt($("#precioTotal").text());
            $("#total").val(total);
            $("#disponibilidad").val(disponibilidad);
            $("#pasajeros").val(JSON.stringify(arrayPasajeros));
            $("#formPasajes").submit();
        }

    });
});

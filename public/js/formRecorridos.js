var cont = 1;
var orden = 1;
var contSelectCiudad = 3;
var arrayParadas = [];
var arrayCiudades = [];
var arrayRecorridos = [];
$(document).ready(function () {
    $("#btnAgregarParada").on("click", function (e) {
        e.preventDefault();
        let idDivParada = "divParada" + cont;
        let optionsHTML = "";
        let idSelectCiudad = "idCiudad" + contSelectCiudad;

        provincias.forEach((prov) => {
            optionsHTML += `<option value="${prov.id}">${prov.nombre}</option>`;
        });

        let paradaHTML = `
            <div id="${idDivParada}" class="parada bg-danger" data-id="${cont}" style="height:60px">

                <div class="row">
                    <div class="col-md-4">
                        <select class="selectpicker select-provincia" data-live-search="true" title="Selecciona una provincia"
                        data-ciudad="#${idSelectCiudad}" required>
                        <option id="0" value="0"> Seleccione una provincia</option>
                        ${optionsHTML}
                        </select>
                    </div>
                    <div class="col-md-4">
                        <select class="selectpicker select-ciudad" data-live-search="true" title="Selecciona una ciudad" id="${idSelectCiudad}" name="${idSelectCiudad}" required>
                            <option value="0"> Seleccione una ciudad</option>
                        </select>
                    </div>
                </div>
                <a href="#" class="btnEliminarParada" data-id="${idDivParada}">Eliminar</a>
            </div>
        `;
        $("#ordenParadas").append(
            `<div class="row  bg-info" id="orden${orden}" style="height:60px">#${orden}</div>`
        );
        $("#contenedorParadas").append(paradaHTML);
        // $(".selectpicker").select2(); // o selectpicker('render');

        $("#" + idDivParada)
            .find(".select-provincia")
            .select2({
                placeholder: "Seleccione una provincia",
                allowClear: true,
            });

        $("#" + idDivParada)
            .find(".select-ciudad")
            .select2({
                placeholder: "Seleccione una ciudad",
                allowClear: true,
            });

        arrayParadas.push(cont);
        cont++;
        orden++;
        contSelectCiudad++;
    });

    $(document).on("click", ".btnEliminarParada", function (e) {
        e.preventDefault();
        let id = "#" + $(this).data("id");
        let divOrden = $(this).data("orden");

        arrayParadas = arrayParadas.filter((f) => f != divOrden);
        $(id).remove();

        orden--;
        $("#orden" + orden).remove();
    });

    $("#btnConfirmar").on("click", function (e) {
        let valoresCiudades = [];
        arrayRecorridos = [];
        let origenId = $("#idCiudad1").val();
        let origenTxt = $("#idCiudad1 option:selected").text();
        let destinoId = $("#idCiudad2").val();
        let destinoTxt = $("#idCiudad2 option:selected").text();
        let tbody = $("#tableResumenRecorrido tbody");
        let formValidado;

        tbody.empty();
        unaCiudad = {
            id: origenId,
            nombre: origenTxt,
        };

        valoresCiudades.push(unaCiudad);
        $("#contenedorParadas .parada").each(function () {
            let valorCiudad = $(this).find(".select-ciudad").val();
            let ciudad = $(this).find(".select-ciudad option:selected").text();

            unaCiudad = {
                id: valorCiudad,
                nombre: ciudad,
            };

            valoresCiudades.push(unaCiudad);
        });

        unaCiudad = {
            id: destinoId,
            nombre: destinoTxt,
        };

        valoresCiudades.push(unaCiudad);


        notFormValidado = valoresCiudades.find(f=> f.id == 0);

        if (!notFormValidado) {
            $('#contenedor-form').show();
            $('#contenedor-error').hide();
            for (let i = 0; i < valoresCiudades.length - 1; i++) {
                let origen = valoresCiudades[i].nombre;
                let destino = valoresCiudades[i + 1].nombre;

                let nuevoElemento = {
                    idOrigen: valoresCiudades[i].id,
                    idDestino: valoresCiudades[i + 1].id,
                };

                arrayRecorridos.push(nuevoElemento);

                let fila = `<tr>
                <td>${origen}</td>
                <td>${destino}</td>
                <td><input type="number" name="duracion[]" class="form-control duracion" min="0" step="0.5" required></td>
                </tr>`;
                tbody.append(fila);
            }
        } else {
            $('#contenedor-form').hide();
            $('#contenedor-error').show();
        }
        e.preventDefault();
    });

    $("#btnGuardar").on("click", function (e) {
        let duracionTramos = [];
        let arrayRecorridosFinal = [];

        $("#tableResumenRecorrido tbody tr").each(function () {
            let valorHora = $(this).find(".duracion").val();
            duracionTramos.push(valorHora);
        });

        i = 0;
        arrayRecorridos.forEach((element) => {
            let nuevoElemento = {
                idOrigen: element.idOrigen,
                idDestino: element.idDestino,
                hsTramo: duracionTramos[i],
            };
            i++;

            arrayRecorridosFinal.push(nuevoElemento);
        });


        $("#inputCiudades").val(JSON.stringify(arrayRecorridosFinal));
        // e.preventDefault();
    });

});

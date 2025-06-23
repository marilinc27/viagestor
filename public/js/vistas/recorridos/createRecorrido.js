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
            <div id="${idDivParada}" class="parada w-100 border d-flex align-items-center justify-content-between px-2 rounded-end data-id="${cont}" style="height: 60px;">

    <!-- Contenedor de selects centrado -->
    <div class="d-flex justify-content-center align-items-center flex-grow-1 gap-3" style="height: 40px;">
        <div class="w-40">
            <select class="selectpicker select-provincia w-100" data-live-search="true" title="Selecciona una provincia"
                data-ciudad="#${idSelectCiudad}" required>
                <option id="0" value="0"> Seleccione una provincia</option>
                ${optionsHTML}
            </select>
        </div>
        <div class="w-40">
            <select class="selectpicker select-ciudad w-100" data-live-search="true" title="Selecciona una ciudad"
                id="${idSelectCiudad}" name="${idSelectCiudad}" required>
                <option value="0"> Seleccione una ciudad</option>
            </select>
        </div>
    </div>

    <!-- Handler y botón eliminar -->
    <div class="d-flex align-items-center gap-2">
        <div class="drag-handle d-flex align-items-center justify-content-center"
            style="width: 40px; height: 40px; cursor: grab; border-radius: 5px;">
            <span style="font-size: 20px; line-height: 1;">☰</span>
        </div>
        <a href="#" class="btnEliminarParada text-danger btn-sm" data-id="${idDivParada}"><i class="bi bi-x-square-fill"></i></a>
    </div>
</div>

        `;
        $("#ordenParadas").append(
            `<div class="row align-items-center bg-gis-claro justify-content-center border rounded-start-2" id="orden${orden}" style="height:60px">${orden}</div>`
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

        notFormValidado = valoresCiudades.find((f) => f.id == 0);

        if (!notFormValidado) {
            $("#contenedor-form").show();
            $("#contenedor-error").hide();
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
            $("#contenedor-form").hide();
            $("#contenedor-error").show();
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

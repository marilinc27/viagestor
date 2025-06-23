$(document).ready(function (e) {
    $(document).on("click", ".btnVerViaje", function (e) {
        // CONFIGURACIÓN DEL FOMULARIO EDITAR VIAJE
        idViaje = $(this).data("id");
        console.log(idViaje);

        let finalUrl = urlUpdateViaje.replace(":id", idViaje);
        $("#formEditarViaje").attr("action", finalUrl);

        let colectivo = $(this).data("colectivo");
        let maxAsientos = 60;
        let arrayCantAsientos = [];
        cantPasajes = $(this).data("asientos");
        $("#idViaje").val($(this).data("id"));
        $("#idRecorrido").val($(this).data("id-recorrido"));

        //seteo la fecha en timepicker
        // $("#fechaSalida").val($(this).data("salida"));

        console.log($(this).data("salida"));
        const fechaRaw = $(this).data("salida"); // "2025-06-10 08:44:00"
        const fechaJS = new Date(fechaRaw.replace(" ", "T"));

        // Transformá la fecha con Tempus Dominus
        const fechaTD = new tempusDominus.DateTime(fechaJS);

        window.picker.dates.setValue(fechaTD); // ✅ Ahora sí funciona

        $("#fechaSalidaOriginal").val($(this).data("salida"));
        $("#colectivoOriginal").val($(this).data("id-colectivo"));
        let estado = parseInt($(this).data("estado"));
        $("#estadoActual").val(estado);
        $("#estadoActual").prop("disabled", false);
        $("#fechaSalida").prop("disabled", false);
        $("#pasajesDisponiblesActual").prop("disabled", false);

        if (estado == 2) {
            for (let i = cantPasajes; i <= maxAsientos; i += 10) {
                arrayCantAsientos.push(i);
            }
        }

        if ((estado == 2 || estado == 7) && !colectivo) {
            idColectivo = null;
            $("#colectivoNoAsignado").removeClass("d-none");
            $("#colectivoAsignado").addClass("d-none");
        } else {
            idColectivo = $(this).data("id-colectivo");
            cargarColectivo(
                $(this).data("id-colectivo"),
                $(this).data("colectivo"),
                $(this).data("butacas-colectivo")
            );
        }

        if (estado == 7) {
            arrayCantAsientos.push(cantPasajes);
            $("#estadoActual").prop("disabled", true);
            $("#fechaSalida").prop("disabled", true);
            $("#pasajesDisponiblesActual").prop("disabled", true);
        }

        cargarSelect(arrayCantAsientos);
        setColectivosDisponibles();
    });

    function setColectivosDisponibles() {
        const existingListView = $("#listView").data("kendoListView");
        if (existingListView) {
            existingListView.destroy();
            $("#listView").empty(); // Limpia el contenido HTML
        }

        var datosColectivos = new kendo.data.DataSource({
            transport: {
                read: {
                    url: urlDatosColectivosDisponibles, // Tu endpoint
                    headers: {
                        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                            "content"
                        ),
                    },
                    dataType: "json", // Esperás JSON
                    type: "POST",
                    data: function (d) {
                        d.cantPasajes = cantPasajes;
                        d.idColectivo = idColectivo;
                    },
                },
            },
        });

        $("#listView").kendoListView({
            dataSource: datosColectivos,
            template: kendo.template($("#listViewTemplate").html()),
        });

        $("#busquedaColectivo")
            .off("keyup")
            .on("keyup", function () {
                const valor = $(this).val();
                const listView = $("#listView").data("kendoListView");
                const dataSource = listView.dataSource;

                if (valor) {
                    dataSource.filter({
                        field: "nro_colectivo",
                        operator: function (itemValue) {
                            return itemValue.toString().includes(valor);
                        },
                    });
                } else {
                    dataSource.filter([]); // Quita el filtro si no hay texto
                }
            });
    }

    function cargarSelect(array) {
        $("#pasajesDisponiblesActual").empty();

        for (let index = 0; index < array.length; index++) {
            option = `<option value="${array[index]}">${array[index]}</option>`;
            $("#pasajesDisponiblesActual").append(option);
        }
    }

    $(document).on("click", ".btnAsignar", function (e) {
        cargarColectivo(
            $(this).data("id-colectivo"),
            $(this).data("colectivo"),
            $(this).data("butacas-colectivo")
        );
    });

    function cargarColectivo(id, nroColectivo, butacasColectivo) {
        idColectivo = id;
        setColectivosDisponibles();
        $("#colectivoAsignado").empty();

        contenidoColectivo = `<div>Nro de Colectivo: ${nroColectivo} </div>
        <div>Cant asientos: ${butacasColectivo}</div>`;

        $("#idColectivo").val(id);
        $("#colectivoAsignado").append(contenidoColectivo);
        $("#colectivoNoAsignado").addClass("d-none");
        $("#colectivoAsignado").removeClass("d-none");
    }

    $(document).on("click", "#btnConfirmar", function (e) {
        $("#formEditarViaje").submit();
    });

    $(document).on("change", "#pasajesDisponiblesActual", function (e) {
        cantPasajes = $("#pasajesDisponiblesActual").val();
        setColectivosDisponibles();
    });
});

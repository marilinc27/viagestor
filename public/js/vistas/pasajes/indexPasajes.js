$(document).ready(function(e){
    $(document).on("click","#btnComprarPasaje", function(e){
        let id =$(this).data('id');
        let viaje = $(this).data('viaje');
        let recorrido = $(this).data('recorrido');
        let salida = $(this).data('salida');
        let precio = $(this).data('precio');
        let destino = $(this).data('destino');
        let disponibilidad = $(this).data('disponibilidad');
        let dispPasajes = $(this).data('disp-pasajes');

        window.location.href = `${basePasajeUrl}?
        id=${id}&
        viaje=${encodeURIComponent(viaje)}&
        recorrido=${recorrido}&
        salida=${salida}&
        precio=${precio}&
        destino=${destino}&
        disponibilidad=${disponibilidad}&
        pasajes=${dispPasajes}`;
    })
})

window.onload = function (){
    activarNavegacion();
}
function activarNavegacion(){
    var RegistrarHV = document.getElementById( 'RegistrarHV');
    var Solicitudes = document.getElementById( 'Solicitudes');
    var ActualizarHV = document.getElementById( 'ActualizarHV');
    var Historial = document.getElementById( 'Historial');
    var CambiarContraseña = document.getElementById( 'CambiarContraseña');
    
    
    RegistrarHV.onclick = mostrarRegistro;
    Solicitudes.onclick = mostrarSolicitudes;
    ActualizarHV.onclick = mostrarActualizacion;
    Historial.onclick = mostrarHistorial;
    CambiarContraseña.onclick = mostrarCambioC;

} 

function consumirAjax(urlPagina){
    var ajaxHttp = new XMLHttpRequest();
    ajaxHttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            var contenidoAspirante = document.getElementById('contenidoAspirante');
            contenidoAspirante.innerHTML = this.responseText;
        }
    }
    ajaxHttp.open('POST', urlPagina, true);
    ajaxHttp.send();
}

//function mostrarRegistro(argument){
//    consumirAjax('RegistrarHVDatosBasicos.jsp');      
//}
function mostrarRegistro(argument){
    consumirAjax('RegistrarDatosBasicos.jsp');
//     var Continuar = document.getElementById('id_btn_continuar');
//        Continuar.onclick = mostrar; Averiguar como saber que le dieron click a un boton
}

function mostrarLugarResidencia(argument){
    consumirAjax('RegistrarHVLugarResidencia.jsp');      
}

function mostrarSolicitudes(argument){
    
}
function mostrarActualizacion(argument){
    
}
function mostrarHistorial(argument){
    
}
function mostrarCambioC(argument){
    
}
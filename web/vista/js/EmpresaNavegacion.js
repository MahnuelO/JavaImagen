window.onload = function (){
    activarNavegacion();
}
function activarNavegacion(){
    var miInformacion = document.getElementById('RegistrarInfo');
    var consultarPerfil = document.getElementById('consultarPerfil');
    var historial = document.getElementById('historial');
    var CambiarContraseña = document.getElementById('CambiarClave');

    miInformacion.onclick = mostrarInformacion;
    consultarPerfil.onclick = mostrarConsulta;
    historial.onclick = mostrarHistorial;
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

function mostrarInformacion(argument){
    consumirAjax('registrarinformacionempresa.jsp');
}

function mostrarConsulta(argument){
    consumirAjax('');      
}

function mostrarHistorial(argument){
    consumirAjax(''); 
}
function mostrarCambioC(argument){
    consumirAjax('cambioclave.jsp'); 
}
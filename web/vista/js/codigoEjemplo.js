//window.onload = function () {
//    activarMenu();
//}
//
//function activarMenu() {
//    var RC = document.getElementById('btnRegistrarse');
//    RC.onclick = mostrarRegistrarCuenta;
//    var IS = document.getElementById('btnIrIniciarSesion');
//    IS.onclick = mostrarIniciarSesion; // NAVEGACION DE HOJA DE VIDA
////    var I = document.getElementById('btnRegistrar');
////    I.onclick = mostrarRegistrarCuenta;
//}
//
//
//function consumirAjax(urlPagina) {
//    var ajaxHttp = new XMLHttpRequest();
//    ajaxHttp.onreadystatechange = function () {
//        if (this.readyState == 4 && this.status == 200) {
//            var divContenedor = document.getElementById('contenido');
//            divContenedor.innerHTML = this.responseText;
//        }
//    }
//    ajaxHttp.open('POST', urlPagina, true);
//    ajaxHttp.send();
//}
//
//function mostrarRegistrarCuenta(argument) {
//    consumirAjax('RC.jsp');
//    document.getElementById('btnRegistrarse').style.display = 'none';
//    document.getElementById('btnIrIniciarSesion').style.display = 'block';
//
//}
//
//function mostrarIniciarSesion(argument) {
//    consumirAjax('IniciarSesion.jsp');
//    document.getElementById('btnRegistrarse').style.display = 'block';
//    document.getElementById('btnIrIniciarSesion').style.display = 'none';
//}

//function mostrarIniciarSesion(argument) {
//    consumirAjax('IS.jsp');
//    document.getElementById('btnRegistrarse').style.display = 'block';
//    document.getElementById('btnIrIniciarSesion').style.display = 'none'; //UTILIZANDO GENERICO
//}

$(document).ready(function () {
    formEnviar()
})

function formEnviar() {  
        $('#btnRegistrar').on('click', function (e) {
            e.preventDefault()
            var rol = $('#id_rol').val();
            var id_tipo_identificacion = $('#id_tipo_identificacion').val();
            var numero_identificacion = $('#numero_identificacion').val();
            console.log('HOlA '+ rol);
            console.log('id '+ id_tipo_identificacion);
            console.log('numero '+ numero_identificacion);
            $.ajax({
                'url': 'includes/registrar.jsp',
                'type': 'POST',
                'data': {
                    "id_rol": rol, "id_tipo_identificacion": id_tipo_identificacion, "numero_identificacion": numero_identificacion
                },
                'success': function (respuesta) {
                    alert('hola');
                }
            });
        });
}

//quitar el codugo de RC y poner un else en el de includes y registrar


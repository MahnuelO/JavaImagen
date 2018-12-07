function mostrar(){
    
    var bachillerato = document.getElementById('id_estudios_bachillerato');
    var superior = document.getElementById('id_estudios_superior');
    var postgrado = document.getElementById('id_estudios_postgrado');
    var complementario = document.getElementById('id_estudios_complementarios');
    var eleccion = document.getElementById('id_cbx_nivel_estudio');
    var eleccion_complementario = document.getElementById('rd_estudio_complementario_si');
    
    if(eleccion.checked){
        if(eleccion==='2'){
            bachillerato.style.display='block';
        }else {
            bachillerato.style.display='none'; 
            superior.style.display='none'; 
            postgrado.style.display='none';
            complementario.style.display='none';
        }
    }
    
    if(eleccion.checked){
        if(eleccion==='3'){
            bachillerato.style.display='block';
            superior.style.display='block';
        }else {
            bachillerato.style.display='none'; 
            superior.style.display='none'; 
            postgrado.style.display='none';
            complementario.style.display='none'; 
        }
    }
    
    if(eleccion.checked){
        if(eleccion==='4'){
            bachillerato.style.display='block';
            superior.style.display='block';
            postgrado.style.display='block';
        }else {
            bachillerato.style.display='none'; 
            superior.style.display='none'; 
            postgrado.style.display='none';
            complementario.style.display='none';   
        }
    }
    
    if(eleccion_complementario.checked){
            bachillerato.style.display='block';
            superior.style.display='block';
            postgrado.style.display='block';
        complementario.style.display='block';
    }else {
        complementario.style.display='none';   
    }
    
}


//function mostrar() {
//            div = document.getElementById('flotante');
//            div.style.display = '';
//        }

//        function cerrar() {
//            div = document.getElementById('flotante');
//            div.style.display = 'none';
//        }

function showContent() {
        element = document.getElementById("content");
        check = document.getElementById("check");
        if (check.checked) {
            element.style.display='block';
        }
        else {
            element.style.display='none';
        }
    }

//function muestra_oculta(id){
//    if (document.getElementById){ //se obtiene el id
//        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
//        el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
//    }
//}
//window.onload = function(){/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
//muestra_oculta('contenido');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */

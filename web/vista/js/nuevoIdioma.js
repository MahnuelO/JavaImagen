var btn_mas;

window.onload = function () {
    
    var btnCrear = document.getElementById('btn_mas');
    btnCrear.onclick = accionClickCrear;
    var btnOcultar = document.getElementById('btnQuitar');
    btnOcultar.onclick = ocultar;
}


function accionClickCrear() {
    ////////////////////////IDIOMA//////////////////////////////
    
    var contenedorFile = document.getElementById('nuevo');
    var x = document.createElement("LABEL");
    var t = document.createTextNode("Idioma");
    x.setAttribute("id", "txt_idioma");
    var br = document.createElement("br");
    br.setAttribute("id", "br");
    contenedorFile.appendChild(br);
    x.appendChild(t);
    contenedorFile.appendChild(x);

    var contenedorFile = document.getElementById('nuevo');
    var a = document.createElement("LABEL");
    var b = document.createTextNode("*");
    a.setAttribute("id", "id_asterisco_nuevo2");
    a.appendChild(b);
    contenedorFile.appendChild(a);
    
        
        var contenedorFile = document.getElementById('nuevo');
    var botonIdioma = document.createElement("select");
    botonIdioma.id = "c_idioma";
    contenedorFile.appendChild(botonIdioma);
    
     ////////////////////////NIVEL//////////////////////////////

    var contenedorFile = document.getElementById('nuevo');
    var x = document.createElement("LABEL");
    var t = document.createTextNode("Nivel");
    x.setAttribute("id", "txt_nivel");
    x.appendChild(t);
    var br = document.createElement("br");
    br.setAttribute("id", "br2");
    contenedorFile.appendChild(br);
    contenedorFile.appendChild(x);

    var contenedorFile = document.getElementById('nuevo');
    var a = document.createElement("LABEL");
    var b = document.createTextNode("*");
    a.setAttribute("id", "id_asterisco_nuevo");
    a.appendChild(b);
    contenedorFile.appendChild(a);
    
    
    var contenedorFile = document.getElementById('nuevo');
    var botonFile = document.createElement("select");
    botonFile.id = "fot_nombre[]";
    botonFile.class = "cbx_nivel";
    contenedorFile.appendChild(botonFile);


    var contenedorFile = document.getElementById('nuevo');
    var boton = document.createElement("input");
    boton.type = "button";
    boton.id = "btnQuitar";
    boton.value = "x";
    contenedorFile.appendChild(boton);
    boton.onclick = ocultar;



}
function ocultar() {
    var nuevo = document.getElementById('fot_nombre[]');
    var nuevoBoton = document.getElementById('btnQuitar');
    var quitarNivel = document.getElementById('txt_nivel');
    var quitarA = document.getElementById('id_asterisco_nuevo');
    var quitarI = document.getElementById('c_idioma');
    var quitartxtI = document.getElementById('txt_idioma');
    var quitarA2 = document.getElementById('id_asterisco_nuevo2');
    var quitarBR = document.getElementById('br');
    var quitarBR2 = document.getElementById('br2');
    nuevo.remove();
    nuevoBoton.remove();
    quitarNivel.remove();
    quitarA.remove();
    quitarA2.remove();
    quitarI.remove();
    quitartxtI.remove();
    quitarBR.remove();
    quitarBR2.remove();
    
}
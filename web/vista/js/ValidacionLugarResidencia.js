var btnValidarLR;

window.onload= function(){
    iniciarLR();
}

function iniciarLR(){
    btnValidarLR = document.getElementById('id_btn_guardar_LR');
    btnValidarLR.onclick = accionValidarLR;
}

function accionValidarLR(argument){
    var listaInputs = document.getElementsByTagName('input');
    for (var i = 0; i < listaInputs.length; i++) {
        if (listaInputs[i].value === "") {
            listaInputs[i].classList.add("error");
        }else{
            listaInputs[i].classList.remove("error");
            validarNumeros(listaInputs[i]);
            validarRB(listaInputs[i]);
        }
    }
    
    function validarNumeros(itemInput){
	if (itemInput.type === 'number') {
            var strValNum= getElementById('numero_identificacion');
            strValNum = '^([0-9]{2})+\+([0-9]{10})?$)'
            if (itemInput.value.match(strValNum)) {
		alert("numero identificacion valido");
            } else{
		alert("numero identificacion no valido");
            }
	}
    }
    
    function validarRB(argument){
        var elegido =("input[name=opcion]:checked");
            if (elegido.val())
                alert("SELECCIONADO " +elegido.val());
            else {
                alert("NINGUN VALOR SELECCIONADO")  
            } 
    }
}



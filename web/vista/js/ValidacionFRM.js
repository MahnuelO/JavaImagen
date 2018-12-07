var btnValidar;

window.onload= function (argument){
    init();
}

function init(){
    btnValidar = document.getElementById('id_btn_registrar');
    btnValidar.onclick = accionValidar;
}

function accionValidar(argument){
    function accionValidar(argument){
	var listaInputs = document.getElementsByTagName('input');
	for (var i = 0; i < listaInputs.length; i++){
            if (listaInputs[i].value == "") {
                listaInputs[i].classList.add("error");
                cosole.log("Hola" + listaInputs[i]);
            }else{
		listaInputs[i].classList.remove("error");
		validarNumeros(listaInputs[i]);
		validarClave(listaInputs[i]);
		validarCorreo(listaInputs[i]);
            }
	}
    }

    function validarClave(argument){
	var p1 = document.getElementById('clave');
	var p2 = document.getElementById('clave2');
	var strValidarClave = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,15}$/;
        if (itemInput.value.match(strValidarClave)) {
            alert("Debe ingresar una clave con minimo 8 caracteres y contener minimo una mayúscula, una minuscula, un numero y 1 caracter especial");
	}
	if (p1.value === p2.value){
            alert("Claves son iguales");
	}else{
            alert("Las claves son diferentes");
	}
    }
    
    function validarCorreo(itemInput){
	var correo = document.getElementById('correo');
	if (itemInput.type === 'email'){
            var strValidador ='^(([a-zA-Z0-9])+(.)*)@([a-zA-Z0-9\_\.]+\.([a-zA-Z]{3})(\.[a-zA-Z]{2})?$)'
            if (itemInput.value.match(strValidador)){
		alert("Correo valido");
            }else{
		alert("Correo no valido");
            }
	}else if (itemInput.type === 'number'){
            var telefono = strValNume;
            strValNume = '^([0-9]?$)';
	} if (itemInput.value.match(strValNume)) {
            alert("numero valido");
	} else{
            alert("numero no valido");
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
}

		

		

		
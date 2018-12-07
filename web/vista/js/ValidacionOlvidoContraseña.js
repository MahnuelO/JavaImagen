var btnValidarOV;

window.onload= function(){
    iniciarOV();
}

function iniciarOV(){
    btnValidarOV = document.getElementById('id_btn_guardar_OC');
    btnValidarOV.onclick = accionValidarLR;
}

function accionValidarLR(argument){
    var listaInputs = document.getElementsByTagName('input');
    for (var i = 0; i < listaInputs.length; i++) {
        if (listaInputs[i].value === "") {
            listaInputs[i].classList.add("error");
        }else{
            listaInputs[i].classList.remove("error");
            validarClave(listaInputs[i]);
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
}



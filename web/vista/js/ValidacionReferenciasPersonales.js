
function accionValidar(argument){
    var nombre,apellido,telefono,correo,empresa,profesion,cargo,expresion_correo;
    
    nombre = document.getElementById("nombre").value;
    apellido = document.getElementById("apellido").value;
    telefono = document.getElementById("telefono").value;
    correo = document.getElementById("correo").value;
    empresa = document.getElementById("empresa_donde_labora").value;
    profesion = document.getElementById("profesion").value;
    cargo = document.getElementById("cargo_actual").value;
    
//    expresion_correo = /[a-zA-Z0-9])+(.)*)@([a-zA-Z0-9\_\.]+\.([a-zA-Z]{3})(\.[a-zA-Z]{2}/;
     expresion_correo = '^(([a-zA-Z0-9])+(.)*)@([a-zA-Z0-9\_\.]+\.([a-zA-Z]{3})(\.[a-zA-Z]{2})?$)';
    
    if(nombre==="" || apellido==="" || telefono==="" || correo==="" || 
       empresa==="" || profesion==="" || cargo===""){
   
       alert("Los campos deben llenarse");
       return false;
    }
    
    else if(nombre.length>30){
       alert("El nombre es demasiado largo");
       return false;    
    }  
    
    else if(apellido.length>30){
       alert("El apellido es demasiado largo");
       return false;    
    }
    
    else if(telefono.length>20){
       alert("El telefono es demasiado largo");
       return false;    
    }
    
    else if(correo.length>45){
       alert("El correo es demasiado largo");
       return false;    
    }
    
    else if(!expresion_correo.test(correo)){
       alert("El correo no es valido");
       return false;  
    }
    
    else if(empresa.length>45){
       alert("El nombre de la empresa es demasiado largo");
       return false;    
    }
    
    else if(profesion.length>50){
       alert("El nombre de la profesión es demasiado largo");
       return false;    
    }
    
    else if(cargo.length>45){
       alert("El cargo es demasiado largo");
       return false;    
    }
}

//function accionValidar(argument){
//	var listaInputs = document.getElementsByTagName('input');
//	for (var i = 0; i < listaInputs.length; i++){
//            if (listaInputs[i].value == "") {
//                listaInputs[i].classList.add("error");
//            }else{
//		listaInputs[i].classList.remove("error");
//		validarCorreo(listaInputs[i]);
//		validarNumeros(listaInputs[i]);
//            }
//	}
//    }
//    
//    function validarCorreo(itemInput){
//	var correo = document.getElementById('correo');
//	if (itemInput.type === 'email'){
//            var strValidador ='^(([a-zA-Z0-9])+(.)*)@([a-zA-Z0-9\_\.]+\.([a-zA-Z]{3})(\.[a-zA-Z]{2})?$)'
//            if (itemInput.value.match(strValidador)){
//		alert("Correo valido");
//            }else{
//		alert("Correo no valido");
//            }
//	}else if (itemInput.type === 'number'){
//            var telefono = strValNume;
//            strValNume = '^([0-9]?$)'
//	} if (itemInput.value.match(strValNume)) {
//            alert("numero valido");
//	} else{
//            alert("numero no valido");
//	}
//    }
//    
//    function validarNumeros(itemInput){
//	if (itemInput.type === 'number') {
//            var strValNum= getElementById('numero_identificacion');
//            strValNum = '^([0-9]{2})+\+([0-9]{10})?$)'
//            if (itemInput.value.match(strValNum)) {
//		alert("numero identificacion valido");
//            } else{
//		alert("numero identificacion no valido");
//            }
//	}
//    }



function accionValidarR() {
    var numero_identificacion,fecha_nacimiento,correo,contraseña,confirmar_contraseña,
        expresion_correo,expresion_clave,expresion_fecha,moment;
    
    numero_identificacion = document.getElementById("numero_identificacion").value;
    fecha_nacimiento = document.getElementById("fecha_nacimiento").value;
    correo = document.getElementById("correo").value;
    contraseña = document.getElementById("clave").value;
    confirmar_contraseña = document.getElementById("clave2").value;
    
//    expresion_correo = /[a-zA-Z0-9])+(.)*)@([a-zA-Z0-9\_\.]+\.([a-zA-Z]{3})(\.[a-zA-Z]{2}/;
    expresion_correo = '^(([a-zA-Z0-9])+(.)*)@([a-zA-Z0-9\_\.]+\.([a-zA-Z]{3})(\.[a-zA-Z]{2})?$)';
    expresion_clave = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,15}$/;
    expresion_fecha = /^(?:3[01]|[12][0-9]|0?[1-9])([\-/.])(0?[1-9]|1[1-2])\1\d{4}$/;
    
    if(numero_identificacion==="" || fecha_nacimiento==="" || correo==="" || 
       contraseña==="" || confirmar_contraseña===""){
   
       alert("Los campos deben llenarse");
       return false;
    }
    
    else if(numero_identificacion.length>20){
       alert("El número de identificación es demasiado largo");
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
    
    else if(contraseña.length>20){
       alert("La contraseña es demasiado largo");
       return false;    
    }
    
    else if(!expresion_clave.test(contraseña)){
       alert("La contraseña no es valida");
       return false;  
    }
    
    else if(contraseña===confirmar_contraseña){
       alert("Las contraseñas deben ser validas");
       return false;  
    }
    
    else if(!expresion_fecha.test(fecha_nacimiento)){
       alert("La fecha de nacimiento debe ser dd/mm/aaaa");
       return false;  
    }
     
    fecha_nacimiento.Validator.mayorEdad = {
        validate: function(validator, $field, options) {
            var value = $field.val();    
           
            var fechanacimiento = moment(value, "DD-MM-YYYY");
          
            if(!fechanacimiento.isValid())
                return false;
          
            var years = moment().diff(fechanacimiento, 'years');
          
            return years > 18;               
        }
    };
}

//var form = document.forms["Registro"].value;
//    
//    if (form === "") {
//        
//    function validarIdentificacion(tipoN) {
//        var numIde = document.getCalculatedOffset('numero_identificacion');
//        if (tipoN.type === 'number') {
//            var strValNum= getElementById('numero_identificacion');
//            strValNum = '^([0-9]{2})+\+([0-9]{10})?$)';
//            if (tipoN.value.match(strValNum)) {
//		alert("numero identificacion valido");
//            } else{
//		alert("numero identificacion no valido");
//            }
//	}
//    }
//    
//    function validarCorreo(tipoC){
//	var correo = document.getElementById('correo');
//	if (tipoC.type === 'email'){
//            var strValidarCorreo ='^(([a-zA-Z0-9])+(.)*)@([a-zA-Z0-9\_\.]+\.([a-zA-Z]{3})(\.[a-zA-Z]{2})?$)';
//            if (tipoC.value.match(strValidarCorreo)){
//		alert("Correo valido");
//            }else{
//		alert("Correo no valido");
//            }
//	}else if (tipoC.type === 'number'){
//            var telefono = strValNume;
//            strValNume = '^([0-9]?$)';
//	} if (tipoC.value.match(strValNume)) {
//            alert("numero valido");
//	} else{
//            alert("numero no valido");
//	}
//    }
//    
//    function validarClave(tipoV){
//	var p1 = document.getElementById('clave');
//	var p2 = document.getElementById('clave2');
//        if (tipoV.type === 'email'){
//            var strValidarClave = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,15}$/;
//            if (tipoV.value.match(strValidarClave)) {
//                alert("Debe ingresar una clave con minimo 8 caracteres y contener minimo una mayúscula, una minuscula, un numero y 1 caracter especial");
//            }
//            if (p1.value === p2.value){
//                alert("Claves son iguales");
//            }else{
//                alert("Las claves son diferentes");
//            }
//        }
//    }
//    
//    alert("Debe completar todos los campo");
//        return false;
//    }

		

		

		

function accionValidarDB(){
    var fecha_nacimiento,numero_identificacion,horario,correo,licencia_conduccion,
        libreta_militar,numero_libreta,genero,descripcion,moment,expresion_correo;

   cedula//^((\d{8})|(\d{10})|(\d{11})|(\d{6}-\d{5}))?$
    fecha_nacimiento = document.getElementById("fecha_nacimiento").value;
    numero_identificacion = document.getElementById("numero_identificacion").value;
    horario = document.getElementById("horario").value;
    correo = document.getElementById("correo").value;
    licencia_conduccion = document.getElementById("rd_licencia_conduccion").value;
    libreta_militar = document.getElementById("rd_libreta_militar").value;
    numero_libreta = document.getElementById("numero_libreta_militar").value;
    genero = document.getElementById("rd_genero").value;
    descripcion = document.getElementsByName("area_perfil_ocupacional").value;
 
    expresion_correo = '^(([a-zA-Z0-9])+(.)*)@([a-zA-Z0-9\_\.]+\.([a-zA-Z]{3})(\.[a-zA-Z]{2})?$)';
    
    if(numero_identificacion.length>20){
       alert("El número de identificacion es demasiado largo");
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
    
    else if(numero_libreta.length>20){
       alert("El número de la libreta militar es demasiado largo");
       return false;    
    }  
    
    else if(descripcion.length>1500){
       alert("La descripción es demasiado largo");
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
    
    function edad(Fecha,helperMsg){
	fecha = new Date(Fecha)
	hoy = new Date()
	ed = parseInt((hoy -fecha)/365/24/60/60/1000)
	if (ed < 18) {
		alert(helperMsg);
		Fecha.focus();
		return false;
	}
	return true;
}
    
    
    
//    licencia_conduccion:{
//        validators:{
//            callback: {
//                alert('Debe elegir una opción');
//            }
//        }
//    }
}



//var formDB = document.forms["Registro"].value;
//    
//    if (formDB === "") {
//    
//
//    function validarRB(argument){
//        var elegido =("input[name=opcion]:checked");
//            if (elegido.val())
//                alert("SELECCIONADO " +elegido.val());
//            else {
//                alert("NINGUN VALOR SELECCIONADO")  
//            } 
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
//    alert("Debe completar todos los campo");
//        return false;
//    }



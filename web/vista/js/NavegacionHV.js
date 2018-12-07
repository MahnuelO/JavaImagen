window.onload = function () {
	activarMenu();
}

function activarMenu() {
	var regDatosBasicos = document.getElementById('registrardatosbasicos');
	var lugarResidencia = document.getElementById('registrarLugarresidencia');
	var estudios = document.getElementById('registrarestudios');
	var idiomas = document.getElementById('registraridioma');
	var expeLaboral = document.getElementById('registrarexperiencia');
	var referencias = document.getElementById('referenciaspersonales');

	regDatosBasicos.onclick= mostrarRegDatosBasicos;
	lugarResidencia.onclick = mostrarLugarResidencia ;
	estudios.onclick = mostrarestudios;
	idiomas.onclick = mostrarIdiomas;
	expeLaboral.onclick = mostrarExpeLaboral;
	referencias.onclick = mostrarReferencias;
}


function consumirAjax(urlPagina) {
	console.log("Pluggers : " + urlPagina);
	var ajaxHttp = new XMLHttpRequest();
	ajaxHttp.onreadystatechange = function () {
		if(this.readyState == 4 && this.status == 200){
			var divContenedor = document.getElementById('conatainer');
			divContenedor.innerHTML = this.responseText;
		}
	}
	ajaxHttp.open('POST', urlPagina, true);
	ajaxHttp.send();
}


function mostrarHome(argument) {
	
}

function mostrarPerfil(argument) {
	consumirAjax('paginas/perfil.html');
}



function mostrarEstudios(argument) {
	consumirAjax('paginas/estudios.html');
}


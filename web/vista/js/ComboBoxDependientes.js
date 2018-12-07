$(document).ready(function(){
    $('#cbx_pais').change(function () {
    $('#cbx_ciudad').find('option').remove().end().append(
        '   <option value="Seleccionar">Seleccionar</option>').val('Seleccionar');
        $("#cbx_pais option:selected").each(function() {
        id_pais = $(this).val();
            $.post("includes/getDepartamento.jsp", {id_pais: id_pais
            }, function (data) {
                $("#cbx_departamento").html(data);
            });
        });
    })
});
            
$(document).ready(function(){
    $('#cbx_departamento').change(function () {
        $("#cbx_departamento option:selected").each(function() {
            id_departamento = $(this).val();
            $.post("includes/getCiudad.jsp", {id_departamento: id_departamento
            }, function (data) {
                $("#cbx_ciudad").html(data);
            });
        });
    })
});

//$(document).ready(function(){
//    $("#id_btn_solicitar_c").click(function(){
//        $("#id_btn_continuar_DB").slideToggle();
//    });
//});

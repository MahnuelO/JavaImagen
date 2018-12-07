function abrirVentana(pagina) 
{ 
    var opciones= " status=yes,resizable=no, width=508, height=340, top=180, left=450";
    window.open(pagina,"",opciones);

} 

  
        $(function () {
            $(document).on('change', ':file', function () {
                var input = $(this),
                        numFiles = input.get(0).files ? input.get(0).files.length : 1,
                        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                input.trigger('fileselect', [numFiles, label]);
            });

            $(document).ready(function () {
                $(':file').on('fileselect', function (event, numFiles, label) {

                    var input = $(this).parents('.input-group').find(':text'),
                            log = numFiles > 1 ? numFiles + ' files selected' : label;

                    if (input.length) {
                        input.val(log);
                    } else {
                        if (log)
                            alert(log);
                    }

                });
            });

        });

//toolbar=no
//location=no, directories=no,
//menubar=yes,
//scrollbars=no, 
//status=yes




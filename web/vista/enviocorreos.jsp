<%-- 
    Document   : EnvioCorreos
    Created on : 23-jul-2018, 17:42:12
    Author     : carmen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="EnvioCorreos" method="POST">
            <input type="text" name="destino" id="destino"/>
            <input type="text" name="asunto" id="asunto"/>
            <input type="text" name="mensaje" id="mensaje"/>
            <input type="submit" name="send" id="send" value="SEND"/>
            
        </form>
            
    </body>
</html>

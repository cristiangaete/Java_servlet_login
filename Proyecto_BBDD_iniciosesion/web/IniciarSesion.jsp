<%-- 
    Document   : IniciarSesion
    Created on : 17-ago-2018, 23:34:21
    Author     : Cristian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
        <form method="POST" action="InicioServlet">
            <label>Ingrese su rut<input type="text" name="rut" id="idrut"></label>
            <input type="submit" value="Consultar">
            
        </form>
    </body>
</html>

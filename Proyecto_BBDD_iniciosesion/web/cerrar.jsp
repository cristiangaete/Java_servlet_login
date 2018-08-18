<%-- 
    Document   : cerrar
    Created on : 17-ago-2018, 23:33:36
    Author     : Cristian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();//Cierra la sesion
    request.getRequestDispatcher("IniciarSesion.jsp").forward(request, response);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

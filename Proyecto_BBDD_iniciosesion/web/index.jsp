<%-- 
    Document   : index
    Created on : 17-ago-2018, 23:31:06
    Author     : Cristian
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registrar usuario</h1>
        <div align="center">
             <a href="IniciarSesion.jsp">¿Tienes una cuenta?</a>
             </div>
        <form method="POST" action="RegistroServlet">
            <label>Ingrese su rut<input type="text" name="rut" id="idrut"></label><br>
            <label>Ingrse su nombre<input type="text" name="nombre" id="idnombre"></label><br>
            <label>Ingrese su apellido paterno<input type="text" name="ape_pat" id="apellido_pat"></label><br>
            <label>Ingrese su apellido materno<input type="text" name="ape_mat" id="apellido_mat"></label><br>
            <label>Ingrese su numero de telefono<input type="number" name="numero" id="idnumero"></label><br>
            <label>Ingrese su especialidad</label><br>
            <select name="especialidad">
                <option value="">Seleccione su Especialidad</option>
                <%
                     //creamos la conexion
                Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/institucion", "root", "");
                

                PreparedStatement ps = (PreparedStatement)con.prepareStatement("select id_profesion, nombre_profesion from tbl_profesion");//preparamos la consulta
                ResultSet rs = ps.executeQuery();//ejecutamos la consulta
                while(rs.next()){                        
                        
                    String id_profesion =  rs.getString(1); // recupero la columna de indice 0
                    String nombre_profesion = rs.getString(2); // recupero la columna de indice 1
                    out.println("<option value="+id_profesion+"> "+nombre_profesion+" </option>"); 
                }
                %>
            </select><br>
            <input type="submit" value="Registrar">
            
        </form>
    </body>
</html>
<%-- 
    Document   : menu
    Created on : 17-ago-2018, 23:35:37
    Author     : Cristian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%
  HttpSession objsesion = request.getSession(false);
    String usuario = (String)objsesion.getAttribute("rut");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="right">
        <a href="cerrar.jsp">Cerrar sesion</a>
        </div>
        <h1>Bienvenido <%out.println(usuario); %></h1>
        <%
        Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/institucion", "root", "");
                

                PreparedStatement ps = (PreparedStatement)con.prepareStatement("SELECT pr.rut, pr.nombre, pr.apellido_pat, ca.nombre_campus, sa.nmro_sala, sa.apertura_sala, sa.cierre_sala FROM tbl_profesor pr, sala sa, campus ca WHERE ca.id_campus = sa.id_campus and sa.rut = pr.rut and pr.rut='"+usuario+"'");//preparamos la consulta
                ResultSet rs = ps.executeQuery();//ejecutamos la consulta
                                        
                  while(rs.next()){      
                    String rut =  rs.getString(1); // recupero la columna de indice 0
                    String nombre = rs.getString(2); // recupero la columna de indice 1
                    String apellido = rs.getString(3);
                    String nombre_campus = rs.getString(4);
                    int nmro_sala = rs.getInt(5);
                    String apertura = rs.getString(6);
                    String cierre = rs.getString(7);
                    out.println("<option value="+rut+">Nombre= "+nombre+", Apellido="+apellido+", Nombre Campus= " +nombre_campus+", Numero Sala= "+nmro_sala+", Apertura= "+apertura+", Cierre= "+cierre+"</option>"); 
                  }
                %>
    </body>
</html>

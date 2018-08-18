/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Cristian
 */
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Usuario {
 
 public static boolean agregarUsuario(tablausuario usuario){
  boolean agregado=false;
  try {
   Conexion c=new Conexion();
   Connection con=c.getConexion();
   if(con!=null){
    Statement st;
    st = con.createStatement();
    st.execute("INSERT INTO tbl_profesor VALUES ('"+usuario.getRut()+"','"+usuario.getNombre()+"','"+usuario.getApellido_pat()+"','"+usuario.getApellido_mat()+"','"+usuario.getTelefono()+"','"+usuario.getEspecialidad()+"')");
    agregado=true;
    st.close();
   }
   c.cerrarConexion();
  } catch (SQLException e) {
   agregado=false;
   e.printStackTrace();
  }
  return agregado;
 }
 
}
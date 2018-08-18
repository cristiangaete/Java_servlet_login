import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Cristian
 */
public class IniciarUsuario extends Conexion{
    
    public boolean autenticacion(String rut){
        PreparedStatement pst=null;
        ResultSet rs=null;
        
        try {
            String consulta = "SELECT * FROM tbl_profesor WHERE rut = ?";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, rut);
             rs = pst.executeQuery();
            
            if(rs.absolute(1)){
                return true;
            }
        } catch (Exception e) {
            System.err.println("ERROR" + e);
        }finally{
            try {
                if(getConexion() != null )getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR" + e);
            }
        }
        
    return false;
    }
    
   
}


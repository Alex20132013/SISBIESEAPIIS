/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author 2012
 */
public class CTipo_user  implements IEntidad
{
    PreparedStatement psSentencia=null;
    ResultSet rsdatos=null;
    Cmiconexion  connection=null;
    
    String nombre_tipo;
    String decrip_user;

    public CTipo_user(String nombre_tipo, String decrip_user) {
        this.nombre_tipo = nombre_tipo;
        this.decrip_user = decrip_user;
    }

    public CTipo_user() {
    }

    public String getDecrip_user() {
        return decrip_user;
    }

    public void setDecrip_user(String decrip_user) {
        this.decrip_user = decrip_user;
    }

    public String getNombre_tipo() {
        return nombre_tipo;
    }

    public void setNombre_tipo(String nombre_tipo) {
        this.nombre_tipo = nombre_tipo;
    }
    
    
    @Override
    public boolean InsertRegisto() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean DeleteRegistro() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean UpdateRegistro() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<Object[]> SelectDatos() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public ArrayList<Object[]> Select_tipoUser() throws Exception
    {
        ArrayList<Object[]> list_tipo=new ArrayList<Object[]>();
        connection=new Cmiconexion();
        String sql="SELECT id_tipo_usuario,nombre_tipo_usuario FROM t_tipo_usuario ";
        psSentencia=(PreparedStatement) connection.miconexion.prepareStatement(sql);        
        rsdatos=psSentencia.executeQuery();
        while (rsdatos.next()) 
        {            
         Object[] dato={rsdatos.getObject(1),rsdatos.getObject(2)};
         list_tipo.add(dato);
        }
 
       connection.miconexion.close();   
       psSentencia.close();
       rsdatos.close();
       
       return list_tipo;         
    
    }
    
    
    public ArrayList<Object[]>ListTipoUser(int tipo)throws  Exception
    {
       ArrayList<Object[]>tipo_list=new ArrayList<>();
       
       String sql="SELECT t_usuario.codigo_usuario,t_usuario.nombre_usuario,t_usuario.apellidos_usuario,t_usuario.correo_usuario,t_usuario.estado_usuario,t_usuario.huella_dg_usuario\n" +
                 " FROM t_tipo_usuario INNER JOIN t_usuario on (t_tipo_usuario.id_tipo_usuario=t_usuario.id_tipo_usuario) "
               + " ORDER BY t_usuario.codigo_usuario   and t_usuario.id_tipo_usuario="+tipo;
       
       connection=new Cmiconexion();
       
       psSentencia=connection.miconexion.prepareStatement(sql);
       rsdatos=psSentencia.executeQuery();
        while (rsdatos.next()) 
        {            
         Object[] dato={rsdatos.getObject(1),rsdatos.getObject(2)};
         tipo_list.add(dato);
        }
 
       connection.miconexion.close();   
       psSentencia.close();
       rsdatos.close();
       
    
     return tipo_list;
    }
    
    
    
}

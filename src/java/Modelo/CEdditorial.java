/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CEdditorial implements IEntidad
{
    Cmiconexion conection;
    PreparedStatement prStament=null;
    CallableStatement csProcemimientos=null;
    ResultSet  rsDatos=null;
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {
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
    public ArrayList<Object[]> SelectDatos() throws Exception 
    {
        ArrayList<Object[]> lista_editorial=new ArrayList<Object[]>();
        conection=new  Cmiconexion();
        String sql="SELECT id_editorial,nombre_editorial,web_editorial,direccion_editorial FROM t_editorial";
        prStament=conection.miconexion.prepareStatement(sql);
        
        rsDatos=prStament.executeQuery();
        
        while (rsDatos.next()) 
        {            
         Object[] registro={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4)};   
         lista_editorial.add(registro);
        }
        //cerrando las conexiones        
          conection.miconexion.close();
          prStament.close();
          rsDatos.close();
        
        
        return  lista_editorial;
    }
    
    
    public Object[] editar_editorial(int id_editorial)throws  Exception
    {
      String sql="SELECT id_editorial,nombre_editorial,web_editorial,direccion_editorial FROM t_editorial WHERE id_editorial="+id_editorial;
        conection=new Cmiconexion();
        prStament=conection.miconexion.prepareStatement(sql);
        
        rsDatos= prStament.executeQuery();
        if (rsDatos.next()) 
        {
          Object[] usuario={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4)};
          //cerrando las conexion
          conection.miconexion.close();
          prStament.close();
          rsDatos.close();
          
          return usuario;
        }
        
        //cerrando las conexion
          conection.miconexion.close();
          prStament.close();
          rsDatos.close();
          
        return  null;  
    
    }
    
}

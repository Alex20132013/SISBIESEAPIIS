/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CEditorial implements IEntidad
{
    PreparedStatement psSentencia=null;
    CallableStatement csProcedure=null;
    ResultSet         rsDatos=null;
    Cmiconexion       conection;
    int id_editorial;
    String nombre_editorial;
    String webEditrial;
    String direccionEditorial;

    public CEditorial(String nombre_editorial, String webEditrial, String direccionEditorial) {
        this.nombre_editorial = nombre_editorial;
        this.webEditrial = webEditrial;
        this.direccionEditorial = direccionEditorial;
    }

    public CEditorial( int id_editorial, String nombre_editorial, String webEditrial, String direccionEditorial) {
        this.conection = conection;
        this.id_editorial = id_editorial;
        this.nombre_editorial = nombre_editorial;
        this.webEditrial = webEditrial;
        
    }
    

    public CEditorial() {
    }

    public String getDireccionEditorial() {
        return direccionEditorial;
    }

    public void setDireccionEditorial(String direccionEditorial) {
        this.direccionEditorial = direccionEditorial;
    }

    public int getId_editorial() {
        return id_editorial;
    }

    public void setId_editorial(int id_editorial) {
        this.id_editorial = id_editorial;
    }

    public String getNombre_editorial() {
        return nombre_editorial;
    }

    public void setNombre_editorial(String nombre_editorial) {
        this.nombre_editorial = nombre_editorial;
    }

    public String getWebEditrial() {
        return webEditrial;
    }

    public void setWebEditrial(String webEditrial) {
        this.webEditrial = webEditrial;
    }
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {
      conection=new Cmiconexion();
      String sql="INSERT INTO t_editorial  VALUES (null,'"+this.getNombre_editorial()+"','"+this.getWebEditrial()+"','"+this.getDireccionEditorial()+"')";
      psSentencia=conection.miconexion.prepareStatement(sql);
      
      int bandera=psSentencia.executeUpdate();
      
      //cerrando las conexiones
      conection.miconexion.close(); 
      psSentencia.close();
      rsDatos.close();
        if (bandera==1) 
        {
            
            return  true;
            
        }
        
      return  false;
    }

    @Override
    public boolean DeleteRegistro() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean UpdateRegistro() throws Exception 
    {
        conection=new Cmiconexion();
      String sql="UPDATE t_editorial SET nombre_editorial='"+this.getNombre_editorial()+"',web_editorial='"+this.getWebEditrial()+"',direccion_editorial='"+this.getDireccionEditorial()+"'"+ 
                   " WHERE id_editorial="+this.getId_editorial();
      psSentencia=conection.miconexion.prepareStatement(sql);
      
      int bandera=psSentencia.executeUpdate();
      
      //cerrando las conexiones
      conection.miconexion.close(); 
      psSentencia.close();
      rsDatos.close();
      
        if (bandera==1 ) 
        {
             
            return  true;
            
        }
        
      return  false;
    }

    @Override
    public ArrayList<Object[]> SelectDatos() throws Exception 
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public ArrayList<Object[]> SelectEditorial() throws Exception 
    {
        ArrayList<Object[]> slcEditorial=new ArrayList<Object[]>();
        
        conection=new Cmiconexion();
        String sql="SELECT id_editorial,nombre_editorial FROM t_editorial";
        psSentencia=(PreparedStatement) conection.miconexion.prepareStatement(sql);        
        rsDatos=psSentencia.executeQuery();
        
        while (rsDatos.next()) 
        {
            Object[] dato ={rsDatos.getObject(1),rsDatos.getObject(2)};
            slcEditorial.add(dato);
        }
        conection.miconexion.close();
        psSentencia.close();
        rsDatos.close();
        
        return slcEditorial;
        
    }
    
    
}

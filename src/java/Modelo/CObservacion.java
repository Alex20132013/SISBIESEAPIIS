/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Eapiis_Server
 */
public class CObservacion implements IEntidad
{
    CallableStatement csProcedimeiento=null;
    PreparedStatement psSentencia=null;
    ResultSet         rsDatos=null;
    Cmiconexion conecction=null;
    
   int nrObserv;
    String codigo_prestamo;
    String descripcion;

    public CObservacion( String codigo_prestamo, String descripcion) {
       
        this.codigo_prestamo = codigo_prestamo;
        this.descripcion = descripcion;
    }

    public int getNrObserv() {
        return nrObserv;
    }

    public void setNrObserv(int nrObserv) {
        this.nrObserv = nrObserv;
    }

    public CObservacion() 
    {
        
    }
    

   

    public String getCodigo_prestamo() {
        return codigo_prestamo;
    }

    public void setCodigo_prestamo(String codigo_prestamo) {
        this.codigo_prestamo = codigo_prestamo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) 
    {
        this.descripcion = descripcion;
    }
    
    
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {
        
        
        conecction=new Cmiconexion();
        
        csProcedimeiento=conecction.miconexion.prepareCall("CALL pr_reg_observacion(?,?)");
       
        csProcedimeiento.setString(1, this.getCodigo_prestamo());
        csProcedimeiento.setString(2, this.getDescripcion());
        int bandera=csProcedimeiento.executeUpdate();

        //cerrando las conexiones 
        
        conecction.miconexion.close();
        csProcedimeiento.close();
        if (bandera==1) 
        {
            return true;
        }
       
        
        
    
     return false;
    }

    @Override
    public boolean DeleteRegistro() throws Exception 
    {
       
        String sql="DELETE FROM t_observacion WHERE codigo_observacion="+this.getNrObserv();
         
        conecction=new Cmiconexion();
        psSentencia=conecction.miconexion.prepareStatement(sql);
        
        int bandera=psSentencia.executeUpdate();

        //cerrando las conexiones 
        
        conecction.miconexion.close();
        psSentencia.close();
        if (bandera==1) 
        {
            return true;
        }
       
        
        
    
     return false;
    }

    @Override
    public boolean UpdateRegistro() throws Exception 
    {
        
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    
    
    }

    @Override
    public ArrayList<Object[]> SelectDatos() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private int  NumerObservacion()throws Exception
    {
      String sql="SELECT COUNT(*) AS contador FROM t_observacion ";
      conecction=new Cmiconexion();      
      psSentencia=conecction.miconexion.prepareStatement(sql);
      rsDatos=psSentencia.executeQuery();
      
      int contador=0;
        while (rsDatos.next()) 
        {            
           contador=rsDatos.getInt(1);
        }
      //cerrando las conexines 
        conecction.miconexion.close();
        psSentencia.close();
        rsDatos.close();
      
      
    return contador;
    
    }
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Eapiis_Server
 */
public class CSancion implements IEntidad
{
    Cmiconexion conecction=null;
    CallableStatement csProcedimeiento=null;
    PreparedStatement psSentencia=null;
    ResultSet         rsDatos=null;
    
    BigDecimal cod_user;
    
  
    int condigo_sancion;
    String fecha_caducidad;

    public CSancion(int condigo_sancion, String fecha_caducidad) {
        this.condigo_sancion = condigo_sancion;
        this.fecha_caducidad = fecha_caducidad;
    }

    public int getCondigo_sancion() {
        return condigo_sancion;
    }

    public void setCondigo_sancion(int condigo_sancion) {
        this.condigo_sancion = condigo_sancion;
    }

    public String getFecha_caducidad() {
        return fecha_caducidad;
    }

    public void setFecha_caducidad(String fecha_caducidad) {
        this.fecha_caducidad = fecha_caducidad;
    }
    

    public CSancion(BigDecimal cod_user) {
        this.cod_user = cod_user;
    }

    public CSancion() {
    }

    public BigDecimal getCod_user() {
        return cod_user;
    }

    public void setCod_user(BigDecimal cod_user) {
        this.cod_user = cod_user;
    }
    
    
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {conecction=new Cmiconexion();
        
        csProcedimeiento=conecction.miconexion.prepareCall("CALL pr_reg_sancion(?)");
        csProcedimeiento.setBigDecimal(1, this.getCod_user());
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
    public boolean DeleteRegistro() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean UpdateRegistro() throws Exception 
    {
        String sql="UPDATE t_sancion SET fecha_fin='"+this.getFecha_caducidad()+"' WHERE codigo_saccion="+this.getCondigo_sancion();
        
        conecction=new Cmiconexion();
        psSentencia=conecction.miconexion.prepareStatement(sql);
        
        int bandera=psSentencia.executeUpdate();
        
        //cerrando las conexionbes 
        conecction.miconexion.close();
        psSentencia.close();
        
        if (bandera==1) 
        {
            return true;
        }
       
        
        
    
     return false;
        
        
        
    }

    @Override
    public ArrayList<Object[]> SelectDatos() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

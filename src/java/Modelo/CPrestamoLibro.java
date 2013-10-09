/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CPrestamoLibro  implements IEntidad
{
    Cmiconexion conection;
    PreparedStatement prStament=null;
    CallableStatement cbProcemimientos=null;
    ResultSet  rsDatos=null;
   
   private String codPrestamo; 
   private BigDecimal codigo_user;
   private String codigo_barra;
   private int  lugar_prestamo;
   private String fecha_prestamo;
   private String codbibliotecario;

    public CPrestamoLibro() {
    }

   
    public CPrestamoLibro(BigDecimal codigo_user, String codigo_barra, int lugar_prestamo, String fecha_prestamo, String codbibliotecario) {
        this.codigo_user = codigo_user;
        this.codigo_barra = codigo_barra;
        this.lugar_prestamo = lugar_prestamo;
        this.fecha_prestamo = fecha_prestamo;
        this.codbibliotecario = codbibliotecario;
    }

    public String getCodPrestamo() {
        return codPrestamo;
    }

    public void setCodPrestamo(String codPrestamo) {
        this.codPrestamo = codPrestamo;
    }

    
    public String getCodbibliotecario() {
        return codbibliotecario;
    }

    public void setCodbibliotecario(String codbibliotecario) {
        this.codbibliotecario = codbibliotecario;
    }

    public String getCodigo_barra() {
        return codigo_barra;
    }

    public void setCodigo_barra(String codigo_barra) {
        this.codigo_barra = codigo_barra;
    }

    public BigDecimal getCodigo_user() {
        return codigo_user;
    }

    public void setCodigo_user(BigDecimal codigo_user) {
        this.codigo_user = codigo_user;
    }

    public String getFecha_prestamo() {
        return fecha_prestamo;
    }

    public void setFecha_prestamo(String fecha_prestamo) {
        this.fecha_prestamo = fecha_prestamo;
    }

    public int getLugar_prestamo() {
        return lugar_prestamo;
    }

    public void setLugar_prestamo(int lugar_prestamo) {
        this.lugar_prestamo = lugar_prestamo;
    }

    

   
   
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {
        conection=new Cmiconexion();
        cbProcemimientos=conection.miconexion.prepareCall("CALL pr_regPrestamo(?,?,?,?,?)");
        
        cbProcemimientos.setBigDecimal(1, this.getCodigo_user());
        cbProcemimientos.setString(2, this.getCodigo_barra());        
        cbProcemimientos.setString(3, this.getFecha_prestamo());
        cbProcemimientos.setInt(4, getLugar_prestamo());
        cbProcemimientos.setString(5, this.getCodbibliotecario());
        
        int bandera=cbProcemimientos.executeUpdate();
        
           conection.miconexion.close();
           cbProcemimientos.close();
           //rsDatos.close();
        
        if (bandera==1) 
        {
          return true;   
        }
        
     
        
        return false;
    }

    @Override
    public boolean DeleteRegistro() throws Exception 
    {
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
    
    public Object[] ViewPrestamo(String barcode,String fechactual) throws Exception
    {
      conection=new Cmiconexion();      
      
      cbProcemimientos=conection.miconexion.prepareCall("CALL pr_DetallePrestamo(?,?)");
      cbProcemimientos.setString(1,barcode);
      cbProcemimientos.setString(2, fechactual);
      
      rsDatos=cbProcemimientos.executeQuery();
       
        while (rsDatos.next()) 
        {
          
          Object[]registro={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7),
          fechactual};
          
          //cerrando las conexiones          
          conection.miconexion.close();
          cbProcemimientos.close();
          rsDatos.close();
                  
          return registro;
        }
        
        //cerrando las conexiones          
          conection.miconexion.close();
          cbProcemimientos.close();
          rsDatos.close();
        
        return null;
    }
    
    
    public boolean DevueltoLibro(String fecha_dev )throws SQLException,Exception   
       {
        conection=new Cmiconexion();        
//        String sql="UPDATE t_prestamo_libro SET  estado_prestamo='0',  fecha_devolucion='"+fecha_dev+"'" +
//                   "  WHERE codigo_prestamo='"+this.getCodPrestamo()+"'";
        
        cbProcemimientos=conection.miconexion.prepareCall("CALL pr_reg_Devolucion(?,?)");
        cbProcemimientos.setString(1, this.getCodigo_barra());
        cbProcemimientos.setString(2, fecha_dev);
        
        //prStament=conection.miconexion.prepareStatement(sql);        
        int devuelto=cbProcemimientos.executeUpdate();
        
        //cerrando las conexiones          
          conection.miconexion.close();
          cbProcemimientos.close();
          //rsDatos.close();
        
        
           if (devuelto==1) 
           {
               
               return  true;
              
           }
    
        
        return false;
    }

    
    public boolean  VerificarDevuelto(BigDecimal cod_usuario) throws Exception
    {
        String sql="SELECT COUNT(*)AS contador FROM t_temp_prestamo WHERE codigo_usuario="+cod_usuario;
        
        conection=new Cmiconexion();
        prStament=conection.miconexion.prepareStatement(sql);        
        rsDatos=prStament.executeQuery();
        int dato=0;
        while (rsDatos.next()) 
        {
            dato=rsDatos.getInt(1);
        }
        
       //cerrando las conexiones          
          conection.miconexion.close();
          prStament.close();
          rsDatos.close();
          
        if (dato==1) 
        {
            return true;
        }
        
       return false;
    }
}

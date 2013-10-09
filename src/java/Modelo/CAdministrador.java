/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;


public class CAdministrador implements IEntidad
{
    Cmiconexion connection=null;
    PreparedStatement psSentencia=null;
    CallableStatement csProcedure=null;
    ResultSet rsDatos=null;
  
    private BigDecimal cod_user;   
    private String nombre_admin;
    private String apellidos_admin;    
    private String correo_admin;
    private String paswd;
    private boolean    estado;
    private char categoria;
    private String fech_venc;

    public CAdministrador(BigDecimal cod_user, String nombre_admin, String apellidos_admin, String correo_admin, String paswd, boolean estado, char categoria,String fech_venc) {
        this.cod_user = cod_user;
        this.nombre_admin = nombre_admin;
        this.apellidos_admin = apellidos_admin;
        this.correo_admin = correo_admin;
        this.paswd = paswd;
        this.estado = estado;
        this.categoria = categoria;
        this.fech_venc=fech_venc;
    }

    public CAdministrador() {
    }
    

    public String getApellidos_admin() {
        return apellidos_admin;
    }

    public void setApellidos_admin(String apellidos_admin) {
        this.apellidos_admin = apellidos_admin;
    }

    public char getCategoria() {
        return categoria;
    }

    public void setCategoria(char categoria) {
        this.categoria = categoria;
    }

    public BigDecimal getCod_user() {
        return cod_user;
    }

    public void setCod_user(BigDecimal cod_user) {
        this.cod_user = cod_user;
    }

    public Cmiconexion getConnection() {
        return connection;
    }

    public void setConnection(Cmiconexion connection) {
        this.connection = connection;
    }

    public String getCorreo_admin() {
        return correo_admin;
    }

    public void setCorreo_admin(String correo_admin) {
        this.correo_admin = correo_admin;
    }

    public boolean isEstado() 
    {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getFech_venc() {
        return fech_venc;
    }

    public void setFech_venc(String fech_venc) {
        this.fech_venc = fech_venc;
    }

   

    public String getNombre_admin() {
        return nombre_admin;
    }

    public void setNombre_admin(String nombre_admin) {
        this.nombre_admin = nombre_admin;
    }

    public String getPaswd() {
        return paswd;
    }

    public void setPaswd(String paswd) {
        this.paswd = paswd;
    }

    public PreparedStatement getPsSentencia() {
        return psSentencia;
    }

    public void setPsSentencia(PreparedStatement psSentencia) {
        this.psSentencia = psSentencia;
    }

    public ResultSet getRsDatos() {
        return rsDatos;
    }

    public void setRsDatos(ResultSet rsDatos) {
        this.rsDatos = rsDatos;
    }
    
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {
       connection=new Cmiconexion();
       csProcedure=(CallableStatement) connection.miconexion.prepareCall("CALL pr_reg_administrador(?,?,?,?,?,?,?,?)");
       csProcedure.setBigDecimal(1, this.getCod_user());
       csProcedure.setString(2, this.getNombre_admin());
       csProcedure.setString(3, this.getApellidos_admin());
       csProcedure.setString(4, this.getCorreo_admin());
       csProcedure.setString(5, this.getPaswd());
       csProcedure.setBoolean(6, this.isEstado());
       csProcedure.setString(7, String.valueOf(this.getCategoria()));        
       csProcedure.setString(8, this.getFech_venc());
       
       int bandera=csProcedure.executeUpdate();
       //Cerrado la conexion a la base de datos
       connection.miconexion.close();
       csProcedure.close();
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
        connection=new Cmiconexion();
        csProcedure=connection.miconexion.prepareCall("CALL pr_Update_administrador(?,?,?,?,?,?,?,?) "); 
        csProcedure.setBigDecimal(1, this.getCod_user());
        csProcedure.setString(2, this.getNombre_admin());
        csProcedure.setString(3, this.getApellidos_admin());
        csProcedure.setString(4, this.getCorreo_admin());
        csProcedure.setString(5, this.getPaswd());
        csProcedure.setBoolean(6, this.isEstado());
        csProcedure.setString(7, String.valueOf(this.getCategoria()));        
        csProcedure.setString(8, this.getFech_venc());
        
        int bandera=csProcedure.executeUpdate();
        //Cerrando la conexion a la base datos
        connection.miconexion.close();
        csProcedure.close();
        if (bandera==1) 
        {
         return true;   
        }
        
        return false;
    }

    @Override
    public ArrayList<Object[]> SelectDatos() throws Exception 
    {
        ArrayList<Object[]> adms=new ArrayList<Object[]>();
        
        String sql="SELECT cod_administrador,nombre_administrador,correo_admin,estado_admi,categoria_admi,fecha_reg,fecha_ven FROM t_administrador "+
                                 " WHERE categoria_admi='"+this.getCategoria()+"'";
        
       // String sql="SELECT cod_administrador,nombre_administrador,correo_admin,estado_admi,categoria_admi,fecha_reg,fecha_ven FROM t_administrador ";
        connection=new Cmiconexion();
        psSentencia=connection.miconexion.prepareStatement(sql);
        rsDatos=psSentencia.executeQuery();
        while (rsDatos.next()) 
        {            
            Object[] dato={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7)};
            adms.add(dato);
        }
        //cerrando la conexiones 
        connection.miconexion.close();
        psSentencia.close();
        rsDatos.close();
        //retornando lista de administradores
        return adms;
    }
    
    public Object[]user(String id_user,String pwr)throws Exception
    {
      String sql="SELECT categoria_admi,correo_admin,nombre_administrador,cod_administrador FROM t_administrador "+
                 " WHERE correo_admin='"+id_user+"' AND  password_admi=PASSWORD('"+pwr+"') AND estado_admi<>0";
        connection=new Cmiconexion();
        psSentencia=connection.miconexion.prepareStatement(sql);
        
        rsDatos=psSentencia.executeQuery();
        if (rsDatos.next()) 
        {
          Object[] usuario={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4)};
          //Cerrando las conexiones a la base datos
          connection.miconexion.close();
          psSentencia.close();          
          rsDatos.close();
          
          //retornado el usuario buscado
          return usuario;
        }
        
        //Cerrando las conexiones a la base datos
          connection.miconexion.close();
          psSentencia.close();          
          rsDatos.close();
        
        
        return  null;
    
    }
    
     public Object[]EditarUser(BigDecimal codigo)throws Exception
    {
      String sql="SELECT cod_administrador,nombre_administrador,apellidos_administrador,"+
                         "correo_admin,estado_admi,categoria_admi,fecha_reg,fecha_ven FROM t_administrador "+
                     " WHERE cod_administrador="+codigo;
        connection=new Cmiconexion();
        psSentencia=connection.miconexion.prepareStatement(sql);
        
        rsDatos=psSentencia.executeQuery();
        if (rsDatos.next()) 
        {
          Object[] usuario={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7),rsDatos.getObject(8)};
        //Cerrando las conexiones a la base datos
          connection.miconexion.close();
          psSentencia.close();          
          rsDatos.close();
          return usuario;
        }
        //Cerrando las conexiones a la base datos
          connection.miconexion.close();
          psSentencia.close();          
          rsDatos.close();
          
        return  null;
    
    }
     
   public int DeleteAdministrador(BigDecimal d) throws Exception
   {
       String sql="DELETE  FROM t_administrador WHERE cod_administrador="+d;
       connection=new Cmiconexion();
       psSentencia=connection.miconexion.prepareStatement(sql);
       
       int bandera=psSentencia.executeUpdate();
       
       //Cerrando las conexiones a la base datos
          connection.miconexion.close();
          psSentencia.close();          
         
       
       return  bandera;
   }
     
    
}

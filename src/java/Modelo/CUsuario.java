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
 * @author 2012
 */
public class CUsuario implements IEntidad
{
  CallableStatement csProcedure=null;
 // Cmiconexion connection=null;
  PreparedStatement psSentencia=null;
  ResultSet rsDatos=null;
  
    
  private BigDecimal cod_user;
  private int tipo_user;
  private String nombre_user;
  private String apellidos_user;
  private String direccion;
  private String correo;
  private String paswd;
  private byte    estado;
  private String huella;

    public CUsuario(BigDecimal cod_user, int tipo_user, String nombre_user, String apellidos_user, String direccion, String correo, String paswd, byte estado, String huella) 
    {
        this.cod_user = cod_user;
        this.tipo_user = tipo_user;
        this.nombre_user = nombre_user;
        this.apellidos_user = apellidos_user;
        this.direccion = direccion;
        this.correo = correo;
        this.paswd = paswd;
        this.estado = estado;
        this.huella = huella;
    }

    public CUsuario(BigDecimal cod_user, int tipo_user, String nombre_user, String apellidos_user, String direccion, String correo, String paswd) {
        this.cod_user = cod_user;
        this.tipo_user = tipo_user;
        this.nombre_user = nombre_user;
        this.apellidos_user = apellidos_user;
        this.direccion = direccion;
        this.correo = correo;
        this.paswd = paswd;
    }
    

    public CUsuario() 
    {
    }

    

    public String getApellidos_user() {
        return apellidos_user;
    }

    public void setApellidos_user(String apellidos_user) {
        this.apellidos_user = apellidos_user;
    }

    public BigDecimal getCod_user() {
        return cod_user;
    }

    public void setCod_user(BigDecimal cod_user) {
        this.cod_user = cod_user;
    }

    

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public CallableStatement getCsProcedure() {
        return csProcedure;
    }

    public void setCsProcedure(CallableStatement csProcedure) {
        this.csProcedure = csProcedure;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public byte getEstado() {
        return estado;
    }

    public void setEstado(byte estado) {
        this.estado = estado;
    }

    public String getHuella() {
        return huella;
    }

    public void setHuella(String huella) {
        this.huella = huella;
    }

    public String getNombre_user() {
        return nombre_user;
    }

    public void setNombre_user(String nombre_user) {
        this.nombre_user = nombre_user;
    }

    public String getPaswd() {
        return paswd;
    }

    public void setPaswd(String paswd) {
        this.paswd = paswd;
    }

    public int getTipo_user() {
        return tipo_user;
    }

    public void setTipo_user(int tipo_user) {
        this.tipo_user = tipo_user;
    }


    

  
  
    @Override
    public boolean InsertRegisto() throws Exception {
       Cmiconexion connection=new Cmiconexion(); 
       csProcedure=(CallableStatement) connection.miconexion.prepareCall("CALL pr_reg_usuario(?,?,?,?,?,?,?) "); 
       csProcedure.setBigDecimal(1, this.getCod_user());
       csProcedure.setInt(2, this.getTipo_user());
       csProcedure.setString(3, this.getNombre_user());
       csProcedure.setString(4, this.getApellidos_user());
       csProcedure.setString(5, this.getDireccion());
       csProcedure.setString(6, this.getCorreo());
       csProcedure.setString(7, this.getPaswd());
       
       int bandera=csProcedure.executeUpdate();
       
       //cerrando las conexiones
       connection.miconexion.close();
       csProcedure.close();
       
       
       
        if (bandera==1) 
        {
          return  true;   
        }
       return false;
    }

    @Override
    public boolean DeleteRegistro() throws Exception 
    {
        String sql="DELETE FROM t_usuario WHERE codigo_usuario="+this.getCod_user();
         Cmiconexion connection =new Cmiconexion();
         psSentencia=connection.miconexion.prepareStatement(sql);
         
         int bandera=psSentencia.executeUpdate();
         
         if(bandera==1)
         {
          connection.miconexion.close();
          psSentencia.close();
           return true;
         }
       
          connection.miconexion.close();
          psSentencia.close();
          
          return false;
    }

    @Override
    public boolean UpdateRegistro() throws Exception 
    {
        Cmiconexion connection =new Cmiconexion();
        csProcedure=connection.miconexion.prepareCall("CALL pr_UpdateUserEdit(?,?,?,?,?,?,?)");
        
       csProcedure.setBigDecimal(1, this.getCod_user());
       csProcedure.setInt(2, this.getTipo_user());
       csProcedure.setString(3, this.getNombre_user());
       csProcedure.setString(4, this.getApellidos_user());
       csProcedure.setString(5, this.getDireccion());
       csProcedure.setString(6, this.getCorreo());
       csProcedure.setString(7, this.getPaswd());
       
       int bandera=csProcedure.executeUpdate();
       
       //cerrando las conexiones
       
       connection.miconexion.close();
       csProcedure.close();
       
       
       
        if (bandera==1) 
        {
          return  true;   
        }
       return false;
    }

    //Funcion para lista a todod loos usiuarios del sistema///////////////////// 
    @Override    
    public ArrayList<Object[]> SelectDatos() throws Exception 
    {
        ArrayList<Object[]> lista=new ArrayList<Object[]>();
        Cmiconexion connection=new Cmiconexion();
        String sql="";
        if (this.getTipo_user()==0) 
        {
           sql="SELECT codigo_usuario,nombre_usuario,apellidos_usuario,correo_usuario,estado_usuario,huella_dg_usuario" +
                    " FROM t_usuario  ORDER BY codigo_usuario";
            
        }
        else
        {
           sql="SELECT codigo_usuario,nombre_usuario,apellidos_usuario,correo_usuario,estado_usuario,huella_dg_usuario" +
                    " FROM t_usuario  WHERE id_tipo_usuario="+this.getTipo_user();
        
        
        }
        
        psSentencia=connection.miconexion.prepareStatement(sql);
        rsDatos=psSentencia.executeQuery();
        while (rsDatos.next()) 
        {
            Object[] registro ={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6) };
            lista.add(registro);
        }
        
        //cerrando las conexiones
        connection.miconexion.close();
        psSentencia.close();
        rsDatos.close();
        
        return lista;
    }
    
    
    public Object[]user(String id_user,String pwr)throws Exception
    {
       String sql="SELECT id_tipo_usuario,nombre_usuario,correo_usuario,estado_usuario FROM t_usuario "+
              " WHERE correo_usuario='"+id_user+"' AND password_usuario=PASSWORD('"+pwr+"')";
        Cmiconexion connection=new Cmiconexion();
        psSentencia=(PreparedStatement) connection.miconexion.prepareStatement(sql);
       
        rsDatos=psSentencia.executeQuery();
        while (rsDatos.next()) 
        {
          Object[] usuario={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4)};
          connection.miconexion.close();
          
          //cerrando las conexiones
          connection.miconexion.close();
          psSentencia.close();
          rsDatos.close();
          
          return usuario;
        }
        
        //cerrando las conexiones
        connection.miconexion.close();
        psSentencia.close();
        rsDatos.close();
        
        return  null;
    
    }
    public Object[] editar_user(BigDecimal codigo)throws Exception
    {
        Cmiconexion connection=new Cmiconexion();
        csProcedure=connection.miconexion.prepareCall("CALL pr_DetalleUser(?)");
        csProcedure.setBigDecimal("codigo", codigo); 
        rsDatos=csProcedure.executeQuery();
        
        while (rsDatos.next()) 
        {
          Object[] usuario={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4)
          ,rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7),rsDatos.getObject(8),rsDatos.getObject(9),rsDatos.getObject(10)};
                   
          //cerrando las conexiones
          connection.miconexion.close();
          csProcedure.close();
          rsDatos.close();
          
          
          return usuario;
        }
        
        //cerrando las conexiones
          connection.miconexion.close();
          csProcedure.close();
          rsDatos.close();
          
        
        return  null;
    
      
    
    }
    
   public boolean HalitarUser(int codigo,boolean estado ) throws Exception
    {
        
      Cmiconexion connection=new  Cmiconexion();
      
      String sql="" ;
        if (estado) 
        {
            sql="UPDATE  t_usuario SET  estado_usuario =  '"+1+"' WHERE  codigo_usuario="+codigo ;
        }
        else
        {
           sql="UPDATE  t_usuario SET  estado_usuario =  '"+0+"' WHERE  codigo_usuario ="+codigo ;
        }
      psSentencia= connection.miconexion.prepareStatement(sql);
      int bandera=psSentencia.executeUpdate();
      
      //cerrando las conexiobes
      connection.miconexion.close();
      psSentencia.close();
      
        if (bandera==1) 
        {
         return true;    
        }
        return false;
    }    
  
  //Funcion para lista todo los usuarios inhabiltados 
public ArrayList<Object[]> lstUsersInhabiltados() throws  Exception
{
   String sql="SELECT  codigo_usuario,nombre_usuario,apellidos_usuario,huella_dg_usuario,estado_usuario,fecha_registro FROM t_usuario WHERE estado_usuario=0 ";
   Cmiconexion connection=new  Cmiconexion();   
   ArrayList<Object[]> lstUserstemp=new ArrayList<Object[]>();
           
   psSentencia=connection.miconexion.prepareStatement(sql);
   rsDatos=psSentencia.executeQuery();
    while (rsDatos.next() ) 
    {        
        Object[] registro={rsDatos.getInt(1),rsDatos.getInt(2),rsDatos.getInt(3),rsDatos.getInt(4),rsDatos.getInt(5),rsDatos.getInt(6)};
        lstUserstemp.add(registro);
        
    }
    
     //cerrando las conexiones
      connection.miconexion.close();
      psSentencia.close();
      rsDatos.close();
          
           
 return lstUserstemp;
}
   

public int tipo_user()throws Exception
{
   String sql="select t_tipo_usuario.id_tipo_usuario from t_tipo_usuario,t_usuario " +
              " WHERE t_tipo_usuario.id_tipo_usuario=t_usuario.id_tipo_usuario AND t_usuario.codigo_usuario="+this.getCod_user();
   
   Cmiconexion conection=new Cmiconexion();
   psSentencia=conection.miconexion.prepareStatement(sql);
   rsDatos=psSentencia.executeQuery();
   int tipo_usuario=0;
    while (rsDatos.next()) 
    {        
       tipo_usuario=rsDatos.getInt(1);
    }
   
    //cerrando las conexiones
     conection.miconexion.close();
     psSentencia.close();
     rsDatos.close();
          
           
return tipo_usuario;
}




public boolean Validar_usuario()throws Exception
{
    String sql="SELECT t_usuario.codigo_usuario,t_usuario.estado_usuario FROM t_usuario " +
               "WHERE t_usuario.codigo_usuario="+this.getCod_user();
    Cmiconexion conection=new Cmiconexion();
    psSentencia=conection.miconexion.prepareStatement(sql);    
    rsDatos=psSentencia.executeQuery();
    
  
    Object[] validado=new Object[2];
    
    while (rsDatos.next()) 
    {
       validado[0]=rsDatos.getObject(1);
       validado[1]=rsDatos.getObject(2);
       
        
    }
    //cerrando ola conexion
    conection.miconexion.close();
    psSentencia.close();
    rsDatos.close();
    
    if (validado[0]!=null && validado[1]!=null ) 
    {
        boolean estado_user=Boolean.parseBoolean(validado[1].toString());
        
        if(estado_user)
        {
            return true;
        
        }
        
    }
    

  return  false;
          
}


//funcion para autenticar el el usuariuo registrasdo en el sistema


    public Object[] Editar_usuario ()throws Exception
    {
        String sql="SELECT * FROM  t_usuario WHERE codigo_usuario="+this.getCod_user();
        Cmiconexion conection=new Cmiconexion();
        psSentencia=conection.miconexion.prepareStatement(sql);
        
        rsDatos=psSentencia.executeQuery();
        
        while (rsDatos.next()) 
        {
            
          Object[]registro={rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),
          rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7),rsDatos.getObject(8),rsDatos.getObject(9),rsDatos.getObject(10)};  
            
          conection.miconexion.close();
          psSentencia.close();
          rsDatos.close();
          
           return registro;
          
        }
        
        //cerrando la conexion
        
          conection.miconexion.close();
          psSentencia.close();
          rsDatos.close();
        
        return  null;
    }
 public boolean Habitado_userRegistrado(BigDecimal codigo_user,String huellaDigital,String nombre,String apellidos,String correo,boolean estado)throws Exception
 {
   Cmiconexion connection=new  Cmiconexion();
   String  sql="";
     if (estado) 
     {
      sql="UPDATE  t_usuario SET nombre_usuario='"+nombre+"',apellidos_usuario='"+apellidos+"', correo_usuario='"+correo+"',huella_dg_usuario='"+huellaDigital +"', estado_usuario =  '"+1+"'  WHERE  codigo_usuario="+codigo_user ;
         
     }
     else
     {
     sql="UPDATE  t_usuario SET nombre_usuario='"+nombre+"',apellidos_usuario='"+apellidos+"', correo_usuario='"+correo+"',huella_dg_usuario='"+huellaDigital +"', estado_usuario =  '"+0+"'  WHERE  codigo_usuario="+codigo_user ;
     
     }
       
            
        
      psSentencia= connection.miconexion.prepareStatement(sql);
      int bandera=psSentencia.executeUpdate();      
      //cerrando las conexiobes
      connection.miconexion.close();
      psSentencia.close();
      
        if (bandera==1) 
        {
         return true;    
        }
        return false;
 
 }
    
 //METODO PARA GUARDAR LA AUCTUALIZACION DE DATOS DEL USUARIO
 public boolean Validar_Edicion_datos() throws Exception 
    {
        String sql="SELECT COUNT(*) as contador FROM t_usuario WHERE codigo_usuario="+this.getCod_user()+" "
                + " AND correo_usuario='"+this.getCorreo()+"'  AND password_usuario=PASSWORD('"+this.getPaswd()+"')";
        Cmiconexion connection =new Cmiconexion();
        psSentencia=connection.miconexion.prepareStatement(sql);
        
        rsDatos=psSentencia.executeQuery();
        
        int contador_registro=0;
        while (rsDatos.next()) 
        {            
          contador_registro=rsDatos.getInt(1);
        }
       
       //cerrando las conexiones
       
       connection.miconexion.close();
       psSentencia.close();
       rsDatos.close();
       
       
       
        if (contador_registro==1) 
        {
          return  true;   
        }
       return false;
    }
 
 
 
 //de prueba
 
 public ArrayList<Object[]> SelectDatosTipo(int tipo_user) throws Exception 
    {
        ArrayList<Object[]> lista=new ArrayList<Object[]>();
        Cmiconexion connection=new Cmiconexion();
        String sql="";
        if (tipo_user==0) 
        {
           sql="SELECT codigo_usuario,nombre_usuario,apellidos_usuario,correo_usuario,estado_usuario,huella_dg_usuario "+ 
                    " FROM t_usuario  ORDER BY codigo_usuario";
            
        }
        else
        {
           sql="SELECT codigo_usuario,nombre_usuario,apellidos_usuario,correo_usuario,estado_usuario,huella_dg_usuario "+ 
                    " FROM t_usuario  WHERE id_tipo_usuario="+tipo_user;
        
        
        }
        
        psSentencia=connection.miconexion.prepareStatement(sql);
        rsDatos=psSentencia.executeQuery();
        while (rsDatos.next()) 
        {
            Object[] registro ={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6) };
            lista.add(registro);
        }
        
        //cerrando las conexiones
        connection.miconexion.close();
        psSentencia.close();
        rsDatos.close();
        
        return lista;
    }
 
 
 
}

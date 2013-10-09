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
 * @author 2012
 */
public class CAutor implements IEntidad
{
   // Cmiconexion conecction=null;
    CallableStatement csProcedimeiento=null;
    PreparedStatement psSentencia=null;
    ResultSet         rsDatos=null;
    int idAutor;
    String nombre;
    String apellidos;
    String especialidad;

    public CAutor() 
    {
    }

    
    
    public CAutor(String nombre, String apellidos, String especialidad) 
    {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.especialidad = especialidad;
    }

    public int getIdAutor() 
    {
        return idAutor;
    }

    public void setIdAutor(int idAutor) 
    {
        this.idAutor = idAutor;
    }
    

   

    

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {
      Cmiconexion conecction=new Cmiconexion();
      csProcedimeiento=(CallableStatement) conecction.miconexion.prepareCall("CALL pr_reg_Autor(?,?,?)");      
      csProcedimeiento.setString(1, this.getNombre());
      csProcedimeiento.setString(2, this.getApellidos());
      csProcedimeiento.setString(3, this.getEspecialidad());
      
      int bandera=csProcedimeiento.executeUpdate();
      
      //liberando
      csProcedimeiento.close();
      conecction.miconexion.close();
      rsDatos.close();
      
      
        if (bandera==1) 
        {
           return true;   
        }
   
      
      return false;
    }

    @Override
    public boolean DeleteRegistro() throws Exception {
       
        Cmiconexion conecction=new Cmiconexion(); 
        String sql="DELETE FROM t_autor WHERE id_autor="+this.getIdAutor();
        
        psSentencia=(PreparedStatement) conecction.miconexion.prepareStatement(sql);
        
        int bandera=csProcedimeiento.executeUpdate();
      
        //cerrando las conexexiones
        conecction.miconexion.close();
        psSentencia.close();
        rsDatos.close();
        
        if (bandera==1) 
        {
           return true;   
        }
   
      
      return false;  
       
       
    }

    @Override
    public boolean UpdateRegistro() throws Exception 
    {
        Cmiconexion conecction=new Cmiconexion();
        csProcedimeiento=(CallableStatement) conecction.miconexion.prepareCall("CALL pr_Update_Autor(?,?,?)"); 
        csProcedimeiento.setInt(1, this.getIdAutor());
        csProcedimeiento.setString(2, this.getNombre());
        csProcedimeiento.setString(3, this.getApellidos());
        csProcedimeiento.setString(4, this.getEspecialidad());
        
        int bandera=csProcedimeiento.executeUpdate();
      
        //cerrando las conexexiones
        conecction.miconexion.close();
        csProcedimeiento.close();
        rsDatos.close();
        if (bandera==1) 
        {
             
           return true;   
        }
   
      
      return false;  
    }

    
    
    private String GenerarCodAutor() throws Exception
    {
       Cmiconexion conecction=new Cmiconexion();
       String sql="SELECT MAX(contador) FROM t_autor";
       int num=0;
       psSentencia=(PreparedStatement) conecction.miconexion.prepareStatement(sql);
       
       rsDatos=psSentencia.executeQuery();
        if (rsDatos.next()) 
        {
            num=Integer.parseInt( rsDatos.getObject(1).toString())  ;
        }
        //Cerrando las conexiones        
        conecction.miconexion.close();
        psSentencia.close();
        rsDatos.close();
        
     return "aut0"+(num+1);
     
    }

    @Override
    public ArrayList<Object[]> SelectDatos() 
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public ArrayList<Object[]> NombreAutor(String nombre) throws Exception
    {
        ArrayList<Object[]> autores=new ArrayList<Object[]>();
        
            String sql="SELECT id_autor, CONCAT(nombre_autor,' ' ,apellidos_autor,':',Profesion_autor) AS nombreautor FROM t_autor WHERE nombre_autor LIKE '"+nombre+"%' OR  apellidos_autor LIKE '"+nombre+"%' order by nombre_autor  asc";
           // String sql="SELECT * FROM alumno ";
            Cmiconexion conecction =new Cmiconexion();
           //alumnos 
            
            psSentencia=(PreparedStatement)  conecction.miconexion.prepareStatement(sql);
            
            rsDatos=psSentencia.executeQuery();
             while (rsDatos.next()) 
             {  
                 Object[] alumno={rsDatos.getObject(1),rsDatos.getObject(2)}; 
                 autores.add(alumno);
             }
     
             conecction.miconexion.close();
             psSentencia.close();
             rsDatos.close();
           
       
         return autores;
    }
    
    
     public Object[] BusquedaAutor(int codigo) throws Exception
    {
        Object[] autor=null;
        
            String sql="SELECT id_autor, nombre_autor,apellidos_autor,Profesion_autor  FROM t_autor WHERE id_autor="+codigo;
           // String sql="SELECT * FROM alumno ";
            Cmiconexion conecction =new Cmiconexion();
           //alumnos 
            
            psSentencia=(PreparedStatement) conecction.miconexion.prepareStatement(sql);
            
            rsDatos=psSentencia.executeQuery();
             while (rsDatos.next()) 
             {  
                 Object[] temp={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4)}; 
                 autor=temp;
             }
     
            conecction.miconexion.close();
            psSentencia.close();
            rsDatos.close();
           
       
         return autor;
    }
     
  public ArrayList<Object[]> lista_libros(int cod_autor) throws Exception
  {
      Cmiconexion conecction=new Cmiconexion();
      ArrayList<Object[]> list_libros=new ArrayList<Object[]>();
      csProcedimeiento=conecction.miconexion.prepareCall("CALL pr_BuscarLibro_Autor(?)");
      csProcedimeiento.setInt(1, cod_autor);      
      rsDatos=csProcedimeiento.executeQuery();
      
      while (rsDatos.next()) 
      {
          Object object[] = {rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),
          rsDatos.getObject(7),rsDatos.getObject(8),rsDatos.getObject(9)};
          list_libros.add(object);
      }
  
     conecction.miconexion.close();
     csProcedimeiento.close();
     rsDatos.close();
     
     return  list_libros;
  
  }
     
    
    
}

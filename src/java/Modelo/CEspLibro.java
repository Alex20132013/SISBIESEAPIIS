/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CEspLibro implements IEntidad
{
   // Cmiconexion conecction=null;//creando el objeto para instanciar
    PreparedStatement psSentencia=null;
    ResultSet rsDatos=null;
    CallableStatement csProcedure=null;
    String nombre_esp;
    String desp_esp;
    int id_esp;

    public CEspLibro(String nombre_esp, String desp_esp, int id_esp) {
        this.nombre_esp = nombre_esp;
        this.desp_esp = desp_esp;
        this.id_esp = id_esp;
    }

    
    public int getId_esp() {
        return id_esp;
    }

    public void setId_esp(int id_esp) {
        this.id_esp = id_esp;
    }

    public CEspLibro() 
    {
        
    }
    

    public CEspLibro(String nombre_esp, String desp_esp) {
        this.nombre_esp = nombre_esp;
        this.desp_esp = desp_esp;
    }

    public String getDesp_esp() {
        return desp_esp;
    }

    public void setDesp_esp(String desp_esp) {
        this.desp_esp = desp_esp;
    }

    public String getNombre_esp() {
        return nombre_esp;
    }

    public void setNombre_esp(String nombre_esp) {
        this.nombre_esp = nombre_esp;
    }
    
    
    
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {
       Cmiconexion conecction=new Cmiconexion();
        csProcedure=(CallableStatement) conecction.miconexion.prepareCall("CALL pr_reg_espLibro(?,?)");        
        csProcedure.setString(1, this.getNombre_esp());
        csProcedure.setString(2, this.getDesp_esp());
        
        int bandera=csProcedure.executeUpdate();
        
        //cerrando las conexiones
        conecction.miconexion.close(); 
       
        csProcedure.close();
        
        
        if (bandera==1) 
        {
         return true;    
        }
        
        
        return  false;
    }

    @Override
    public boolean DeleteRegistro() throws Exception {
       Cmiconexion conecction=new Cmiconexion();  
        String sql="DELETE FROM t_esp_libro WHERE id_esp_libro="+this.getId_esp();
        
        psSentencia=conecction.miconexion.prepareStatement(sql);
        
        int bandera=psSentencia.executeUpdate();
        
        //cerrando las conexiones
        conecction.miconexion.close(); 
        psSentencia.close();
       
        
        
        if(bandera==1)
        {
          return true;
        }
        
        return false;
        
    }

    @Override
    public boolean UpdateRegistro() throws Exception 
    {
       Cmiconexion conecction=new Cmiconexion();  
        String sql="UPDATE t_esp_libro SET nombre_esp='"+this.getNombre_esp()+"',descripcion_esp='"+this.getDesp_esp()+
                    "'  WHERE id_esp_libro="+this.getId_esp();
        
        psSentencia=conecction.miconexion.prepareStatement(sql);
        
        int bandera=psSentencia.executeUpdate();
        
        //cerrando las conexiones
//        conecction.miconexion.close(); 
        psSentencia.close();
        
        rsDatos.close();
        
        if(bandera==1)
        {
          return true;
        }
        
        return false;
    }
   
    public Object[]BuscarEspecialidad(int id_especialidad) throws Exception
    {
      String sql="SELECT  * FROM t_esp_libro WHERE id_esp_libro="+id_especialidad;
      Cmiconexion conecction=new Cmiconexion();
      psSentencia=conecction.miconexion.prepareStatement(sql);
      
      rsDatos=psSentencia.executeQuery();
      
        while (rsDatos.next()) 
        {            
          Object[]registro={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3)};
          
          //cerrando las conexiones
          conecction.miconexion.close(); 
          psSentencia.close();
          
          rsDatos.close();
          
          //retronado registro encontrado
          return  registro;
        }
 
       //cerrando las conexiones
        conecction.miconexion.close(); 
        psSentencia.close();
        csProcedure.close();
        rsDatos.close();
        
        return null;
    }
    
    
    private String GenerarId() throws Exception
    {
       Cmiconexion conecction=new Cmiconexion();
       String sql="SELECT MAX(id_esp_libro) AS ultimo FROM t_esp_libro";
       psSentencia =(PreparedStatement) conecction.miconexion.prepareStatement(sql); 
       rsDatos=psSentencia.executeQuery();
       String id=null;
      
       while (rsDatos.next()) 
        {            
          id=String.valueOf(rsDatos.getObject(1));      
        }
        
  
        if (id==null) 
        {
            return "esp01";
        }
      //si ya existen registros entonces
       String numero="";
       
       
        for (int i = 0; i < id.length(); i++) 
        {
              if (Character.isDigit(id.charAt(i))) 
              {
                numero=numero+id.charAt(i);  
              }
              
            
        }
        
        //cerrando las conexiones
        conecction.miconexion.close();  
        psSentencia.close();
        csProcedure.close();
        rsDatos.close();
        
        int num=Integer.valueOf(numero);//convistiendo lo q es digito en numero
    
        return "esp0"+(num+1);// generando nuevo id para la especialidad
    }

    @Override
    public ArrayList<Object[]> SelectDatos() 
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }
       
    public ArrayList<Object[]> SelectEspecialidad() throws Exception 
    {
        ArrayList<Object[]> especialidad=new ArrayList<Object[]>();
                
        String sql="SELECT id_esp_libro,nombre_esp,descripcion_esp FROM t_esp_libro;";
        Cmiconexion conecction =new Cmiconexion();
        psSentencia=conecction.miconexion.prepareStatement(sql);
        rsDatos=psSentencia.executeQuery();
        while (rsDatos.next()) 
        {
            Object[] esp={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3)};//cambiado solo era hasta 2
            especialidad.add(esp);
            
        }
        
        //cerrando las conexiones
          conecction.miconexion.close(); 
          psSentencia.close();       
          rsDatos.close();
        
       return especialidad;
    }
    
    
           
    public ArrayList<Object[]> SelectLibroEspecialidad(int especilaidad) throws Exception 
    {
        ArrayList<Object[]> especialidad=new ArrayList<Object[]>();
        ResultSet rsAutores=null;        
        
        Cmiconexion conecction=new Cmiconexion();
        csProcedure=conecction.miconexion.prepareCall("CALL pr_BuscarEspecialidad(?)");
        csProcedure.setInt(1, especilaidad);
        rsDatos=csProcedure.executeQuery();
        while (rsDatos.next()) 
        {            
             String isbn=rsDatos.getObject(1).toString();   
             String sql_autor="SELECT nombre_autor FROM t_autor,t_libro_autor "+
                 "WHERE t_autor.id_autor=t_libro_autor.id_autor  AND t_libro_autor.isbn_libro='"+isbn+"'";
             psSentencia=conecction.miconexion.prepareStatement(sql_autor);
             rsAutores=psSentencia.executeQuery();
             String list_autres="";
             while (rsAutores.next()) 
             {            
              list_autres=list_autres+rsAutores.getObject(1).toString()+"<br/>";    
             }          
            
            Object[] esp={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),list_autres,rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7)};
            especialidad.add(esp);
            
        }
          //cerrando las conexiones
          rsAutores.close();
          conecction.miconexion.close(); 
          psSentencia.close();
          csProcedure.close();
          rsDatos.close();
        
        
       return especialidad;
    }
    
    
    
    
}

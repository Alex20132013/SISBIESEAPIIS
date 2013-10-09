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
 * @author eapiis_server
 */
public class Ctemp_pedido implements IEntidad
{
    
   Cmiconexion  conecction=null;
   PreparedStatement psSentencia=null;
   CallableStatement  csProcedure=null;
   ResultSet rsDatos=null; 
           
    BigDecimal codigo;
    String isbn_libro;
    int pedido_libro;

    public Ctemp_pedido() {
    }
    
    public Ctemp_pedido(BigDecimal codigo, String isbn_libro, int pedido_libro) {
        this.codigo = codigo;
        this.isbn_libro = isbn_libro;
        this.pedido_libro = pedido_libro;
    }

    public BigDecimal getCodigo() {
        return codigo;
    }

    public void setCodigo(BigDecimal codigo) {
        this.codigo = codigo;
    }

    public String getIsbn_libro() {
        return isbn_libro;
    }

    public void setIsbn_libro(String isbn_libro) {
        this.isbn_libro = isbn_libro;
    }

    public int getPedido_libro() {
        return pedido_libro;
    }

    public void setPedido_libro(int pedido_libro) {
        this.pedido_libro = pedido_libro;
    }
   
    
    
    

    @Override
    public boolean InsertRegisto() throws Exception 
    {   conecction=new Cmiconexion();
        boolean opcionpretamo=false;
        if (this.getPedido_libro()==1) 
        {
         opcionpretamo=true;    
        }
        
       String sql="INSERT INTO t_temp_pedido VALUES("+this.getCodigo()+",'"+this.getIsbn_libro()+"',"+opcionpretamo+",null,null)";
        
       psSentencia=conecction.miconexion.prepareStatement(sql);
       
       int bandera=psSentencia.executeUpdate();
       
       //cerrando las conexiones       
       conecction.miconexion.close();
       psSentencia.close();
       
        if (bandera==1) 
        {
          
          return  true;
             
        }
       
        return  false;
    }

    @Override
    public boolean DeleteRegistro() throws Exception {
        conecction=new Cmiconexion();
        String sql="DELETE  FROM t_temp_pedido WHERE codigo_usuario='"+this.getCodigo()+"'";
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
    public boolean UpdateRegistro() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Object[]> SelectDatos() throws Exception 
    {
        ArrayList<Object[]>ListaTmpPedido=new ArrayList<Object[]>();
        conecction=new Cmiconexion();
        ResultSet rsAutores=null;
        csProcedure=conecction.miconexion.prepareCall("CALL pr_ListarTempPedido()");
        rsDatos=csProcedure.executeQuery();
        
        while (rsDatos.next() ) 
        {
            String isbn=rsDatos.getObject(4).toString();   
            String sql_autor="SELECT nombre_autor FROM t_autor,t_libro_autor "+
           "WHERE t_autor.id_autor=t_libro_autor.id_autor  AND t_libro_autor.isbn_libro='"+isbn+"'";
            psSentencia=conecction.miconexion.prepareStatement(sql_autor);
            rsAutores=psSentencia.executeQuery();
            String list_autres="";
            while (rsAutores.next()) 
            {            
             list_autres=list_autres+rsAutores.getObject(1).toString()+"<br/>";    
            }      
            
            Object[] registro={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7),list_autres};
            ListaTmpPedido.add(registro);
                    
            
        }
        //cerrando las conexiones           
        conecction.miconexion.close();
        csProcedure.close();
        rsDatos.close();
        rsAutores.close();
        
        return ListaTmpPedido;
      }
    
    
    public ArrayList<Object[]>ListNoActivo() throws  Exception
    {    
    
      ArrayList<Object[]>ListaTmpPedido=new ArrayList<Object[]>();
        conecction=new Cmiconexion();
        ResultSet rsAutores=null;
        csProcedure=conecction.miconexion.prepareCall("CALL pr_ListTemPedNo()");
        rsDatos=csProcedure.executeQuery();
        
        while (rsDatos.next() ) 
        {
            String isbn=rsDatos.getObject(4).toString();   
            String sql_autor="SELECT nombre_autor FROM t_autor,t_libro_autor "+
           "WHERE t_autor.id_autor=t_libro_autor.id_autor  AND t_libro_autor.isbn_libro='"+isbn+"'";
            psSentencia=conecction.miconexion.prepareStatement(sql_autor);
            rsAutores=psSentencia.executeQuery();
            String list_autres="";
            while (rsAutores.next()) 
            {            
             list_autres=list_autres+rsAutores.getObject(1).toString()+"<br/>";    
            }      
            
            Object[] registro={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7),list_autres};
            ListaTmpPedido.add(registro);
                    
            
        }
        //cerrando las conexiones           
        conecction.miconexion.close();
        csProcedure.close();
        rsDatos.close();
        rsAutores.close();
        
        return ListaTmpPedido;
    
    
    
    }
    
    
    
    public boolean  DeleteAllNull() throws Exception
    {
       String sql="DELETE FROM t_temp_pedido WHERE t_temp_pedido.huella_dig IS NULL";
       
       conecction=new Cmiconexion();
       psSentencia=conecction.miconexion.prepareStatement(sql);
       
       int bandera=psSentencia.executeUpdate();
       
       conecction.miconexion.close();
       psSentencia.close();
       
       if(bandera>0)
       {
       
         return true;
       }
    
    
    return  false;
    }
    
    
}

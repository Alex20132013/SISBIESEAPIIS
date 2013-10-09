
package Modelo;


import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CLibro implements IEntidad
{
   // Cmiconexion conection;
    PreparedStatement prStament=null;
    CallableStatement csProcemimientos=null;
    ResultSet  rsDatos=null;
    
    private String isb_libro;    
    private String titulo_libro;
    private int esp_libro;
    private int edit_libro;
    private String edicion; 
    private String cod_dewey;
    private String not_malga;
    private int    stock;    
    private String indce_libro;
    private int anio_public;
    private String vol_tomo;
    private int    nro_pag;
    private BigDecimal precio_libro;
    private String descrip;
    private int cod_admin;

    public CLibro(String isb_libro, String titulo_libro, int esp_libro, int edit_libro, String edicion, String cod_dewey, String not_malga, int stock, String indce_libro, int anio_public, String vol_tomo, int nro_pag, BigDecimal precio_libro, String descrip, int cod_admin) {
        this.isb_libro = isb_libro;
        this.titulo_libro = titulo_libro.toUpperCase();
        this.esp_libro = esp_libro;
        this.edit_libro = edit_libro;
        this.edicion = edicion;
        this.cod_dewey = cod_dewey;
        this.not_malga = not_malga;
        this.stock = stock;
        this.indce_libro = indce_libro;
        this.anio_public = anio_public;
        this.vol_tomo = vol_tomo;
        this.nro_pag = nro_pag;
        this.precio_libro = precio_libro;
        this.descrip = descrip;
        this.cod_admin = cod_admin;
    } 

    public CLibro() 
    {
        
    }

    public int getAnio_public() {
        return anio_public;
    }

    public void setAnio_public(int anio_public) {
        this.anio_public = anio_public;
    }

    public String getVol_tomo() {
        return vol_tomo;
    }

    public void setVol_tomo(String vol_tomo) {
        this.vol_tomo = vol_tomo;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public int getCod_admin() {
        return cod_admin;
    }

    public void setCod_admin(int cod_admin) {
        this.cod_admin = cod_admin;
    }

    
    public String getNot_malga() {
        return not_malga;
    }

    public void setNot_malga(String not_malga) {
        this.not_malga = not_malga;
    }
    
    

    public String getCod_dewey() {
        return cod_dewey;
    }

    public void setCod_dewey(String cod_dewey) {
        this.cod_dewey = cod_dewey;
    }

    public String getEdicion() {
        return edicion;
    }

    public void setEdicion(String edicion) {
        this.edicion = edicion;
    }

    public int getEdit_libro() {
        return edit_libro;
    }

    public void setEdit_libro(int edit_libro) {
        this.edit_libro = edit_libro;
    }

    public int getEsp_libro() {
        return esp_libro;
    }

    public void setEsp_libro(int esp_libro) {
        this.esp_libro = esp_libro;
    }

    public String getIndce_libro() {
        return indce_libro;
    }

    public void setIndce_libro(String indce_libro) {
        this.indce_libro = indce_libro;
    }

    public String getIsb_libro() {
        return isb_libro;
    }

    public int getNro_pag() {
        return nro_pag;
    }

    public void setNro_pag(int nro_pag) {
        this.nro_pag = nro_pag;
    }

    public BigDecimal getPrecio_libro() {
        return precio_libro;
    }

    public void setPrecio_libro(BigDecimal precio_libro) {
        this.precio_libro = precio_libro;
    }
    

    public void setIsb_libro(String isb_libro) {
        this.isb_libro = isb_libro;
    }

    public PreparedStatement getPrStament() {
        return prStament;
    }

    public void setPrStament(PreparedStatement prStament) {
        this.prStament = prStament;
    }

   

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getTitulo_libro() {
        return titulo_libro;
    }

    public void setTitulo_libro(String titulo_libro) {
        this.titulo_libro = titulo_libro.toUpperCase();
    }

   

      
    
    
    
    
   
    
  
   
                                                                                 //datos del libr
    @Override
    public boolean InsertRegisto() throws Exception 
    {
       Cmiconexion conection=new Cmiconexion();
        
        
        csProcemimientos=(CallableStatement) conection.miconexion.prepareCall("CALL pr_reg_libro(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        csProcemimientos.setString(1, this.getIsb_libro());
        csProcemimientos.setString(2, this.getTitulo_libro());
        csProcemimientos.setInt(3, this.getEsp_libro());
        csProcemimientos.setInt(4, this.getEdit_libro());
        csProcemimientos.setString(5, this.getEdicion());        
        csProcemimientos.setInt(6, this.getStock());
        csProcemimientos.setString(7, this.getCod_dewey());        
        csProcemimientos.setString(8, this.getNot_malga());        
       // csProcemimientos.setString(9, this.getIndce_libro());        
        csProcemimientos.setInt(9, this.getAnio_public());     
        csProcemimientos.setString(10, this.getVol_tomo());        
        csProcemimientos.setInt(11, this.getNro_pag());    
        csProcemimientos.setBigDecimal(12, this.getPrecio_libro());
        csProcemimientos.setString(13, this.getDescrip());
        csProcemimientos.setInt(14,  this.getCod_admin());
        
        
        int badera=csProcemimientos.executeUpdate();
        
        //cerrando las conexiones
        
           conection.miconexion.close();
           csProcemimientos.close();           
        
        if (badera==1) 
        {
           
          return true ;  
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
           
        
        throw new UnsupportedOperationException("Not supported yet.");
    }

   
    
    public boolean  BuscarLibroIsbn(String isbn) throws  Exception   //busqueda de ibro
    {
           Cmiconexion conection=new Cmiconexion();
           int bandera=0;                                           //para determinra si el  procedimiento se ejecuta
         
           String sql="SELECT COUNT(*) AS existe FROM t_libro WHERE isbn_libro='"+isbn+"'";
           prStament=(PreparedStatement) conection.miconexion.prepareStatement(sql);          
           rsDatos=prStament.executeQuery();
           while (rsDatos.next()) 
             { 
                bandera=Integer.valueOf(rsDatos.getObject(1).toString());
            
             }
          
           //cerrando las conexiones 
           conection.miconexion.close();          
           prStament.close();
           rsDatos.close();
           
           if (bandera==1) 
           {
            
             
             return true; 
           }
           
    
    return false  ;
    }
    
/***function para agregan nuevo libro existente en la biblioteca****************/    
    public boolean  AgregarNuevoLibro(String isbn)throws Exception
    {
        int bandera=0;
        Cmiconexion conection=new Cmiconexion();
        csProcemimientos=(CallableStatement) conection.miconexion.prepareCall("CALL pr_AgregarNuevo_Libro(?)");   
   
    
        if (this.BuscarLibroIsbn(isbn)==true)                                        //buscando si el libro ya existe 
           {
             //String cod_barra=this.GenerarCodBarra(isbn);
             csProcemimientos.setString(1, isbn);
             //csProcemimientos.setString(2, cod_barra );             
             bandera=csProcemimientos.executeUpdate();
              
           }
        
        //cerrando las conexiones 
           conection.miconexion.close();
           csProcemimientos.close();
                  
    
        if (bandera==1) 
        {
        
         return true;   
        }
    
    
    return false;
    }

/*funcion generando un nuevo codigo de barra para el ingreso del nuevo libro existente en la Biblioteca*/    
 private String GenerarCodBarra(String isbn) throws Exception
    {
       Cmiconexion conection=new Cmiconexion();
       String sql="SELECT MAX(contador) AS cod_barra FROM t_detalle_libro=isbn_libro='"+isbn+"'";
       prStament=(PreparedStatement) conection.miconexion.prepareStatement(sql); 
       rsDatos=prStament.executeQuery();
       String id="";      
      
       while (rsDatos.next()) 
        {            
          id=String.valueOf(rsDatos.getObject(1));
            
        }
        
        //cerrando las conexiones 
           conection.miconexion.close();     
           prStament.close();
           rsDatos.close();
  
        if (id==null) 
        {
            return "";                                                           //retornando cadena vacia 
        } 
       

        conection.miconexion.close();                                            //cerrando la conexion a la base de datos 
        int num=Integer.valueOf(id);                                             //convistiendo lo q es digito en numero
    
        return isbn+"L"+(num+1);                                                // generando codigo de barra para el nuevo libro
    }   
  
/********funcion pra inhabiltara un libro ********///////**********************/
 
 public  boolean Habilitar_Inhabilar_Libro(String cod_barra,boolean estado )throws  Exception
 {
     
     
     
     String sql="UPDATE t_detalle_libro SET estado_libro="+estado+"  WHERE codigo_barra='"+cod_barra+"'";
     Cmiconexion conection=new Cmiconexion();
     prStament=(PreparedStatement) conection.miconexion.prepareStatement(sql);
     
     int bandera=prStament.executeUpdate();
     
     //cerrando las conexiones 
        conection.miconexion.close(); 
        prStament.close();
       
     
     if (bandera==1) 
     {
      return true;    
     }
     
 
     return false;
 }

 
 /*******************eleiminado el libro mediante el codigo de barra generado***/
 public int DeteleLibro(String cod_barra) throws  Exception
 {
    String sql="DELETE FROM t_detalle_libro WHERE codigo_barra='"+cod_barra+"'";
    Cmiconexion conection=new Cmiconexion();
    prStament=(PreparedStatement) conection.miconexion.prepareStatement(sql);
    
    int bandera=prStament.executeUpdate();  
    
    //cerrando las conexiones 
           conection.miconexion.close();         
           prStament.close();
     
    
    return  bandera; 
 
 
 }
 /*****retornando libro unico por codigo de barra***************///////////////*/
 public ArrayList<Object>Libro_codigoBarra(String cod_barra) throws Exception 
 {
    Cmiconexion conection=new Cmiconexion();
    ArrayList<Object> libro=new ArrayList<Object>();
    csProcemimientos=(CallableStatement) conection.miconexion.prepareCall("CALL pr_BuscarLibroCodBarra(?)");
    csProcemimientos.setString(1, cod_barra);
    
    rsDatos=csProcemimientos.executeQuery();
    
    ArrayList<Object> autores=this.Autores(cod_barra);
    String autLibro="";
    
    for (int i =1; i <=autores.size(); i++) 
     {
         if (i%2==0) 
         {
           autLibro=autLibro+"<li>"+autores.get(i-1) +"</li>";    
         }
         
         
     }
    
     while (rsDatos.next()) 
     {         
       libro.add(rsDatos.getObject(1));
       libro.add(rsDatos.getObject(2));
       libro.add(rsDatos.getObject(3));
       libro.add(autLibro);                                                      //agregando los autores  del libro 
       libro.add(rsDatos.getObject(4));
       libro.add(rsDatos.getObject(5));
       libro.add(rsDatos.getObject(6));
       libro.add(rsDatos.getObject(7));
       
     }
     
  //cerrando las conexiones 
           conection.miconexion.close();
           csProcemimientos.close();
         
           rsDatos.close();   
    
    return libro;
 }
 /****fucion para listar los libros por insbn***********************************/
 
 public ArrayList<Object[]>Libros_Autores(String isbn)
 {
   ArrayList<Object[]> libros=new ArrayList<Object[]>();
   libros=null;
   
   return libros;
 
     
 }
 
 
/*********retornando los autores de un libro************************************/
    public ArrayList<Object> Autores(String cod_barra) throws Exception
    {
        Cmiconexion conection=new Cmiconexion();
        ArrayList<Object> autores=new ArrayList<Object>();
        String sql="SELECT t_autor.id_autor,t_autor.nombre_autor "+
               "FROM  t_autor INNER JOIN t_libro_autor ON (t_autor.id_autor=t_libro_autor.id_autor) INNER JOIN t_libro ON(t_libro_autor.isbn_libro=t_libro.isbn_libro)"+
                "INNER JOIN t_detalle_libro ON (t_libro.isbn_libro=t_detalle_libro.isbn_libro) AND t_detalle_libro.codigo_barra='"+cod_barra+"'";
        prStament=(PreparedStatement) conection.miconexion.prepareStatement(sql);
    
         ResultSet rsAutor =prStament.executeQuery();
    
        while (rsAutor.next()) 
        {      
             autores.add(rsAutor.getObject(1)); 
             autores.add(rsAutor.getObject(2)); 
        }
        
      //cerrando las conexiones 
           conection.miconexion.close();
          
           prStament.close();
           rsDatos.close();
           rsAutor.close();
        return autores;   
    
    }
    
   
    public int Agregar_autor(String isb_libro,int id_autor)throws Exception
    {
        Cmiconexion conection=new Cmiconexion();
        PreparedStatement psSentenciainsert=null;
        String sql="INSERT INTO t_libro_autor VALUES ("+id_autor+",'"+isb_libro+"',null)";
        psSentenciainsert=(PreparedStatement) conection.miconexion.prepareStatement(sql);
    
        int bandera=psSentenciainsert.executeUpdate();
        psSentenciainsert.close();
        conection.miconexion.close();
        
    
        return  bandera;
    }

    @Override
    public ArrayList<Object[]> SelectDatos() throws Exception 
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public ArrayList<Object[]> Busqueda_por_Titulo(String titulo) throws Exception
    {
        ArrayList<Object[]> libros=new ArrayList<Object[]>(); 
        ResultSet rsAutores=null;
        Cmiconexion conection=new Cmiconexion();    
        csProcemimientos=conection.miconexion.prepareCall("CALL pr_BuscarLibroTitulo(?)");
        csProcemimientos.setString(1, titulo);
        rsDatos=csProcemimientos.executeQuery();
    
        while (rsDatos.next()) 
        {        
            String isbn=rsDatos.getObject(1).toString();   
            String sql_autor="SELECT nombre_autor FROM t_autor,t_libro_autor "+
             "WHERE t_autor.id_autor=t_libro_autor.id_autor  AND t_libro_autor.isbn_libro='"+isbn+"'";
            prStament=conection.miconexion.prepareStatement(sql_autor);
            rsAutores=prStament.executeQuery();
            String list_autres="";
             while (rsAutores.next()) 
            {            
                list_autres=list_autres+rsAutores.getObject(1).toString()+"<br/>";    
            }
             
                       
            Object[] registro={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),
                rsDatos.getObject(5),rsDatos.getObject(6),list_autres,rsDatos.getObject(7),rsDatos.getObject(8),rsDatos.getObject(9)};
        
            libros.add(registro);
       }
        rsAutores.close();
        csProcemimientos.close();
        conection.miconexion.close();
        rsDatos.close();
             
         
        return  libros;
 
    }

//METODO PARA LA BUSQUEDA PARA AUTOCOMPLETAR  LO BUSCADO POR EL USUARIO
   public ArrayList<String>List_LibrosTitulo(String keypresedTitle) throws Exception
   {
     ArrayList<String>Lista_titulos=new ArrayList<String>();
     Cmiconexion miconectio=new Cmiconexion();
     
     csProcemimientos=miconectio.miconexion.prepareCall("CALL pr_FindTitulo(?)");
     csProcemimientos.setString("KeyPressedTitle", keypresedTitle);
     rsDatos=csProcemimientos.executeQuery();
      
       while (rsDatos.next()) 
       {           
           Lista_titulos.add(rsDatos.getString(1));
       }
       
     //cerrando las conexiones  
     miconectio.miconexion.close();
     csProcemimientos.close();
     rsDatos.close();
    
    return Lista_titulos;
    
   
   
   }

 

    public  ArrayList<Object[]> Lista_printDewey_Barra(String isbn) throws Exception
    {
    
         Cmiconexion conection=new Cmiconexion();
         csProcemimientos=conection.miconexion.prepareCall("CALL pr_printCodBarraDewey(?)");
         csProcemimientos.setString(1, isbn);
         rsDatos=csProcemimientos.executeQuery();
   
        ArrayList<Object[]> print_barCode=new ArrayList<Object[]>();
   
         while (rsDatos.next()) 
        {   
          if (rsDatos.getObject(7)==null) //si el volumen del libro es vacio
          {
            Object[] fila={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),"",(Object)("ej."+rsDatos.getObject(8)),rsDatos.getObject(8)};
            print_barCode.add(fila);
            
          }
         else
         {
          Object[] fila={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7),(Object)("ej."+rsDatos.getObject(8)),rsDatos.getObject(8)};
          print_barCode.add(fila); 
         }
   
     // Object[] fila={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6),rsDatos.getObject(7),rsDatos.getObject(6),rsDatos.getObject(8)};
      
       
     }
       //Cerrando las conexiones    
       conection.miconexion.close();
       csProcemimientos.close();
       rsDatos.close();
       
        return  print_barCode; 

    }
    
 
    public ArrayList<Object[]> ListLibrosPrestados()throws  Exception
    {
         Cmiconexion conection=new Cmiconexion();
         csProcemimientos=conection.miconexion.prepareCall("CAll pr_ListLib_en_prestamo()");
        
         rsDatos=csProcemimientos.executeQuery();
   
        ArrayList<Object[]> ListEnPrestamo=new ArrayList<Object[]>();
   
         while (rsDatos.next()) 
        {   
          
            Object[] fila={rsDatos.getObject(1),rsDatos.getObject(2),rsDatos.getObject(3),rsDatos.getObject(4),rsDatos.getObject(5),rsDatos.getObject(6)};
            ListEnPrestamo.add(fila);
            
        }
       //Cerrando las conexiones    
       conection.miconexion.close();
       csProcemimientos.close();
       rsDatos.close();
       
        return  ListEnPrestamo;
    
    
    }
    
}


    
    
    



<%@page import="Modelo.CLibro"%>
<%@page import="Modelo.CAutor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
try
{
   String isbn=request.getParameter("isbnLibro");
   String titulo=request.getParameter("titloLibro");
   int esp=Integer.parseInt(request.getParameter("selComboEsp"));
   int edtrial=Integer.parseInt(request.getParameter("selComboEtrial"));
   String edicion=request.getParameter("edcnLibro");
   String volumen=request.getParameter("vlmnLibro");
   String indice=request.getParameter("indcLibro");
   int total=Integer.parseInt(request.getParameter("totlLibro"));
   String codDewey=request.getParameter("codDewey");
   String stand=request.getParameter("standLibro");
  
  // CLibro libro=new CLibro(isbn, titulo, esp, edtrial, edicion, volumen, codDewey, total, indice, stand); 
   boolean indicador=false;
   
   
   HttpSession  autor_libro=request.getSession(true);
   List<Object[]> autores=new ArrayList<Object[]>();
   if(autor_libro.getAttribute("datos")!=null)
   {
     autores=(ArrayList<Object[]>)autor_libro.getAttribute("datos");
     indicador=(autores.size()>0);     
   } 
   if(indicador==true)
   {
  //   boolean bandera=libro.InsertRegisto();
     for(int i=0;i<autores.size();i++)
     {
         Object[]dato=autores.get(i);
         String ibnlibro=dato[1].toString();
         int  idautor=Integer.parseInt(dato[0].toString());
         
         /*int banderin=libro.Agregar_autor(ibnlibro, idautor);
          if(banderin!=1)
           {
              break;
           }    */                                             
     
     }              
   }
   autor_libro.removeValue("datos");//eliminado autores;
   out.print("se ha registrado correctamente");
 }
catch(Exception ex)
{
   HttpSession  autor_libro=request.getSession(true);
   autor_libro=request.getSession(false);
 out.print("existe error!:"+ex.getMessage());
}         
           
 //autor_libro.invalidate();
 
 %>
 
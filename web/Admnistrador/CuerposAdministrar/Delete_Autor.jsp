
<%@page import="Modelo.CAutor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%

   String query =request.getParameter("codigo");
   String ibslibro=request.getParameter("isbn");
   
   HttpSession autor_libro=request.getSession(true);
   
   List<Object[]> autores=new ArrayList<Object[]>();
   if(autor_libro.getAttribute("datos")!=null)
   {
     autores=(ArrayList<Object[]>)autor_libro.getAttribute("datos");
     
   }    
    
    for(int i=0;i<autores.size();i++)
    {
        Object[] dato=autores.get(i);
        if(dato[0].toString().equals(query))
        {
            autores.remove(i);
        }  
        
    }
   for(int i=0;i<autores.size();i++)
    {
      Object[] dato=autores.get(i);
        out.print("<tr>"); 
        out.print("<td>"+dato[2].toString()+" </td>"); 
        out.print("<td>"+dato[3].toString()+" </td>");
        out.print("<td>"+dato[4].toString()+" </td>");
        out.print("<td>");
        out.print("<img src='../Imagenes/sql/delete.png' onclick='deleteAutor("+dato[0].toString()+")' />");
        out.print("</td>");            
           
   
  out.print("</tr>");  
        
    }    

   
      
 autor_libro.setAttribute("datos", autores);
     
 
// autor_libro.invalidate();
 
 %>
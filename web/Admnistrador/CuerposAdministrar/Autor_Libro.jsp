
<%@page import="Modelo.CAutor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%

   int query = Integer.parseInt(request.getParameter("codigo"));
   //String ibslibro=request.getParameter("isbnCopia");
   String ibslibro=request.getParameter("isbn");
   boolean badera=false;
   HttpSession autor_libro=request.getSession(true);
   
   List<Object[]> autores=new ArrayList<Object[]>();
  // ArrayList<Object[]> autores=null;
   if(autor_libro.getAttribute("datos")!=null)
   {
     autores=(ArrayList<Object[]>)autor_libro.getAttribute("datos");
     
   }  
   
//restringiendo q se agregue 2 veces el mimo autor         
   for(int i=0;i<autores.size();i++)
    {
        Object[] dato=autores.get(i);
        if(dato[0].toString().equals(String.valueOf(query) ))
        {
          badera=true;
        }  
        
    }
    
  if(badera==false)
    {
    CAutor autor=new CAutor();
    
    Object[] autors = autor.BusquedaAutor(query);
    
    Object[] temp={ String.valueOf(query),ibslibro,autors[1].toString(),autors[2].toString(),autors[3].toString()};
    autores.add(temp);
    
    autor_libro.setAttribute("datos", autores );
 
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
     }
     else
     {
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
     }           
 //autor_libro.invalidate();
 
 %>


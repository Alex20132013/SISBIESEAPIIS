<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.CAutor"%>
<% 
   
 
    String query = request.getParameter("valuekey");
    CAutor autor=new CAutor();
    
    try
    {
      List<Object[]> autors = autor.NombreAutor(query);
 
       Iterator<Object[]> iterator = autors.iterator();
       while(iterator.hasNext()) 
      {
        Object[] dato= iterator.next();
        out.println("<li id='"+dato[0].toString()+"'>"+dato[1].toString() +"<a href='#'  onclick='AddCodigoI("+dato[0].toString()+")' >Agregar </a></li>");
      
      }
       // out.println(query);
        
    }            
    catch(Exception ex)
    {
     out.println(ex.getMessage());
    }  
    
    finally
    {
      
    
    }
    
   
   
%>



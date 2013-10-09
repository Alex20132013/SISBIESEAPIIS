<%@page import="Modelo.CEditorial"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.CEspLibro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
 CEditorial editorial=new  CEditorial();


try
    {
      List<Object[]> lstEditorial=editorial.SelectEditorial();
 
       Iterator<Object[]> iterator = lstEditorial.iterator();
       while(iterator.hasNext()) 
      {
        Object[] dato= iterator.next();
        out.println( "<option value='"+dato[0].toString()+"'>"+dato[1].toString()+"</option>");
       // out.println( "<li value='"+dato[0].toString()+"'>"+dato[1].toString()+"</li>");
      }
       // out.println(query);
        
    }            
    catch(Exception ex)
    {
     out.println(ex.getMessage());
    }   


%>
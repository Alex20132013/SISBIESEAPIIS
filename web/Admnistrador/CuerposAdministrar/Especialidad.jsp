
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.CEspLibro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
 CEspLibro esplibro=new  CEspLibro();


try
    {
      List<Object[]> lstEsp=esplibro.SelectEspecialidad();
 
       Iterator<Object[]> iterator = lstEsp.iterator();
       while(iterator.hasNext()) 
      {
        Object[] dato= iterator.next();
        out.println( "<option value='"+dato[0].toString()+"'>"+dato[1].toString()+"</option>");
      }
       // out.println(query);
        
    }            
    catch(Exception ex)
    {
     out.println(ex.getMessage());
    }   


%>



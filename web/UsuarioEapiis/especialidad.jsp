<%-- 
    Document   : especialidad
    Created on : 29-mar-2013, 12:09:01
    Author     : 2012
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.CEspLibro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  CEspLibro especialidad=new CEspLibro();
  
  List<Object[]> esplds=especialidad.SelectEspecialidad();
for(int i=0; i<esplds.size();i++)
{     
  Object[] dato=esplds.get(i);    

%>

<li><a href="#" class="_parent" onclick="clkEsp(<% out.print( dato[0].toString()); %>)" ><%out.print(dato[1].toString());%></a></li>
        
 <% 
}
 %>
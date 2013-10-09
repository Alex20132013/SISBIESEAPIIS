<%-- 
    Document   : tipo_user
    Created on : 12-abr-2013, 8:56:20
    Author     : 2012
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page import="Modelo.CTipo_user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   CTipo_user  usuario=new CTipo_user();
   List<Object[]> tipos_user=usuario.Select_tipoUser();
   for(int i=0; i<tipos_user.size();i++)
   {
       out.print("<option value='"+tipos_user.get(i)[0].toString() +"'>"+tipos_user.get(i)[1].toString()+"</option>");
   
   }
   
   String pacht=application.getRealPath("META-INF");
   
   
   
%>

<img src="<% out.print(pacht+"/Kohala.jpg"); %>" />
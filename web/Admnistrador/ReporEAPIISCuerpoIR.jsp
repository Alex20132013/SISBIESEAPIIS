<%-- 
    Document   : pruebareporte
    Created on : 11-abr-2013, 8:33:48
    Author     : eapiis_server
--%>

<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="Modelo.Cmiconexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="Modelo.Cconection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <%  
         String fechaInicial=request.getParameter("fechaInicial").replace('/', '-');
         String fechaFinal=request.getParameter("fechaFinal").replace('/','-');

      Cconection conex=new Cconection();  
      File reportFile = new File(application.getRealPath("Reportes/IRUsuarioEAPIISCategoria.jasper"));

      
     Map parameters = new HashMap();
     parameters.put("fechaInicial",fechaInicial );
     parameters.put("fechaFinal", fechaFinal);

    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),parameters,conex.miconexion);

   
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);
    ouputStream.flush();
     // out.print(reportFile.getPath()+"nombre:"+reportFile.getName());
    %>
    </body>
</html>
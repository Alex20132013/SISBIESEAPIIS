<%@page import="com.onbarcode.barcode.Code128"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="Modelo.Cmiconexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="Modelo.Cconection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <%  
        
  
   ServletOutputStream servletoutputstream = response.getOutputStream();
        try {
            
            HttpSession  printbarra=request.getSession(true);
            ArrayList<Object[]> lista_cod=null;
           
            if(printbarra.getAttribute("Dewey_barrra")!=null)
            {
                lista_cod=(ArrayList<Object[]>) printbarra.getAttribute("Dewey_barrra");
            
             /* String pahtDirec=application.getRealPath("");
                
                Code128 codigo =new Code128();  
                 
             
                for (int i = 0; i < lista_cod.size(); i++) 
                {
                    Object[]registro=lista_cod.get(i);          
                
                    codigo.setData(registro[0].toString());
                    codigo.setX(1);
                    codigo.setY(30);
                    codigo.setBarcodeHeight(20);
                    codigo.setBarcodeWidth(20);
                    codigo.drawBarcode(application.getRealPath("")+"/foto"+i+".jpg");
                    Thread.sleep(1000);
                    servletoutputstream .print("<img src='reportes/foto"+i+".jpg' />");
                }*/
                out.print(application.getContextPath());
            }
            else
            {
              response.sendRedirect("reporte.jsp"); 
            }
        }
        catch(Exception ex)
        {
             servletoutputstream.print(ex.getMessage());
        
        }
        finally {            
            servletoutputstream.close();
        }       
    
      
    %>
    </body>
</html>

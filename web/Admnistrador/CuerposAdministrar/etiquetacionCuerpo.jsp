<%@page import="org.codehaus.groovy.runtime.ArrayUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="Modelo.Cconection"%>
<%  
       
      Cconection conex=new Cconection();
      
     
      File reportFile = new File(application.getRealPath("Reportes/IRepCodDewey.jasper"));
      HttpSession  printbarra=request.getSession(true);
      ArrayList<Object[]> lista_cod=null;
      lista_cod=(ArrayList<Object[]>) printbarra.getAttribute("Dewey_barrra");  
      Map parameters = new HashMap(); 

      byte[] bytes=null;
      byte[] prueba;
      int logitud=0;
      
       for (int i = 0; i < lista_cod.size(); i++) 
           {
                    String string = lista_cod.get(i)[0].toString();                 
                    parameters.put("cod_barra",string );
                    
                    if(i==0)
                    {
                      bytes =JasperRunManager.runReportToPdf(reportFile.getPath(),parameters,conex.miconexion);               
                      logitud=logitud+bytes.length;  
                    }
                    else
                    { 
                      prueba=new byte[bytes.length+logitud];  
                      
                      byte[]aux=JasperRunManager.runReportToPdf(reportFile.getPath(),parameters,conex.miconexion);
                   //   System.arraycopy(aux,0, prueba,0, prueba.length); 
                      
                      logitud=logitud+aux.length; 
                      
                    }
                    
                   
                     
                     
                     
             
                     
            } 

   
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);
    ouputStream.flush();
     
    %>

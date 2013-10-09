<%-- 
    Document   : Guardar_Fiile
    Created on : 04-sep-2013, 15:11:33
    Author     : 2012
--%>


<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>

<%
	   	/*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
        int positionFile=0;
		/*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
		/*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);

        for(int i=0;i<items.size();i++)
        {
			/*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
            
            if (!item.isFormField())
            {
               
             positionFile=i;   
	
            }
            
            
	//directorio donde se guardara la foto
            if(item.getFieldName().equals("campoCarpeta")) 
              {
                String strDir="/home/Eapiis_Server/INDICESLIBROS/"+item.getString().trim();  
                File SaveDir=new File(strDir );
                FileItem itemFile = (FileItem) items.get(positionFile);//archivo subido
                if (SaveDir.isDirectory()) 
                    {                        
                        /*cual sera la ruta al archivo en el servidor*/
                        File archivo_server = new File(strDir+"/"+itemFile.getName());				
                        itemFile.write(archivo_server);
                         response.sendRedirect("subirfileindex.jsp?isbn="+item.getString());
                        
                        
                        
                    }
                else
                {
                    SaveDir.mkdir();//creando el directorio si no existe 
                    File archivo_server = new File(strDir+"/"+itemFile.getName());				
                    itemFile.write(archivo_server);
                    response.sendRedirect("subirfileindex.jsp?isbn="+item.getString());
                   
                        
                }
                
              }
            
            
            
            
            
            
        }
        
        
%>

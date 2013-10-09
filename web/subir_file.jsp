<%@page import="org.apache.poi.ss.usermodel.PrintCellComments"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>
    <body>
        <h1>Datos recividos en el servidor</h1> 
        <hr/>         <hr/> 
        <% 
            //String nombreCarpeta=fileItemTemp.getFieldName()("isbn").trim();
            String nombredir="";  
        %>
        <p> 
            <%
                if (ServletFileUpload.isMultipartContent(request)) 
                {
                    ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                    List fileItemsList = servletFileUpload.parseRequest(request);
                    String nombreArchivoOpcional = "";
                    String nombreCarpeta = "";
                    
                    FileItem fileItem = null;
                    Iterator it = fileItemsList.iterator();
                    while (it.hasNext())
                        {
                        FileItem fileItemTemp = (FileItem) it.next();
                        if (fileItemTemp.isFormField()) 
                        {
            %> 
                            <b>Información del Valor:</b><br/> 
                            Nombre del Campo: <%= fileItemTemp.getFieldName()%><br/> 
                            Valor del Campo: <%= fileItemTemp.getString()%><br/><br/> 
            <%
                            if (fileItemTemp.getFieldName().equals("nombreArchivo")) 
                            {
                                nombreArchivoOpcional = fileItemTemp.getString();
                            }
                            if (fileItemTemp.getFieldName().equals("campoArchivo")) 
                            {
                                nombredir = fileItemTemp.getString();
                            }
                            if(fileItemTemp.getFieldName().equals("campoCarpeta")) 
                            {
                                nombreCarpeta=fileItemTemp.getString();
                            }
                        
                        
                        
                       } 
                       else
                        fileItem = fileItemTemp;
                }
                if (fileItem != null) 
                {
                    String nombreArchivo = fileItem.getName();
            %> 
                    <b>Información del Archivos Subido:</b><br/> 
                    Tipo de Contenido: <%= fileItem.getContentType()%><br/> 
                    Nombre del Campo: <%= fileItem.getFieldName()%><br/> 
                    Nombre del Archivo: <%= nombreArchivo%><br/> 
                    Tamaño: <%= fileItem.getSize()%><br/><br/>  
                    Ruta de la imagen es:<%=request.getContextPath()%>/<%= nombreArchivo%><br/><br/>  
            
            
              
            <%
                /*  Guarde el archivo subido si su tamaño es mayor que 0.*/
                if (fileItem.getSize()>0) 
                {
                    if (nombreArchivoOpcional.trim().equals("")) 
                    {
                        nombreArchivo = FilenameUtils.getName(nombreArchivo);
                    }
                    else 
                    {
                        nombreArchivo = nombreArchivoOpcional;
                    }
                    //-->para Windows
                   // String dirNombre= "d:\\IMAGENES\\";
                    //String dirNombre = "../../INDICESLIBROS/"+nombredir.trim()+"/";
                    String dirNombre = "/home/Eapiis_Server/INDICESLIBROS/";                    
                    File saveTo = new File(dirNombre+nombreCarpeta+"/"+ nombreArchivo);                   
                    File saveDir = new File("/home/Eapiis_Server/INDICESLIBROS/"+nombreCarpeta.trim());
                     try 
                     {
                        if(saveDir.isDirectory())                                                       
                        {                                                       
                        fileItem.write(saveTo);    
                        response.sendRedirect("../Admnistrador");            
                        }
                        else
                         {
                             saveDir.mkdir();
                             fileItem.write(saveTo);   
                             response.sendRedirect("../Admnistrador");
                                              
                        }
                            
            %>  
               <script>alert("El archivo se a guardado Correctamente en el servidor");</script>
                
            <%
            //response.sendRedirect("../Admnistrador/index.jsp");
            } catch (Exception e) 
            {
                out.println(e.getMessage()+nombreCarpeta);
            %> 
            <script>alert("Se produjo error al intentar Guardar el Archivo ");</script> 
            
            <%              
            }
                        }
                    }
                }
                
            %> 
        </p> 

    </body>
</html>

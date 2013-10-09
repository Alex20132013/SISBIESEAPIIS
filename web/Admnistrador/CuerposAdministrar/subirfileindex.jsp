<%-- 
    Document   : subirfileindex
    Created on : 04-sep-2013, 11:40:05
    Author     : 2012
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           
    </head>
    <body>
        <%
          if(request.getParameter("isbn")!=null)
          {
          
          
            
        %>
        <h2>Se ha subido correctamente el indice</h2>
        <form id="frmFile" action="Guardar_Fiile.jsp" method="post" enctype="multipart/form-data"> 
            <p><br/> 
            Siguiente indice: 
            <input name="campoArchivo" type="file" title="Cargar Una imagen Valida"  required/><br/> 
            
            <label>ISBN Libro:</label> <input id="inISBN" name="campoCarpeta" type="text" value="<%=request.getParameter("isbn")  %>" required/> 
            
            </p> 
             
            <p> 
                <button  class="submit"  type="submit"  >Enviar Foto</button>
                <input  class="submit" type="button" value="Finalizar" onclick="ReloadPage();"/>
            </p> 
              
        </form>
            <%
             }
          
            else
          {
             %>
             <form id="frmFile" action="Guardar_Fiile.jsp" method="post" enctype="multipart/form-data"> 
            <p><br/> 
            Subida de indeces al servidor: 
            <input name="campoArchivo" type="file" title="Cargar Una imagen Valida"  required/><br/> 
            
            <label>ISBN Libro:</label> <input id="inISBN" name="campoCarpeta" type="text" required/> 
            
            </p> 
             
            <p> 
                <button  class="submit"  type="submit"  >Enviar indices</button>
                <input  class="submit" type="button" value="Finalizar" onclick="ReloadPage();"/>
            </p> 
            <div id="dvMessage">
                
            </div>     
             
             </form>
             
             <%
          }
              %>
    </body>
</html>

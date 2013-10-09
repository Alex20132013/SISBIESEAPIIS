
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form action="subir_file.jsp" method="post" enctype="multipart/form-data"> 
        <br/> 
            
        
        <a href="../WebApplication1 >visualizar "</a>
        <%
           out.print(System.getProperty("user.dir"));        
        %>
        <br/>
        
        
        
            <button  class="submit"  type="submit" >Enviar Foto</button>
            <button  class="submit" type="reset" >Restablecer</button>
        </p> 
    </form> 
    </body>
</html>

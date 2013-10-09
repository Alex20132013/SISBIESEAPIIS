<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Biblioteca Especializada</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Css/estilosGeneral.css" rel="stylesheet" type="text/css"/>
        <link href="../../Css/estilomenu.css" rel="stylesheet" type="text/css"/>
        <link href="../../Css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
        <script src="../../javascripts/jquery.js" type="text/javascript"></script>
        <script src="../../javascripts/eventologin.js" type="text/javascript"></script>
        <script src="../../javascripts/jquery.tipsy.js" type="text/javascript"></script>
        <script src="../../javascripts/eventologin2.js" type="text/javascript"></script>
        <script src="../../javascripts/jquery.pop.js" type="text/javascript"></script>
    </script>
    </head>
    <body>
        <form>
            
                <% request.getRequestDispatcher("../cabeza_administrador.jsp").include(request, response); %>
                 <% request.getRequestDispatcher("../CuerposAdministrar/LibrosObsevadosCuerpo.jsp").include(request, response); %>
                <% request.getRequestDispatcher("../pie_administrador.jsp").include(request, response);%>
                
        </form>
    </body>
</html>


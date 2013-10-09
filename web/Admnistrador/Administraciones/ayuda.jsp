<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Biblioteca Especializada</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Css/estilosGeneral.css" rel="stylesheet" type="text/css"/>
        <link href="../../Css/estilomenu.css" rel="stylesheet" type="text/css"/>
        <link href="../../Css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
        <link href="../../Css/RegistroAdm.css" rel="stylesheet" type="text/css"/>
        <link href="../../Css/demo_page.css" rel="stylesheet" type="text/css"/>
        <link href="../../Css/demo_table.css" rel="stylesheet" type="text/css"/>
        <link href="../../Css/dialogo.css" rel="stylesheet" type="text/css"/>
        
        <script src="../../javascripts/jquery.js" type="text/javascript"></script>
        <script src="../../javascripts/eventologin.js" type="text/javascript"></script>
        <script src="../../javascripts/jquery.tipsy.js" type="text/javascript"></script>
        <script src="../../javascripts/eventologin2.js" type="text/javascript"></script>
        <script src="../../javascripts/jquery.pop.js" type="text/javascript"></script>
        <script src="../../javascripts/jquery.dataTables.min.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript" src="../../javascripts/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="../../javascripts/jquery.dataTables.js"></script>
        
	<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').dataTable( {
					"sPaginationType": "full_numbers"
				} );
			} );
	</script>
    </head>
    <body>
        <form>
            
                <% request.getRequestDispatcher("../cabeza_administrador.jsp").include(request, response); %>
                 <% request.getRequestDispatcher("../CuerposAdministrar/ayudacuerpo.jsp").include(request, response); %>
                <% request.getRequestDispatcher("../pie_administrador.jsp").include(request, response);%>
                
        </form>
    </body>
</html>


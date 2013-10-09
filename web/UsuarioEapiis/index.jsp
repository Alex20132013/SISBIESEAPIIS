<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        <title>Biblioteca Especializada</title>
        
        <!--Importando estilo para las tablas-->
       <link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>

      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../Css/estilosGeneral.css" rel="stylesheet" type="text/css"/>     
        <link href="../Css/estilomenu.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
        <link href="../Css/estiloAutocompletable.css" media="screen, projection" rel="stylesheet" type="text/css">
        
        <!--<link href="../Css/CssAdministrador/RegistroAdm.css" rel="stylesheet" type="text/css"/>-->
        <link href="../Css/CssAdministrador/RegistroLibros.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/CssAdministrador/estiloRegistro.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/CssAdministrador/estiloRegistro_1.css" rel="stylesheet" type="text/css"/>
        <!--Estilo para Apan-->
        <link href="../Css/estiloSpan.css" rel="stylesheet" type="text/css"/>
       
        <script src="../javascripts/eventologin.js" type="text/javascript"></script>
       <script src="../javascripts/jquery.tipsy.js" type="text/javascript"></script>
        <script src="../javascripts/eventologin2.js" type="text/javascript"></script>
        <script src="../javascripts/jquery.pop.js" type="text/javascript"></script>
       <!-- <script src="../javascripts/validacionContrasena.js" type="text/javascript"></script>-->
        <!--Jquery para poder Mostrar los enlaces de los menus-->
         <script src="../javascripts/listarDiv.js" type="text/javascript"></script>
        
        <!--importacion de Modernazr para ver la compativilidad de los navegadores-->
        <script src="../javascripts/modernizr.custom.js" type="text/javascript"></script>
        <script src="../javascripts/FuncionesDivFlotantes.js" type="text/javascript"></script>
        <!--<script id="estilo" src="*" type="text/javascript"></script>
         Para la tabla -->
        <link href="../Css/CssAdministrador/EstiloTabla1.css" rel="stylesheet" type="text/css" media="screen" />
        <!-- <script type="text/javascript" src="../javascripts/TablaClock.js"></script> -->
        
        <script src="../javascripts/ContenidoAjax.js" type="text/javascript"></script>
        <!-- carrucel portada -->
       <link type="text/css" href="../Css/CssAdministrador/estiloImagenesPortada.css" rel="stylesheet" />
        
        <script type="text/javascript" src="../javascripts/jqueryImagenesPortada/jquery.pikachoose.js"></script>
        <script type="text/javascript" src="../javascripts/jqueryImagenesPortada/funn.js"></script>
        <!--Div Flotante-->
        <script type="text/javascript" language="javascript" src="../javascripts/dialogos.js"></script>
        <link href="../Css/dialogo.css" rel="stylesheet" type="text/css"/>  
        
        <!--<link href="jquery.autocomplete.css" rel="stylesheet" type="text/css"/>  
        <link href="style.css" rel="stylesheet" type="text/css"/>  
        <script type="text/javascript" language="javascript" src="jquery.autocomplete.js"></script>
        <script type="text/javascript" language="javascript" src="jquery-1.4.2.min.js"></script>-->
    </head>
    <body>
        <form>
            <%
                HttpSession misession = request.getSession(true);
                if (misession.getAttribute("USER")!= null) 
                {
            %>
            <% request.getRequestDispatcher("cabeza_UsuarioEapiis.jsp").include(request, response);%>
            <%//@ include file="cabeza_UsuarioEapiis.jsp" %>
            <% request.getRequestDispatcher("cuerpo_UsuarioEapiis.jsp").include(request, response);%>
            <%//@ include file="cuerpo_UsuarioEapiis.jsp" %>
            <%//request.getRequestDispatcher("../Pie.jsp").include(request, response);%>
            <%@ include file="../Pie.jsp" %>

            <%  
                 }                
              else
               {
                    response.sendRedirect("../index.jsp");
               }
                  
           %>
        </form>
    </body>
</html>

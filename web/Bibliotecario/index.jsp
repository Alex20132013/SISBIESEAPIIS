
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <!--  <meta http-equiv="refresh" content="5; http://10.0.9.197:8084/SISBIESEAPIIS/Bibliotecario">-->
        <title>Biblioteca Especializada</title>
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
               
    </head>
    <body>
        <form>
            <%
            HttpSession misesion=request.getSession(true);
            if(misesion.getAttribute("USER")!=null )
            {
                   Object[]administrador=(Object[])misesion.getAttribute("USER");
                   if(administrador[0].equals("B")  )
                   {
            %>
            <%//@ include file="cabeza_Bibliotecario.jsp" %>
            <%//@ include file="cuerpo_Bibliotecario.jsp" %>            
            <%//@ include file="pie_Bibliotecario.jsp"%>
             <% request.getRequestDispatcher("cabeza_Bibliotecario.jsp").include(request, response);%>
             <% request.getRequestDispatcher("cuerpo_Bibliotecario.jsp").include(request, response);%>
             <%//request.getRequestDispatcher("../Pie.jsp").include(request, response);%>
                <%@ include file="../Pie.jsp" %>
             <%
                   } 
                   else 
                  {
                     response.sendRedirect("../index.jsp");
                  }
                 }
              else
               {
                    response.sendRedirect("../index.jsp");
               }                               
                 %> 
        </form>
    </body>
</html>

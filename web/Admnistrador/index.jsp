<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Biblioteca Especializada</title>
        <!--llamada por el confilcto para mostrar el dialog-->
        <%// request.getRequestDispatcher("../llamdasDIVDFlotante.jsp").include(request, response);%>
        <%@ include file="../llamdasDIVDFlotante.jsp" %>
                    
         <link href="../Css/estilosGeneral.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/estilomenu.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
       <!-- <link href="../Css/CssAdministrador/RegistroAdm.css" rel="stylesheet" type="text/css"/>
       <link href="../Css/CssAdministrador/estiloRegistro.css" rel="stylesheet" type="text/css"/>-->
       <link href="../Css/CssAdministrador/RegistroLibros.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/CssAdministrador/estiloRegistro_1.css" rel="stylesheet" type="text/css"/>

        <script src="../javascripts/eventologin.js" type="text/javascript"></script>
       <script src="../javascripts/jquery.tipsy.js" type="text/javascript"></script>
        <script src="../javascripts/eventologin2.js" type="text/javascript"></script>
        <script src="../javascripts/jquery.pop.js" type="text/javascript"></script>
      <!--  <script src="../javascripts/validacionContrasena.js" type="text/javascript"></script>-->

        <!--importacion de Modernazr para ver la compativilidad de los navegadores-->
        <script src="../javascripts/modernizr.custom.js" type="text/javascript"></script>
        <script src="../javascripts/FuncionesDivFlotantes.js" type="text/javascript"></script>
        <!--<script id="estilo" src="*" type="text/javascript"></script>
         Para la tabla -->
        <link href="../Css/CssAdministrador/EstiloTabla1.css" rel="stylesheet" type="text/css" media="screen" />
        <!--          <script type="text/javascript" src="../javascripts/TablaClock.js"></script>-->
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
                   if(administrador[0].equals("A") || administrador[0].equals("S") )
                   {
            %>
                 <% request.getRequestDispatcher("cabeza_administrador.jsp").include(request, response); %>
                 <%//@ include file="cabeza_administrador.jsp" %>
                 <%//@ include file="cuerpo_administrador.jsp" %>
                 <% request.getRequestDispatcher("cuerpo_administrador.jsp").include(request, response); %>
                 <%//@ include file="pie_administrador.jsp" %>
                 <%// request.getRequestDispatcher("../Pie.jsp").include(request, response);%>
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


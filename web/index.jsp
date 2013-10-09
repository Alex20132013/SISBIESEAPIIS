
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Biblioteca Especializada</title>
        <link href="Css/estilosGeneral.css" rel="stylesheet" type="text/css"/>     
        <link href="Css/estilomenu.css" rel="stylesheet" type="text/css"/>
        <link href="Css/front.css" media="screen, projection" rel="stylesheet" type="text/css">

        <link href="Css/RegistroAdm.css" rel="stylesheet" type="text/css"/>
        <link href="Css/RegistroLibros.css" rel="stylesheet" type="text/css"/>
        <link href="Css/estiloRegistro.css" rel="stylesheet" type="text/css"/>
        <!--para regisrtro del Login y mas-->
        <link href="Css/estiloRegistro_1.css" rel="stylesheet" type="text/css"/>

        <script src="javascripts/jquery.js" type="text/javascript"></script>
        <script src="javascripts/eventologin.js" type="text/javascript"></script>
        <script src="javascripts/jquery.tipsy.js" type="text/javascript"></script>
        <!--    <script src="javascripts/eventologin2.js" type="text/javascript"></script>-->
        <script src="javascripts/jquery.pop.js" type="text/javascript"></script>
        <script src="javascripts/listarDiv.js" type="text/javascript"></script>
        <script src="javascripts/validacionContrasena.js" type="text/javascript"></script>

        <!--importacion de Modernazr para ver la compativilidad de los navegadores-->
        <script src="javascripts/modernizr.custom.js" type="text/javascript"></script>


        <script src="javascripts/FuncionesDivFlotantes.js" type="text/javascript"></script>
        <!--  <script id="estilo" src="*" type="text/javascript"></script>-->
        <!-- Para la tabla 
        <link href="Css/EstiloTabla1.css" rel="stylesheet" type="text/css" media="screen" />
        <script type="text/javascript" src="/javascripts/TablaClock.js"></script>-->
        <!--  -->
        <script src="javascripts/ContenidoAjax.js" type="text/javascript"></script>

        <link type="text/css" href="Css/estiloImagenesPortada.css" rel="stylesheet" />
        <script type="text/javascript" src="javascripts/jqueryImagenesPortada/jqueryAnimacionPortada.js"></script>
        <script type="text/javascript" src="javascripts/jqueryImagenesPortada/jquery.pikachoose.js"></script>
        <script type="text/javascript" src="javascripts/jqueryImagenesPortada/funn.js"></script>
        
    </head>

    <body>
        <form>
            <%
                HttpSession sesionuser = request.getSession(true);
                Object[] user = null;

                if (session.getAttribute("USER") != null) 
                {
                    user = (Object[]) session.getAttribute("USER");
                    if (user.length == 3) {
                        if (user[0].toString().equals("A") || user[0].toString().equals("S")) 
                        {
                            response.sendRedirect("Admnistrador/index.jsp");
                        } else 
                        {
                            response.sendRedirect("Bibliotecario/index.jsp");
                        }

                    } else 
                    {
                        response.sendRedirect("UsuarioEapiis/index.jsp");
                    }

                }
                else
                {

            %>                     
            <% request.getRequestDispatcher("Cabeza.jsp").include(request, response);%>
            <% request.getRequestDispatcher("Cuerpo.jsp").include(request, response);%>
            <%@include file="Pie.jsp" %>
            <%
                }
            %>
        </form>
    </body>
</html>
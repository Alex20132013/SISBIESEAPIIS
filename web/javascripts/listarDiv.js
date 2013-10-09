//=====================================INICIO LLAMADAS ADMINISTRADOR=====================


//=====================================INICIO LLAMADAS USUARIOS EAPIIIS=====================
function editarPerfilCuerpo()
        {

            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/editarPerfilCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Catalogo").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

        }

function cuerpo_UsuarioEapiis()
        {

            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerpo_UsuarioEapiis.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

        }

        function PrestamoLibroCuerpo()
        {

            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/PrestamoLibroCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }


                        });

        }
        function PrestamoRevistasCuerpo()
        {
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/PrestamoRevistasCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });
        }
   function PrestamoTesisCuerpo()
   {
       $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/PrestamoTesisCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });
   }

  function SugerenciasCuerpo(){
        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/SugerenciasCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }
                        });

  }
  function AcercaBibliotecaCuerpo(){
        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/AcercaBibliotecaCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }
                        });
  }
  function AcercaDesarrolladoresCuerpo(){

       $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/AcercaDesarrolladoresCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });
  }
  function ManualUsuarioCuerpo(){
       $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/ManualUsuarioCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

  }
 function frmRegistroUsuarioCuerpo(){

                   $.ajax({

                            url:"frmRegistroUsuarioCuerpo.jsp",
                            success: function(result)
                            {
                                //$("#Seccion").hide();
                                $("#signin_menu").hide();
                                $("#Catalogo").html(result);


                            }


                        });

 }
function frmRecuperarContrasena(){
        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"frmRecuperarContrasena.jsp",
                            success: function(result)
                            {
                                $("#signin_menu").hide();
                                $("#Catalogo").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }

                        });
}
//=====================================FIN LLAMADAS USUARIOS EAPIIIS=====================

//=====================================INICIO LLAMADAS USUARIOS BIBLIOTECARIO============

function Inicio_Bibliotecario(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerpo_Bibliotecario.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }


                        });

 }

 function HabilitarUsuarioCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/HabilitarUsuarioCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }


                        });

 }
 function PagoUsuarioCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/PagoUsuarioCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
 function MantenimientoUsuarioCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/MantenimientoUsuarioCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
 function LibrosCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/LibrosCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
 function LibrosObservadosCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/LibrosObservadosCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
// function LibrosAdquiridosCuerpo(){
//
//        $.ajax({
//                            //url:'autoSuggets.php?query='+autosugget,
//                            url:"CuerposBibliotecario/LibrosAdquiridosCuerpo.jsp",
//                            success: function(result)
//                            {
//                                $("#Contenido").html(result);
////                                var btnbuscar=$("#btnBuscar").val();
////
////                               window.location="Buscar.php?btnbuscar="+btnbuscar;
////                               return false;
//                            }
//
//
//                        });
//
// }
 function LibrosPrestadosCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/LibrosPrestadosCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
// function LibrosDevueltosCuerpo(){
//
//        $.ajax({
//                            //url:'autoSuggets.php?query='+autosugget,
//                            url:"CuerposBibliotecario/LibrosDevueltosCuerpo.jsp",
//                            success: function(result)
//                            {
//                                $("#Contenido").html(result);
////                                var btnbuscar=$("#btnBuscar").val();
////
////                               window.location="Buscar.php?btnbuscar="+btnbuscar;
////                               return false;
//                            }
//
//
//                        });
//
// }
 function PrestamosValidados()
 {
                                 
                   $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/PrestamosCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

     

 }
 
 function PrestamosNoValidados()
 {
              $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/PrestamosNoValidadosCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }

                        });

 }
function DevolucionesCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/DevolucionesCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }


                        });

 }
// function ConfiguracionFeriadosCuerpo(){
//
//        $.ajax({
//                            //url:'autoSuggets.php?query='+autosugget,
//                            url:"CuerposBibliotecario/ConfiguracionFeriadosCuerpo.jsp",
//                            success: function(result)
//                            {
//                                $("#Contenido").html(result);
//
//                            }
//
//
//                        });
//
// }
// function ConfiguracionHoraCuerpo(){
//
//        $.ajax({
//                            //url:'autoSuggets.php?query='+autosugget,
//                            url:"CuerposBibliotecario/ConfiguracionHoraCuerpo.jsp",
//                            success: function(result)
//                            {
//                                $("#Contenido").html(result);
////                                var btnbuscar=$("#btnBuscar").val();
////
////                               window.location="Buscar.php?btnbuscar="+btnbuscar;
////                               return false;
//                            }
//
//
//                        });
//
// }
 function InformeLibrosCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/InformeLibrosCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
 function InformeRevistasCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/InformeRevistasCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
 function InformeTesisCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/InformeTesisCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }

  function biAcercaBibliotecaCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/AcercaBibliotecaCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
 function biAcercaDesarrolladoresCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/AcercaDesarrolladoresCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }

function biManualUsuarioCuerpo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposBibliotecario/ManualUsuarioCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
 function CatalogoPrestamo(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposUsuarioEapiis/CatalogoPrestamo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
//                                var btnbuscar=$("#btnBuscar").val();
//
//                               window.location="Buscar.php?btnbuscar="+btnbuscar;
//                               return false;
                            }


                        });

 }
 //=============================LISTAR PAGINAS INDEX PRINCIPAL
 function inicioIndex(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"Cuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }
                        });

 }
 function organigrama(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerposIndex/organigrama.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }
                        });

 }

 function documentaciones(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerposIndex/documentaciones.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }
                        });

 }
 function referencias(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerposIndex/referencias.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }
                        });

 }

 function contactos(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerposIndex/contactos.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }
                        });

 }
 function AcercaBibliotecaCuerpop(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerposIndex/AcercaBibliotecaCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }
                        });

 }
 function AcercaDesarrolladoresCuerpop(){

        $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerposIndex/AcercaDesarrolladoresCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }
                        });

 }
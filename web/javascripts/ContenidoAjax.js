function IndiceRegistroCuerpo()
        {
           
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposAdministrar/IndiceRegistroCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }
                            
                            
                        });
            
        }

function Inicio()
        {
           
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"cuerpo_administrador.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }
                            
                            
                        });
            
        } 
function UsuCuerpoAdm()
        {
           
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposAdministrar/UsuCuerpoAdm.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                               
                            }
                            
                            
                        });
            
        }
function UsuCuerpoBibliotecario()
        {
           
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposAdministrar/UsuCuerpoBibliotecario.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }
                            
                            
                        });
            
        }
function UsuCuerpoEAPIIS()
        {
           
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposAdministrar/UsuCuerpoEAPIIS.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }
                            
                            
                        });
            
        }
function  LibrosRegistroCuerpo_1()
        {
           
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposAdministrar/LibrosRegistroCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }
                            
                            
                        });
            
}
        
function  LibrosRegistroCuerpo()
        {
           
            $.ajax({
                            
                            url:"CuerposAdministrar/LibrosRegistroCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }
                            
                            
                        });
            
        }
function  AgregarEditorialCuerpo()
        {
           
            $.ajax({
                            
                            url:"CuerposAdministrar/AgregarEditorialCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }
                            
                            
                        });
            
        }
function  AgregarEspecialidadCuerpo()
        {
           
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposAdministrar/AgregarEspecialidadCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);
                            }
                            
                            
                        });
            
        }
        
        
function LibrosTodosCuerpo()
        {
           
            $.ajax({
                            //url:'autoSuggets.php?query='+autosugget,
                            url:"CuerposAdministrar/LibrosTodosCuerpo.jsp",
                            success: function(result)
                            {
                                $("#Contenido").html(result);

                            }
                            
                            
                        });
            
 }
function LibrosObsevadosCuerpo()
{

    $.ajax({
                   
                    url:"CuerposAdministrar/LibrosObsevadosCuerpo.jsp",
                    success: function(result)
                    {
                        $("#Contenido").html(result);

                    }


                });

}
function AdmPrestamoLibroCuerpo()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/AdmPrestamoLibroCuerpo.jsp",
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
function AdmDevolucionLibroCuerpo()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/AdmDevolucionLibroCuerpo.jsp",
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
function impCodigoBarra()
{
    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/impCodigoBarraCuerpo.jsp",
                    success: function(result)
                    {
                        $("#Contenido").html(result);

                    }


                });

}
function impCodigoDewey()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/impCodigoDeweyCuerpo.jsp",
                    success: function(result)
                    {
                        $("#Contenido").html(result);

                    }


                });

}

function ayudacuerpo()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/ayudacuerpo.jsp",
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
function ReporAdministradorCuerpo()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Usuario/ReporAdministradorCuerpo.jsp",
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
function ReporBibliotecarioCuerpo()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Usuario/ReporBibliotecarioCuerpo.jsp",
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
function ReporEAPIISCuerpo()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Usuario/ReporEAPIISCuerpo.jsp",
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
function ReporEAPIISPrestamoFecha()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Usuario/ReporEAPIISPrestamoFecha.jsp",
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
function ReporteEAPIISDevolucionFecha()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Usuario/ReporteEAPIISDevolucionFecha.jsp",
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
function ReporEAPIISObservados()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Usuario/ReporEAPIISObservados.jsp",
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
function ReporEAPIISSancionados()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Usuario/ReporEAPIISSancionados.jsp",
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
function ReporEAPIISRankingPrestamos()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Usuario/ReporEAPIISRankingPrestamos.jsp",
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
function ReporLibroRankingPrestamo()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Libro/ReporLibroRankingPrestamo.jsp",
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
function ReporLibrosPrestados()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Libro/ReporLibrosPrestados.jsp",
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
function ReporLibroDevueltos()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Libro/ReporLibroDevueltos.jsp",
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
function ReporLibroObservado()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Libro/ReporLibroObservado.jsp",
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
function ReporLibroDaniado()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Observacion/ReporLibroDaniado.jsp",
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
function ReporObsUsuario()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Observacion/ReporObsUsuario.jsp",
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

function ReporObsLibrosDevueltos()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Observacion/ReporObsLibrosDevueltos.jsp",
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
function ReporObsLibros()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/Reporte/Observacion/ReporObsLibros.jsp",
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
function RegistrarseUsuarioEapiis()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"RegistrarseUsuarioEapiis.jsp",
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

function HabilitarUsuarioCuerpo()
{

    $.ajax({
                    //url:'autoSuggets.php?query='+autosugget,
                    url:"CuerposAdministrar/HabilitarUsuarioCuerpo.jsp",
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

function ReloadPagina()
{
    location.reload(true);
    alert("esta funcionado");    
}



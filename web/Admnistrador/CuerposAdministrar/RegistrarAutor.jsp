<%@page import="Modelo.CAutor"%>
<%

String nombre=request.getParameter("txtNombre");
String apellidos=request.getParameter("txtApellidos");
String especialidad=request.getParameter("txtEspecialidad");

CAutor autor=new CAutor(nombre, apellidos, especialidad);

boolean bandera=autor.InsertRegisto();

if(bandera==true)
{
    out.print("se ha registrado correctamente");

}
else
{
  out.print("Insercion falleda!!");
}
%>

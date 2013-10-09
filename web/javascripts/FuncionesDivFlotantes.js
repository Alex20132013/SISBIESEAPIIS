
function apagarAutor(){
      var contenedor = document.getElementById("Autor");
      contenedor.style.visibility = "hidden";
      contenedor.style.display="none";
    }
function encenderAutor(){
  var contenedor = document.getElementById("Autor");
  contenedor.style.visibility = "visible";
  contenedor.style.display="block"; 
  $("#isbnCopia").val($("#isbnLibro").val());
}

function apagarNuevoAutor()
{
      var contenedor = document.getElementById("NuevoAutor");
      contenedor.style.visibility = "hidden";
      contenedor.style.display="none";
}
function encenderNuevoAutor(){
 /* var contenedor = document.getElementById("NuevoAutor");
  contenedor.style.visibility = "visible";
  contenedor.style.display="block";*/
    $("#NuevoAutor").show();
}

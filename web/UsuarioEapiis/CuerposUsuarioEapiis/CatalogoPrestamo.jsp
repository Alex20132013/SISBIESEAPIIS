<div id="Catalogo">Cuerpo de la Pagina Biblioteca INDEX Modificado
        <%
           HttpSession misession=request.getSession(true);
           Object[]user=(Object[])misession.getAttribute("USER");
                   
           out.println("<li>Usauario:"+user[1].toString()+"</li>");
           out.println("<li>Categoria:"+user[0].toString()+"</li>");  
           out.println("<li>Correo:"+user[2].toString()+"</li>");                      
          //session.invalidate();               
        %>
 </div>
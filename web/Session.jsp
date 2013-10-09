<%-- 
    Document   : Session
    Created on : 27-mar-2013, 11:19:21
    Author     : 2012
--%>

<%@page import="Modelo.CSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         
        <%
         HttpSession sesion=request.getSession(true);  
        
        
       try {
             
         
          if ( sesion.getAttribute("USER")!=null  ) 
          {
              sesion.invalidate();
              response.sendRedirect("index.jsp");
            
          }
          else
          {
              String usuario=request.getParameter("username");
              String paswd=request.getParameter("password");
        
               CSession misesion=new CSession(usuario, paswd);
               Object[]user=misesion.Usuario();//es usuario?
            
            if (user!=null) 
            {
                
                
                if (user.length>4) 
                {
                     sesion.setAttribute("USER",user);
   %>
            <script type="text/javascript">
    
                 $(document).ready(function() 
                  {  
                 window.location="UsuarioEapiis/index.jsp"; 
            
                  
                 });
             </script>
   
   <%
                     //response.sendRedirect("UsuarioEapiis/index.jsp");
                }
                else
                {
                    if (user[0].equals("A")) 
                    {
                      sesion.setAttribute("USER",user);
   %>
                 <script type="text/javascript">
    
                 $(document).ready(function() 
                  {  
                 window.location="Admnistrador/index.jsp"; 
            
                  
                  });
                </script>
               
   <%
                      
                      //response.sendRedirect("Admnistrador/index.jsp");     
                    }
                    else
                    {
                        if (user[0].equals("B")) 
                        {
                          sesion.setAttribute("USER",user);
    %>
                 <script type="text/javascript">
    
                 $(document).ready(function() 
                  {  
                 window.location="Bibliotecario/index.jsp"; 
            
                  
                  });
                </script>        
    <%
                                  
                          
                          //response.sendRedirect("Bibliotecario/index.jsp");
                        }
                        else
                        {
                            sesion.setAttribute("USER",user);
   %>
                  <script type="text/javascript">
    
                 $(document).ready(function() 
                  {  
                 window.location="Admnistrador/index.jsp"; 
            
                  
                  });
                </script>     
   <%
                         
                         //response.sendRedirect("Admnistrador/index.jsp");
                        }
                    }
                    
                }
               
            }
            else    
            {
    %>
                               <label for="username">Email</label>
                               <input  id="username" value="" title="username" tabindex="4" type="email" required style="border-bottom-color:red;">

                               <p>
                                  <label for="password">ContraseÃ±a</label>
                                  <input id="password" id="password" value="" title="password" tabindex="5" type="password" required>
                               </p>
    <%
               // response.sendRedirect("index.jsp");
                //out.println("No existe usuario!!:");
               
            }    
            
            }
       
        }
        catch (Exception ex) 
            {
                out.println("ERROR!:"+ex.getLocalizedMessage());
            }
        finally 
       {            
            out.close();
        }
        %>
    </body>
</html>

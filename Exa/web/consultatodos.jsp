<%-- 
    Document   : consultatodos
    Created on : 15/04/2016, 08:08:29 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Todos</title>
    </head>
    <body>
        <%@page import ="java.sql.*, java.io.*" %>
         <%
        String boleta;
        Connection c = null;
        Statement s= null;
        ResultSet r = null;
         try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost/registro","root","");
                s = c.createStatement();
            }
            catch (SQLException error){
                out.print(error.toString());
            }
        try
        {
           boleta = request.getParameter("contrasenia");
           r= s.executeQuery("SELECT * FROM datos");
           out.println("<table border='1'>");
           
           while(r.next())
           {
                String nombre = r.getString("nombre");
                    String puesto = r.getString("puesto");
                    String sueldo = r.getString("sueldo");
             
               
               out.println("<tr>");
               out.println("<td>"+nombre+"</td>");
               out.println("<td>"+puesto+"</td>");
               out.println("<td>"+sueldo+"</td>");
               out.println("</tr>");
                       
           }
           out.println("</table>");
           out.println("<script>alert('son todos');</script>");
           out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001 URL=http://localhost:8080/Examen/'/>");
           
        }
        catch (SQLException error){
                out.print(error.toString());
        }
        
        %>
    </body>
</html>

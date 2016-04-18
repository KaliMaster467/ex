<%-- 
    Document   : consulta
    Created on : 15/04/2016, 07:56:33 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar</title>
    </head>
    <body>
        <h1> consultas</h1>
        <%@page import="java.sql.*,java.io.*" %>
        <p>
        <%
            String contrasenia;
            Connection c = null;
            Statement s = null;
            ResultSet r = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro", "root", "");
                s = c.createStatement();

            } catch (SQLException error) {
                out.print(error.toString());

            }
            try {
                contrasenia = request.getParameter("cotrasenia");
                r = s.executeQuery("select * from datos where contrasenia = '" + contrasenia + "';");
                if (r.next()) {
                    
              
                    String nombre = r.getString("nombre");
                    String puesto = r.getString("puesto");
                    String sueldo = r.getString("sueldo");
                    
        
                    out.println(nombre);
                    out.println(puesto);
                    out.println(sueldo);
                   ;
                    out.println("<script>alert('consulta exitosa')</script>");

                } else {
                    out.println("<script>alert('no exite la contraseña')</script>");

                }

            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>   
     <input  type="button" value="Pinchame" onClick=" window.location.href = 'index.html'">
    </body>
    </body>
</html>


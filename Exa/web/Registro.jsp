<%-- 
    Document   : Registro
    Created on : 15/04/2016, 07:40:09 AM
    Author     : Alumno
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>altas</h1>
    <%@page import="java.sql.*,java.io.*" %>
    <%
        String contrasenia = request.getParameter("contrasenia");
        String nombre = request.getParameter("nombre");
        String puesto = request.getParameter("puesto");
        String sueldo = request.getParameter("sueldo");
        
        Connection con = null;
        
        PreparedStatement pstatement = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro","root","");
            String querystring = "INSERT INTO datos values(?,?,?,?)";
            pstatement = con.prepareStatement(querystring);
            pstatement.setString(1,contrasenia);
            pstatement.setString(2,nombre);
            pstatement.setString(3,puesto);
            pstatement.setString(4,sueldo);
            pstatement.executeUpdate();
            out.println("<script>alert('Registro dado de alta exitosamente.')</script>");
            out.println("<META HTTP-EQUIV='REFRESH'CONTENT='.0000001 URL=http://localhost:8080/Examen/'/>");
            
        }
        catch(SQLException error)
        {
            out.print(error.toString());
        }
        catch(Exception e)
        {
            out.println(e.getLocalizedMessage());
            e.printStackTrace();
        }
        
        %>
    </body>
</html>
                  
        
    </body>
</html>
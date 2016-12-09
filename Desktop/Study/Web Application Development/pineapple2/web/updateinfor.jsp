<%-- 
    Document   : updateinfo
    Created on : Nov 21, 2016, 10:35:46 PM
    Author     : admin
--%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           try{
               
           String a = request.getParameter("username");
           String b = request.getParameter("password1");
           String c = request.getParameter("password2");
           String d = request.getParameter("first");
           String e = request.getParameter("last");
           String f = request.getParameter("birth");
           String g = request.getParameter("phonenum");
           String h = request.getParameter("address");
          
      String url = "jdbc:mysql://localhost:3306/e-commerce";
      String user = "root";
      String pswd = "password";
      
    Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection(url, user, pswd);
   Statement stmt = con.createStatement();
   ResultSet results;

   int i=stmt.executeUpdate("insert into user(username, password, first, last, birth, tel, address) values('"+a+"','"+b+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"')");
     if (i > 0) {
        response.sendRedirect("/pineapple2/login.jsp");
    }
     else {
         response.sendRedirect("/pineapple2/index.jsp");
     }
 }
    catch(Exception e){
            System.out.print(e);
                    e.printStackTrace();
                            }
        %>
    </body>
</html>

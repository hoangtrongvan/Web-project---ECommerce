<%-- 
    Document   : Customer-List
    Created on : Dec 8, 2016, 9:02:43 AM
    Author     : nhatduthan2405
--%>

<%@page import="Customer.User"%>
<%@page import="Customer.UserDAO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subcriber List</title>
        <style>
            body{
                margin: 0;

                padding : 0;
            }           
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){background-color: #EBDAFF}

            th {
                background-color: #BE85FF;
                color: white;
            }
            .integer{
                text-align: center;
                width: 40px;
                height: 20px;
                border-radius: .5rem;
                background-color: white;
                color: #333;
                margin-top: -12px;



            }
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 8px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }

            .button1 {
                background-color: #4CAF50;
                color: white;
                border: 2px solid #4CAF50;
            }

            .button1:hover {
                background-color: white; 
                color: black; 

            }


            .button3 {
                background-color: #f44336;
                color: white;
                border: 2px solid #f44336;
            }

            .button3:hover {
                background-color: white; 
                color: black; 

            }
            .chip {
                display: inline-block;
                padding: 0 25px;
                height: 50px;
                font-size: 16px;
                line-height: 50px;
                border-radius: 25px;
                background-color: #f1f1f1;
            }

            .chip img {
                float: left;
                margin: 0 10px 0 -25px;
                height: 50px;
                width: 50px;
                border-radius: 50%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
        <jsp:include page="../HeaderandFooter/horizon-nav.jsp" /> 

        <div style="padding:0;height:100%;">

            <table>
                <tr>
                    <th>Subcriber ID</th>
                    <th>Email</th>
                   
            
                <%
                    UserDAO userDAO = new UserDAO();
                    ArrayList<User> allSubcribers = userDAO.getAllSubcribers();
                    int i = 0;
                    Collections.reverse(allSubcribers);

                    for (User user : allSubcribers) {
                        int subID = user.getUid();
                        String subEmail = user.getEmail();
                        %>
                <tr>
                    
                    <td><%=subID%></td>
                    <td><%=subEmail%></td>
                  
                    
                </tr>

                <% }%>
            </table>

        </div>


        <script>
            var active = document.getElementById("sub");
            active.className += " active";
        </script>
    </body>
</html>

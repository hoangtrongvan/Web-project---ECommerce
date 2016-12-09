<%-- 
    Document   : Customer-List
    Created on : Dec 8, 2016, 9:02:43 AM
    Author     : nhatduthan2405
--%>

<%@page import="Customer.User"%>
<%@page import="Customer.UserDAO"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager List</title>
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

tr:nth-child(even){background-color: #FFDEDC}

th {
    background-color: #EB4B41;
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
    <th>Customer</th>
    <th>Date of Birth</th>
    <th>Phone Number</th>
    <th>Address</th>
    <th>Email</th>
    <% User loginUser = (User)session.getAttribute("loginUser");
            if (loginUser.getIsManager()==2){%>
     
        
    <th>Remove Manager</th>
    <%}%>
  </tr>
  <% 
      UserDAO userDAO = new UserDAO();
      ArrayList<User> allCustomers = userDAO.getAllUsers("1");
      int i=0; 
  
  for(User user : allCustomers){ 
            String firstname = user.getFirst_name();
            String lastname = user.getLast_name();
            String full_name = firstname + " " + lastname;
            String dob = user.getDob();
            String phone_number = user.getPhone_number();
            String address = user.getAddress();
            String ava_url = user.getImage_url();
            String email = user.getEmail(); 
            int uID = user.getUid();
            int isManager = user.getIsManager(); %>
    <tr>
        <td>
            <div class="chip">
                <img src="<%=ava_url%>" alt="Person" width="96" height="96">
                <%=full_name%>
            </div>
        </td>
        <td><%=dob%></td>
        <td><%=phone_number%></td>
        <td><%=address%></td>
        <td><%=email%></td>
        <% 
            if (loginUser.getIsManager()==2){%>
        <td>
            <form action="/Pineapple/userServlet?action=removeManager" method="post">
            <button value="<%=uID%>" type="submit" name="removeManager" class="button button3">Remove</button>
            </form>
        </td>
        <%}%>
    </tr>
    <%}%>
  
  
  </table>
  
</div>


       <script>
            var active = document.getElementById("mana");
            active.className += " active";
       </script>
    </body>
</html>

<%-- 
    Document   : Order-List
    Created on : Dec 5, 2016, 2:05:13 PM
    Author     : nhatduthan2405
--%>

<%@page import="Order.OrderDAO"%>

<%@page import="Order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List</title>
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

tr:nth-child(even){background-color: #FFEAD3}

th {
    background-color: #FF5B14;
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

        </style>
    </head>
     <body>
       <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
       <jsp:include page="../HeaderandFooter/horizon-nav.jsp" /> 
      


<div style="padding:0;height:100%;">
   
  <table>
  <tr>
    <th>Customer</th>
    <th>ProductID</th>
    <th>Product Name</th>
    <th>Price of Product</th>
    <th>Order Total</th>
    <th>Date</th>
    <th>Time</th>
    <th>Quantity</th>
    <th>Update Quantty</th>
    <th>Remove Order</th>
  </tr>
  <% 
      OrderDAO orderDAO = new OrderDAO();
      ArrayList<Order> allOrders = orderDAO.getAllOrders();
      Collections.reverse(allOrders);
      int i=0; 
  
  for(Order order : allOrders){ 
    String customer = order.getCustomer();
    String productID = order.getProduct_id();
    String date = order.getDate();
    String time = order.getTime();
    String productName = order.getProduct_name();
    float price = order.getPrice();
    float total = order.getTotal();
    int quantity = order.getQuantity(); 
    int orderID = order.getOrderID(); %>
    <tr>
        <td><%=customer%></td>
        <td><%=productID%></td>
        <td><%=productName%></td>
        <td><%="$" + price%></td>
        <td><%="$" + total%></td>
        <td><%=date%></td>
        <td><%=time%></td>
        
        <td>
            <form action="/Pineapple/orderServlet?action=update" method="post" id="updateForm<%=i%>">
            <input type="number" class="integer" value="<%=quantity%>" min="0" name="quantity<%=orderID%>">
            </form>
        </td>
        <td><button value="<%=orderID%>"  type="submit" name="update" class="button button1" form="updateForm<%=i%>">Update</button></td>
         
        <td>
            <form action="/Pineapple/orderServlet?action=remove" method="post">
            <button value="<%=orderID%>" type="submit" name="remove" class="button button3">Remove</button>
            </form>
            
            </td>
    </tr>
  <%  i++;}%>
  
  </table>
</div>
       <script>
            var active = document.getElementById("ord");
            active.className += " active";
       </script>
    </body>
</html>

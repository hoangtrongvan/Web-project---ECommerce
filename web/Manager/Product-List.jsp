<%-- 
    Document   : Order-List
    Created on : Dec 5, 2016, 2:05:13 PM
    Author     : nhatduthan2405
--%>

<%@page import="Products.Products"%>
<%@page import="Products.ProductDAO"%>
<%@page import="Order.OrderDAO"%>

<%@page import="Order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
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

tr:nth-child(even){background-color: #E3E3E3}

th {
    background-color: #1A1A1A;
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
.img_ava{
    border: 1px solid #ddd;
    border-radius: 4px;
    
    width : 200px;
    height :150px;
}
.linkto{
                text-decoration: none;
                color: #1A1A1A;
                font-size: 15pt
            }
            .linkto:visited{
                color: #1A1A1A;
            }
            .linkto:hover{
                text-decoration: underline;
            }
        </style>
    </head>
     <body>
       <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
       <jsp:include page="../HeaderandFooter/horizon-nav.jsp" /> 
      


<div style="padding:0;height:100%;">
   
  <table>
  <tr>
    
    <th>Product ID</th>
    <th>Avatar</th>
    <th>Category</th>
    <th>Product Name</th>
    <th>Remove Product</th>
    
  </tr>
  <% 
      ProductDAO productDAO = new ProductDAO();
      ArrayList<Products> allProducts = productDAO.getAllProducts();
      Collections.reverse(allProducts);
      int i=0; 
  
  for(Products product : allProducts){ 
    String productID = product.getProductID();
    
    String ava = product.getAva_url();
    String category = product.getCategory();
    String productName = product.getName();
    %>
    <tr>
        
        <td><a class="linkto" href="/Pineapple/Manager/editProduct.jsp?prodID=<%=productID%>"><%=productID%></a></td>
        <td>
        <img class="img_ava" src="<%=ava%>" alt="<%=productName%>" >
        </td>
        <td><%=category%></td>
        <td><%=productName%></td>
        
        
        <td>
            <form action="/Pineapple/productServlet?action=removeProduct" method="post">
            <button value="<%=productID%>" type="submit" name="remove" class="button button3">Remove</button>
            </form>
            
            </td>
    </tr>
  <%  i++;}%>
  
  </table>
</div>
       <script>
            var active = document.getElementById("prod");
            active.className += " active";
       </script>
    </body>
</html>

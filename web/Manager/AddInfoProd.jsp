<%-- 
    Document   : account
    Created on : Dec 6, 2016, 9:23:24 AM
    Author     : nhatduthan2405
--%>

<%@page import="ColorProduct.ColorProduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Customer.UserDAO"%>
<%@page import="Customer.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <style>
  .btn-upload{
    position: relative;
    overflow: hidden;
    display: inline-block;
     cursor: pointer;
}
.btn-upload input[type=file] {
    position: absolute;
    opacity: 0;
    z-index: 0;
    max-width: 100%;
    height: 100%;
    display: block;
     cursor: pointer;
}
.btn-upload .btn{
    padding: 8px 20px;
    background: #337ab7;
    border: 1px solid #2e6da4;
    color: #fff;
    border: 0;
    cursor: pointer;
}
.btn-upload:hover .btn{
    padding: 8px 20px;
    background: #2e6da4;
    color: #fff;
    border: 0;
}
</style>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    </head>
    <body>
        
 <form method="POST" action="/Pineapple/productServlet?action=addProduct" enctype="multipart/form-data" id="uploadAva">
         
<% 
   
    ArrayList<ColorProduct> chosenColors = (ArrayList<ColorProduct>)session.getAttribute("chosenColors");
            
            for (ColorProduct colorProd : chosenColors){
                String colorName = colorProd.getColor();
                String prodID = colorProd.getProdID();
             %>
             <input class="hidden" type="text" name="prodID" value="<%=prodID%>">
             <p>Choose image for <%=colorName%> color</p>
             <input type="file" name="<%=colorName%>" id="file"  accept='image/*' required/> 
             
<%}%>
<br><br>


<% String modelAmount = (String)session.getAttribute("modelAmount");
int amount = Integer.parseInt(modelAmount);
for (int i = 0;i<amount;i++){ %>
<h1>Model <%=i+1%></h1>
<textarea rows="10" cols="50" placeholder="General Information" name="generalInformation<%=i%>"></textarea><br>

<input type="text" name="price<%=i%>" placeholder="Price of model">
<%}%>


<%
     session.setAttribute("chosenColors", chosenColors);
        
       
        session.setAttribute("modelAmount", modelAmount);
        
           session.setMaxInactiveInterval(2*60*60);
        
%>
<input type="submit">
 </form>
 
    
      
       
             
             
             

        


    </body>
</html>

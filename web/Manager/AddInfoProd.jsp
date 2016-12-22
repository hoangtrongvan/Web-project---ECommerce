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
        <title>Add Product Info</title>
        <style>
   .inputText{
                width: 412px;
                padding: 12px 20px;
                margin: 8px 0;
                display : incline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
             .textarea{
                
                padding: 12px 20px;
                margin: 8px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .submit-button{
  
                width: 100px;
                background-color: #1C7FFF;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border : none;
                border-radius: 4px;
                cursor : pointer;
                    
            }
             .submit-button:hover, #myBtn:hover{
                background-color: #0A74FE;
            }
            .submit-button:hover{
                background-color: #0A74FE;
            }
            .title{
    font-weight: bold;
    font-size: 14pt;
}
.containerContent{
    padding: 20px 40px 20px 40px;
}
</style>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
        <jsp:include page="../HeaderandFooter/horizon-nav.jsp" /> 
        <div class="containerContent">
 <form method="POST" action="/Pineapple/productServlet?action=addProduct" enctype="multipart/form-data" id="uploadAva">
         
<% 
   
    ArrayList<ColorProduct> chosenColors = (ArrayList<ColorProduct>)session.getAttribute("chosenColors");
            
            for (ColorProduct colorProd : chosenColors){
                String colorName = colorProd.getColor();
                String prodID = colorProd.getProdID();
             %>
             <input class="hidden" type="text" name="prodID" value="<%=prodID%>">
             <p class="title">Choose image for <%=colorName%> color</p>
             <input type="file" name="<%=colorName%>" id="file"  accept='image/*' required/> 
             
<%}%>
<br><br>


<% String modelAmount = (String)session.getAttribute("modelAmount");
int amount = Integer.parseInt(modelAmount);
for (int i = 0;i<amount;i++){ %>
<p class="title">Model <%=i+1%></p>
<textarea class="textarea" rows="10" cols="50" placeholder="General Information" name="generalInformation<%=i%>"></textarea><br>

<input class="inputText" type="text" name="price<%=i%>" placeholder="Price of model">
<%}%>


<%
     session.setAttribute("chosenColors", chosenColors);
        
       session.setMaxInactiveInterval(2*60*60);
        session.setAttribute("modelAmount", modelAmount);
        
           session.setMaxInactiveInterval(2*60*60);
        
%>
<br><br>
<input type="submit" class="submit-button">
 </form>
 
    
      
       
             
             
        </div>    

        


    </body>
</html>

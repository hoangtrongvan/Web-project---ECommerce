<%-- 
    Document   : PineappleCart
    Created on : Nov 18, 2016, 8:37:56 PM
    Author     : nhatduthan2405
--%>

<%@page import="Products.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Products.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <style>
            .signup{
                 width: 100%;
               top: 0;
              
                
                padding-top: 60px;
                padding-bottom: 60px;
              
                
               
                
            }
            .signup-content{
               
                
               
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                border: 0 solid #333;
                border-radius: 4px;
                width: 80%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
               
            }
            .signup-header{
                padding: 2px 16px;
                color: black;
                border-bottom: 1px solid #d5d5d5;
                
            }
            .signup-body{
                padding: 2px 16px;
                 display: block;
                overflow: auto;
                
                
            }
            .signup-footer{
               
                padding: 8px 16px;
                color: black;
                border-top: 1px solid #d5d5d5;
                display: block;
                overflow: auto;
                
            }
           

.inputText{
                width: 327px;
                padding: 12px 20px;
                margin: 8px 0;
                display : incline-block;
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
            body {
                margin: 0;
    
                 padding : 0;
                 font-family: 'Open Sans', sans-serif;
            }
            .submit-button:hover{
                background-color: #0A74FE;
            }
            
            .cart-product{
                
               display:block;
            overflow:auto;
            padding: 5px;
                position: relative;
            }
            .cart-item-image{
                width: 20%;
                float: left;
                
                text-align: center;
            }
            .cart-item-image img{
                width: 110px;
                height: 78px;
            }
            .content-product-info{
                
                width: 78%;
                float: right;
            }
            .price-quantiy{
                list-style: none;
            }
            .price-quantiy li{
                display: inline-block;
                padding : 10px 0 10px 40px ;
                
              
            }
            .product-title{
                float: left;
                margin-left: 0;
            }
            
            .table-row{
                display: block;
                 border-bottom: 1px solid #d5d5d5;
                 
            }
            .product-price,.quantity-select,.sub-total{
                float: right;
                padding-left: 40px;
            }
            .clr{
                clear:both;
                 font-size:0;
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
            .removeItem{
                float: right;
                background: transparent;
                border: 0;
                color: #0085cf;
                cursor: pointer;
            }
            .removeItem:hover{
                text-decoration: underline;
            }
            .cart-product{
                border-bottom: 1px solid #d5d5d5;
            }
            .offer-summary{
                padding: 16px;
                color: black;
                
                display: block;
                overflow: auto;
                text-align: right;
                font-size: 18pt;
                
            }
            .product-title a{
                
                text-decoration: none;
                color: #333;
            }
            .product-title a:hover{
                color: #0085cf;
                
            }
            .remove-mask{
                position: absolute;
              
                background: linear-gradient(to bottom,rgba(230,247,255,.9),rgba(202,238,255,.9));
                border-radius: 4px;
                z-index: 50;
                width: 100%;
                
                top: 0;
                right: 0;
                bottom: 0;
                visibility: hidden;
                
                opacity: 0;
           
                
                
            }
            .remove-mask span{
                text-align: center;
                 top: 50%;
                 position: absolute;
                 left: 0;
                 width: 100%;
            }
          .buttonPress{
    background: linear-gradient(#fff,#ebebeb);
    border: 1px solid #b5b5b5;
    cursor: pointer;
    color: #0085cf;
    border-radius: 4px;
    padding: 15px 28px;
}
.buttonPress:hover{
    background: linear-gradient(#fff,#E3E3E3);
    border: 1px solid #b5b5b5;
    cursor: pointer;
    color: #0085cf;
    border-radius: 4px;
    padding: 15px 28px;
}
.removeandupdate{
   
}
           </style>

    </head>
    <body>
       <jsp:include page="../HeaderandFooter/navbar.jsp" />
                 <div class="signup">
        <div class="signup-content">
            <div class="signup-header" >
                <h2>Item In Your Bag</h2>
              
                
              
            </div>
                 <%
                     String uEmail = null;
            /* Get userEmail to name the session */
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uEmail")) uEmail = cookie.getValue();
            }
            }         
           /* Get available cart from session and display it on screen */ 
           ArrayList<Products> cart = new ArrayList<Products>();
           cart = (ArrayList<Products>)session.getAttribute(uEmail);
           int i=0; /* count variable to distinguish each button of delete */
           if (cart!=null && !cart.isEmpty()){
              double total = 0.0;
              
            %>
             <% 
                    /* display item in cart */ 
                    for(Products product : cart){ 
                        
                        String product_name = product.getName();
                        int product_quantity = product.getAmount();
                        double product_price = product.getPrice();
                        double subtotal = product_quantity*product_price;
                        String img_url = product.getImg_url();
                %>
            <div class="signup-body">
                
                
                 
                    
                    
                
            
          
                <div class="cart-product" id="item<%=i%>">
                     <div class="remove-mask" id="removeMask<%=i%>">
                        <span class="remove">Removing this item from your bag</span>
                    </div>
                    <div class="cart-item-image">
                        <img src="<% out.print(img_url); %>">
                    </div> 
                    <div class="content-product-info">
                        <div class="table-row">
                            
                               
                           
                           
                            <ul class="price-quantiy">
                                <li class="product-title"><b><a href="#"><% out.print(product_name); %></a></b></li>
                                <li class="sub-total"><b><% out.print( "$" + subtotal); %></b></li>
                                <li class="quantity-select">
                                    <form action="/Pineapple/productServlet?action=update" method="post" id="updateForm<%=i%>" >
                                    <input type="number" class="integer" value="<% out.print(product_quantity); %>" min="1" name="quantity<%=i%>">
                                    </form>

                                </li>
                                 <li class="product-price"><% out.print( "$" + product_price); %></li>
                                
                               
                            </ul>
                           <div class="clr"></div>
                        </div>
                                 
                                 <p class="removeandupdate">
                                     <button type="submit"  value="<%=i%>"  name="update" class="removeItem" id="updateItemBtn"  form="updateForm<%=i%>">Update</button>
                        <form action="/Pineapple/productServlet?action=Remove" method="post">
                            <button type="submit" value="<%=i%>"  name="remove" class="removeItem" id="removeItemBtn<%=i%>" onclick="Remove<%=i%>()">Remove</button>
                        </form>
                                 </p>
                                 <div class="Description-Prod">
                                     <%String description = product.getDescription();
                                     ProductDAO productDAO = new ProductDAO();
                                     String[] generalInfoArray = productDAO.displayGeneralInfo(description);
                                     for(String eachInfo : generalInfoArray )
                                     out.print(eachInfo + "<br><br>");
                                     %>
                                 </div>
                                 
                            
                   
                </div>
                
                
                   
            </div>
                               
                
                 
                    
                
                   
            </div>
                   
<script>


function Remove<%=i%>() {
    var removeMask<%=i%> = document.getElementById("removeMask<%=i%>");
    var nodeDeleted<%=i%> = document.getElementById("item<%=i%>");
    removeMask<%=i%>.style.visibility = "visible";
    removeMask<%=i%>.style.opacity = "1";
    removeMask<%=i%>.style.transition = "opacity 0.1s linear";
    var delay=2000; //1 second
    setTimeout(function() {
    nodeDeleted<%=i%>.parentNode.removeChild(nodeDeleted<%=i%>);
    
 
}, delay);
 
   
    
   
   
 

    
   
}

</script>              
            
             <% 
                 i++;
                 total+=subtotal;} %>
             
            <div class="offer-summary">
                <span>Cart Total:   </span><b><span class="total-value"><%="$" + total%></span></b>
            </div>
            <div class="clr"></div>
            <div class="signup-footer">
                
                <a href="/Pineapple/User/login.jsp"><input  style="float:right;" class="submit-button" type="submit" value="Check Out"></a>
                 
               
                 
            </div>
            
            
            
                                  
            <%}else{ %>
           
            <div class="signup-body">
                <p style="text-align : center;"><b>There are no items in your bag.</b><br><Br>
                If you are trying to add items to your bag and it remains empty, 
                you may have cookies disabled in your browser settings. If that's the case, 
                please enable acceptance of cookies and try again.</p>
            </div>
            <div class="offer-summary">
                
            </div>
            <div class="clr"></div>
            <div class="signup-footer">
                 
                 <a style="float:right;" href="/Pineapple/webpages/index.jsp"><button class="buttonPress"><span>Continue Shopping</span></button></a>
               
                 
            </div>
               
            <%}%>
            </div>
            </div>
        
       

        <jsp:include page="../HeaderandFooter/footer.jsp" />

    </body>
</html>

<%-- 
    Document   : checkout
    Created on : Dec 2, 2016, 10:32:29 AM
    Author     : nhatduthan2405
--%>

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
                padding-top: 16px;
                padding-bottom: 16px;
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
    float: right;
}
.buttonPress:hover{
    background: linear-gradient(#fff,#E3E3E3);
    border: 1px solid #b5b5b5;
    cursor: pointer;
    color: #0085cf;
    border-radius: 4px;
    padding: 15px 28px;
}
.recover-content{
                width: 100%;
                display: block;
                overflow: auto;
                
               
            }
            .recover-header{
                padding: 2px 16px;
                color: black;
                 border-bottom: 1px solid #d5d5d5;
            }
          
             .recover-body{
                padding: 2px 15px;
                display: block;
                overflow: auto;
                width: 100%;
                text-align: center;
            }
            .recover-footer{
                 border-top: 1px solid #d5d5d5;
                padding: 10px 16px;
                color: black;
                 display: block;
                overflow: auto;
                
            }
            .inputEmail{
                width: 90%;
                padding: 20px 20px;
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
            .submit-button:hover{
                background-color: #0A74FE;
            }
            #blockAddress{
                 visibility: hidden;
                 opacity: 0;
                 display: none;
            }
           </style>
    </head>
    <body>
         <jsp:include page="../HeaderandFooter/navbar.jsp" />
                 
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
            <div class="signup">
        <div class="signup-content">
            <div class="signup-header" >
                <h2>Item in your cart</h2>
              
                
              
            </div>
            <div class="signup-body">
                
                 <% 
                    /* display item in cart */ 
                    for(Products product : cart){ 
                        
                        String product_name = product.getName();
                        int product_quantity = product.getAmount();
                        double product_price = product.getPrice();
                        double subtotal = product_quantity*product_price;
                        String img_url = product.getImg_url();
                %>
                 
                    
                    
                
            
          
                <div class="cart-product" id="item<%=i%>">
                    
                    <div class="cart-item-image">
                        <img src="<% out.print(img_url); %>">
                    </div> 
                    <div class="content-product-info">
                        <div class="table-row">
                            
                               
                           
                           
                            <ul class="price-quantiy">
                                <li class="product-title"><b><a href="#"><% out.print(product_name); %></a></b></li>
                                <li class="sub-total"><b><% out.print( "$" + subtotal); %></b></li>
                                <li class="quantity-select">
                                    <b><% out.print(product_quantity); %></b>
                                    

                                </li>
                                 <li class="product-price"><% out.print( "$" + product_price); %></li>
                                
                               
                            </ul>
                           <div class="clr"></div>
                        </div>
                       
                                 
                            
                   
                </div>
                
                
                   
            </div>
                               
                
                 
                    <% 
                 i++;
                 total+=subtotal;} %> 
                 <div class="offer-summary">
                <span>Cart Total:   </span><b><span class="total-value"><%="$" + total%></span></b>
                
                 
            </div>
             <div class="offer-summary">
                <button class="buttonPress" onclick="displayDiv()" id="continueButton"><span>Continue</span></button> 
                
                 
            </div>
                
            <div class="clr"></div>
                 
            
            
          
            </div>
                   

            
            
           
                
                
                 
               
            <div id="blockAddress">     
            <div class="recover-header">
               
                <h2>Please input your shipping address</h2>
                
               
            </div>
            <div class="recover-body" style="text-align:center;" >
                
                    <form action="/Pineapple/productServlet?action=checkout" method="post" id="checkoutForm">
                        
                        <input class="inputEmail" type="text" placeholder="Your address*" name="shippingAddress" required><br>
                   
                    </form>
    
                        
                               
                   
                
            </div>
            <div class="recover-footer" style="text-align:right;">
                
               
               <input style="right:0;" class="submit-button" type="submit" value="Finish" form="checkoutForm">
            </div>
            
            
            </div>   
            
            </div>
            
                
            
            </div>
                
           
           
            
                  
            
            
         
            
             <%}%>                     
            
            
        
       

        <jsp:include page="../HeaderandFooter/footer.jsp" />
        <script>
            function displayDiv(){
                
// Get the block
var blockAddress = document.getElementById('blockAddress');


// When the user clicks the button, open the block
    blockAddress.style.display = "block";
    blockAddress.style.visibility = "visible";
    blockAddress.style.opacity = "1";
    blockAddress.style.transition = "display 0.1s linear opacity 0.1s linear";
    
// Get the block
var continueButton = document.getElementById('continueButton');     

     continueButton.style.visibility = "hidden";
     continueButton.style.opacity = "0";
     continueButton.style.transition = "display 0.1s linear visibility 0s 0.1s,opacity 0.1s linear";
     continueButton.style.display = "none";






            }
        </script>
    </body>
</html>

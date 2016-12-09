<%-- 
    Document   : PineappleCart
    Created on : Nov 18, 2016, 8:37:56 PM
    Author     : nhatduthan2405
--%>

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
               
               
                z-index: 1;
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
               
                padding: 2px 16px;
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
            .product-price,.quantity-select,.total-price{
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
                float:right;
                padding: 20px 15px 20px 0;
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
          
           </style>

    </head>
    <body>
                 <div class="signup">
        <div class="signup-content">
            <div class="signup-header" >
                <h2>Item In Your Bag</h2>
              
                
              
            </div>
            <div class="signup-body">
                
                <div class="cart-product" id="item1" >
                     <div class="remove-mask" id="removeMask">
                        <span class="remove">Removing this item from your bag</span>
                    </div>
                    <div class="cart-item-image">
                        <img src="../images/mac/macbook-pro.jfif">
                    </div> 
                    <div class="content-product-info">
                        <div class="table-row">
                            
                               
                           
                           
                            <ul class="price-quantiy">
                                <li class="product-title"><b><a href="#">13-inch MacBook Pro - Space Gray</a></b></li>
                                <li class="total-price"><b>$2,998.00</b></li>
                                <li class="quantity-select">
                                    <input type="number" class="integer" value="1">
                                </li>
                                 <li class="product-price">$1,499.00</li>
                                
                               
                            </ul>
                           <div class="clr"></div>
                        </div>
                       
                        <p>
                            <button type="button" class="removeItem" id="removeItemBtn">Remove</button>
                        </p>
                       
                </div>
                
                   
            </div>
                  <div class="cart-product">
                     <div class="remove-mask">
                        <span class="remove">Removing this item from your bag</span>
                    </div>
                    <div class="cart-item-image">
                        <img src="../images/mac/macbook-pro.jfif">
                    </div> 
                    <div class="content-product-info">
                        <div class="table-row">
                            
                               
                           
                           
                            <ul class="price-quantiy">
                                <li class="product-title"><b><a href="#">13-inch MacBook Pro - Space Gray</a></b></li>
                                <li class="total-price"><b>$2,998.00</b></li>
                                <li class="quantity-select">
                                    <input type="number" class="integer" value="1">
                                </li>
                                 <li class="product-price">$1,499.00</li>
                                
                               
                            </ul>
                           <div class="clr"></div>
                        </div>
                        <p>
                            <button type="button" class="removeItem" >Remove</button>
                        </p>
                       
                </div>
                
                   
            </div>
                  <div class="cart-product" >
                     <div class="remove-mask">
                        <span class="remove">Removing this item from your bag</span>
                    </div>
                    <div class="cart-item-image">
                        <img src="../images/mac/macbook-pro.jfif">
                    </div> 
                    <div class="content-product-info">
                        <div class="table-row">
                            
                               
                           
                           
                            <ul class="price-quantiy">
                                <li class="product-title"><b><a href="#">13-inch MacBook Pro - Space Gray</a></b></li>
                                <li class="total-price"><b>$2,998.00</b></li>
                                <li class="quantity-select">
                                    <input type="number" class="integer" value="1">
                                </li>
                                 <li class="product-price">$1,499.00</li>
                                
                               
                            </ul>
                           <div class="clr"></div>
                        </div>
                        <p>
                            <button type="button" class="removeItem">Remove</button>
                        </p>
                       
                </div>
                
                   
            </div>
            
            <div class="offer-summary">
                <span>Cart Total:   </span><b><span class="total-value">$1234</span></b>
            </div>
            <div class="clr"></div>
            </div>
            <div class="signup-footer">
                
                 <input  style="float:right;" class="submit-button" type="submit" value="Check Out">
               
                 
            </div>
        </div>
        </div>
       
<script>
var removeMask = document.getElementById("removeMask");
var nodeDeleted = document.getElementById("item1");
var removeBtn = document.getElementById("removeItemBtn");
removeBtn.onclick = function() {
    removeMask.style.visibility = "visible";
     removeMask.style.opacity = "1";
      removeMask.style.transition = "opacity 0.1s linear";
     var delay=2000; //1 second

setTimeout(function() {
  nodeDeleted.parentNode.removeChild(nodeDeleted);
}, delay);
   
}

</script>

    </body>
</html>

<%-- 
    Document   : buy-pMacBookpro
    Created on : Nov 16, 2016, 7:59:12 PM
    Author     : nhatduthan2405
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <title>JSP Page</title>
        <style>
             body {
    margin: 0;
    
    padding : 0;
    font-family: 'Open Sans', sans-serif;
             }
             
            .buy-product{
                 width: 100%;
                
                overflow: auto;
                background-color: white;
                left : 0;
                top: 0;
                text-align: center;
                z-index: 1;
                padding-top: 100px;
                
                display: block;
                padding-bottom: 100px;
                
            }
            .img-product{
                
                float: left;
                display: none;
               
                
                
                 
                 
                
                
            }
            .img-product img{
                padding: 50px;
                width: 435px;
                height: auto;
                
                
                
            }
            .product-spec{
                float: right;
                display: inline-block;
                text-align: left;
                position: relative;
                z-index: 1;
                margin-right: 100px;
            }
            .spec li{
                display: table;
                border-top: 1px solid #eee;
                list-style : none;
                padding: 8px;
                width: 80%;
            }
            .color-content{
                padding : 12px 6px;
                border: 1px solid #aaa;
                border-radius: 5px;
                display: inline-block;
                overflow: hidden;
                margin: 5px 4px 4px;
                word-wrap: break-word;
                text-align: center;
                width: 100px;
                cursor: pointer;
            }
            .color-content:hover,.list-content:hover{
                border-color: black;
            }
            .color-content img{
                width: 23px;
                height: 23px;
            }
            .list-content{
                 padding : 30px 6px;
                border: 1px solid #aaa;
                border-radius: 5px;
                display: block;
                overflow: hidden;
                margin: 5px 4px 10px;
                word-wrap: break-word;
                text-align: center;
                width: 85%;
                cursor: pointer;
            }
            hr.style-three {
    border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #333, #ccc);
   
}
.ptitle{
    font-size: 17pt;
}
.bottom-addtoCart{
    width: 100%;
    padding: 20px 10px 20px 10px;
    display: block;
    top: 0;
    background-color: rgba(251,251,251,0.8);
    overflow: auto;
    
    z-index: 999;
    margin-top: 0;
    border-bottom: 1px solid #d6d6d6;
    text-align: right;
    
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
            .active{
                border-color: #1C7FFF;
            }
            .fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
.product-name-bottom{
    font-size: 15pt;
        color: #333;
    float: left;
    margin-left: 20px;
}

        </style>
    </head>
    <body>
         <jsp:include page="navbar.jsp" />
         <div class="bottom-addtoCart" id="wrap">
            <p class="product-name-bottom">MacBook Pro</p>
            <div style="margin-right:40px; float: right;" ><span style="font-size:15pt;margin-right: 10px;">$629.00</span><input class="submit-button" type="submit" value="Add to cart"></div>
            </div>
        <div class="buy-product">
         
        <div class="img-product fade"  " >
            <img src="images/mac/macbook-pro.jfif">
        </div>
            <div class="img-product fade"  >
            <img src="images/mac/macbook-pro-white.jfif">
        </div>
        
        <div class="product-spec">
            <h2>Customize your 13-inch MacBook Pro - Space Gray</h2>
            
            <ul class="spec">
                <li>2.0GHz dual-core Intel Core i5 processor, Turbo Boost up to 3.1GHz
                <li>8GB 1866MHz memory
                <li>256GB PCIe-based SSD
                <li>Backlit Keyboard (English) & User's Guide
                <li>Two Thunderbolt 3 ports
                    
            </ul>
            <hr class="style-three">
            <p class="ptitle">Choose a color</p>
            <div class="color-content" onclick="currentColor(1)">
                <img src="images/colors/finish-silver-2x.png"><br>
                <span>Silver</span>
            </div>
            <div class="color-content" onclick="currentColor(2)">
                <img src="images/colors/white.jfif"><br>
                <span>White</span>
            </div>
            <hr class="style-three">
            <p class="ptitle">Processor</p>
            <div class="list-content">
                
                <span>2.9GHz dual-core Intel Core i5 processor, Turbo Boost up to 3.3GHz</span>
            </div>
            <div class="list-content">
                
                <span>3.1GHz dual-core Intel Core i5 processor, Turbo Boost up to 3.5GHz</span>
            </div>
             <div class="list-content">
                
                <span>3.3GHz dual-core Intel Core i7 processor, Turbo Boost up to 3.6GHz</span>
            </div> 
                <hr class="style-three">
            <p class="ptitle">Memory</p>
            <div class="list-content">
                
                <span>8GB 2133MHz memory</span>
            </div>
            <div class="list-content">
                
                <span>16GB 2133MHz memory</span>
            </div>
          
            
                
           
            
        </div>
        </div>
          <jsp:include page="footer.jsp" />
        
            <script>
                var slideIndex = 1;
showSlides(slideIndex);
function currentColor(n) {
  showSlides(slideIndex = n);
}
                function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("img-product");
  var dots = document.getElementsByClassName("color-content");
  if (n > slides.length) {slideIndex = 1;}
  if (n < 1) {slideIndex = slides.length;}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
          
       var elementPosition = $('#wrap').offset();

    $(window).scroll(function () {
        if ($(window).scrollTop() > elementPosition.top) {
            $('#wrap').css('position', 'fixed').css('top', '0');
        } else {
            $('#wrap').css('position', 'static');
        }
     });     

    
  </script>
  
    </body>
</html>

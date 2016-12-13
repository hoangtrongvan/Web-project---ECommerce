<%-- 
    Document   : pMac_page
    Created on : Nov 19, 2016, 11:00:38 PM
    Author     : nhatduthan2405
--%>

<%@page import="Products.ProductDAO"%>
<%@page import="Products.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pac</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css?family=Raleway:200,400|Roboto+Slab:100" rel="stylesheet">
          
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <style>
      .item_img{
                 margin-top: 0;
                 width: 100%;
                 height: 400px;
                 overflow: hidden;
                 position: relative;
                
            
            }
            .item_img img{
                    width: 100%;
                    min-height: 100%;
                    
              
            }
            .NameandPrice{
                padding : 35px 0 35px 0;
            }
            .itemName{
                
                text-align: center;
            }
            .card_price{
                text-align: center;
                padding: 5px;
                background-color: #151515;
                color: #ffffff;
                border: 1px solid #151515;
                border-radius: 4px;
                font-size: 24pt;
            }
           
            
            .test{
                width: 100%;
                height: 600px;
                z-index: 0;
            }
            .test .img_test{
                width: 100%;
                min-height: 600px;
            }
            .hoverTest{
                width: 100%;
                height: 600px;
                z-index: 1;
                background-color: black;
                position: absolute;
                background-color: rgba(0,0,0,0.8);
                opacity: 0;
                transition: opacity 250ms ease;
            }
            .hoverTest:hover{
                opacity: 1;
            }
            .hoverTest .content {
                
                
                
                color: white;
                width: 100%;
                height: 600px;
                text-align: center;
                margin: auto;
                display: inline-block;
                
            }
          
            .content img{
              
     background-color: white;
     padding: 15px;
     transition: background-color 150ms ease;
    margin-top: 235px;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
   
    margin-right: 20px;
    border-radius: 8px;
}
hr.style-one {
    border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #333, #ccc);
    width: 600px;
}
.content img:hover{
    background-color: #0479AF;
    
}
.chapterNavcontent{
    width: 100%;
}
.chapterNavcontent ul{
    width:100%;
}
body {
    margin: 0;
    
    padding : 0;
    font-family: 'Open Sans', sans-serif;
    
    
}

.chapterNav {
    margin-top: 0;
    background-color: #151515;
    color: #c1c1c1;
    list-style: none;
    padding : 20px 0 20px 0;
    font-size: 10pt;
    margin-bottom: 0;
    text-align: left;
    
}


.chapterNav li {
   
    display: inline-block;
    padding : 0 15px 0 15px;
    
}

.chapterNav li a{
    text-decoration: none;
    color : black;
    
    background-repeat: no-repeat;
}
.chapterNav li a:hover{
    color : #1B7BFF;
}
.chapternav-icon{
    width: 46px;
    height: 54px;
    background-size: 46px 54px;
    background-image: url('icon/macbook_large.png');
    background-repeat: no-repeat;
}
.hidden{
    display: none;
}
  </style>
        
    </head>
    <body>
        <%  
            String categoryName = request.getParameter("categoryName");
           
            ArrayList<Products> allProductsFromCategory = new ArrayList(); 
            ProductDAO productDAO = new ProductDAO();
            allProductsFromCategory = productDAO.getAllProductsFromCategory(categoryName);
        
        %>
     <jsp:include page="../HeaderandFooter/navbar.jsp" />
         <div class="chapterNavcontent" >
     
    <ul style="padding : 50px 0 50px 0; background-color: #F7F7F7;text-align: center;" class="chapterNav">
       
        
        <% for(Products product : allProductsFromCategory){
                String smallIcon = product.getSmall_icon_url();
                String prodName = product.getName();
        
            
        %>
                <li><a href="/Pineapple/Product/IntroProduct.jsp?productID=<%=product.getProductID()%>" class="chapternav-link">
                       
                            
                        <figure style ="width: 52px;height: 54px;background-size: 52px 54px;background-image: url('<%=smallIcon%>')" class="chapternav-icon"></figure>
                        <span class="chapternav-lable"><%=prodName%></span>
            </a></li>
          
        <%}%>
      
    </ul>
    

</div>
        <% for(Products product : allProductsFromCategory){
                
                String prodName = product.getName();
                String large_IMG = product.getLarge_img_url();
                String caption = product.getCaption();
        
            
        %>
        <div class="item">
            <div class="NameandPrice">
                <div class="itemName">
                    <span style="font-family: 'Oswald', sans-serif;font-size: 24pt;"><%=prodName%></span><br>
                    <hr class="style-one">
                    <br><br>
                    <span style="font-family: 'Roboto Slab', serif;;font-size: 50pt;"><%=caption%></span><br><br>
                    
                </div><br>
                
            </div>
            <div class="test">
            <div class="hoverTest">
                <div class="content">
                  <a href="/Pineapple/Product/IntroProduct.jsp?productID=<%=product.getProductID()%>"><img style="width: 100px; height: 100px; " src="../icon/eyeicon.png"></a>
                  <a href="/Pineapple/Product/BuyProduct.jsp?productID=<%=product.getProductID()%>"><img style="width: 100px; height: 100px; " src="../icon/carticon.png"></a>
                </div>
            </div>
            <img class="img_test" src="<%=large_IMG%>" >
        </div>
            
            
        </div><br><br><br><br>
        <%}%>
         
            <jsp:include page="../HeaderandFooter/footer.jsp" />
    </body>
</html>

<%-- 
    Document   : pMacBook-pro_page
    Created on : Nov 19, 2016, 11:08:45 PM
    Author     : nhatduthan2405
--%>

<%@page import="Products.Products"%>
<%@page import="Products.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String prodID = request.getParameter("productID"); 
           
           ProductDAO productDAO = new ProductDAO();
           Products product = productDAO.getOneProduct(prodID);
        %>
<!DOCTYPE html>
<html>
    <head>
        <title><%=product.getName() + " - Pineapple" %></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
           <link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css?family=Raleway:200,400|Roboto+Slab:100" rel="stylesheet">
        
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
 
  <style>
      .submit-button{
                width: 100px;
                background-color: #333;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border : none;
                border-radius: 4px;
                cursor : pointer;
                    
            }
            .submit-button:hover{
                background-color: black;
            }
            
            .sub-nav-buy{
              margin: 0;
              display: table;
                width: 94%;
                display: block;
                overflow: auto;
                padding: 15px 40px 15px 40px;
                
                text-align: center;
                list-style: none;
                border-bottom: 1px solid #d5d5d5;
                background-color: rgba(251,251,251,0.8);
                
                
              
            }
            .sub-nav-buy li{
                display: inline-block;
            }
             .clr{
                clear:both;
                 font-size:0;
            }
             .test{
                
             width: 100%;
             height: 600px;
             overflow:hidden;
             z-index: 0;

  
            }
            .test .img_test{
               min-height:100%;
                
                z-index: 0;
    
                width:100%;
            }
            .test p{
                z-index: 1;
                margin-top: 10px;
            }
            .info-text{
                text-align: center;
               
                display: block;
                font-size: 17pt;
                width: 60%;
                margin: 0 auto; 
                
            }
            .info-product{
                text-align: center;
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
            hr.style-one {
    border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #333, #ccc);
    width: 600px;
}
  </style>
    </head>
    <body>
        
         
        <jsp:include page="../HeaderandFooter/navbar.jsp" />
            <ul class="sub-nav-buy" id="wrap">
                <li style="float:left;font-size: 14pt;"><p><%=product.getName()%></p></li>
                <li style="float:right;font-size: 14pt;"><a href="/Pineapple/Product/BuyProduct.jsp?productID=<%=product.getProductID()%>"><input class="submit-button" type="submit" value="Buy"></a></li>
            </ul>
        <div class="info-product">
            <div class="NameandPrice">
                <div class="itemName">
                    <span style="font-family: 'Oswald', sans-serif;font-size: 24pt;"><%=product.getName()%></span><br>
                    <hr class="style-one">
                    <br><br>
                    <span style="font-family: 'Roboto Slab', serif;;font-size: 50pt;"><%=product.getCaption()%></span><br><br>
                    
                </div><br>
                
            </div>
        <div class="test">
            
            <img class="img_test" src="<%=product.getImg_desc1()%>"  >
            
           
            
        </div>
            <div class="info-text">
             <p><%=product.getDesc1()%></p>
            </div>
             <div class="test" style="height:900px;">
            
            <img class="img_test" src="<%=product.getImg_desc2()%>"  >
           
           
            
        </div>
             <div class="info-text">
                 <p>
                     <%=product.getDesc2()%>
                 </p>
            </div>
        </div>
      <jsp:include page="../HeaderandFooter/footer.jsp" />
            <script>
    var elementPosition = $('#wrap').offset();

    $(window).scroll(function () {
        if ($(window).scrollTop() > elementPosition.top) {
            $('#wrap').css('position', 'fixed').css('top', '0').css('width','94%');
        } else {
            $('#wrap').css('position', 'static');
        }
     });
</script>
    </body>
    
</html>

<%-- 
    Document   : buy-pMacBookpro
    Created on : Nov 16, 2016, 7:59:12 PM
    Author     : nhatduthan2405
--%>

<%@page import="Color.ColorDAO"%>
<%@page import="ModelProduct.ModelProduct"%>
<%@page import="ColorProduct.ColorProduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Products.Products"%>
<%@page import="Products.ProductDAO"%>
 <% String prodID = request.getParameter("productID");

            ProductDAO productDAO = new ProductDAO();
            Products product = productDAO.getOneProduct(prodID);
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <title><%="Buy " + product.getName() + " - Pineapple" %></title>
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
                position: relative;
            }
            .color-content:hover,.list-content:hover{
                border-color: black;

            }
            .color-content img{
                width: 23px;
                height: 23px;
            }
            .list-content{
                position: relative;
                padding : 30px 6px;
                border: 1px solid #aaa;
                border-radius: 5px;
                display: block;
                overflow: hidden;
                margin: 5px 4px 10px;
                word-wrap: break-word;
                text-align: left;
                width: 85%;
                cursor: pointer;
            }
            .list-content2{
                position: relative;
                padding : 30px 6px;
                border: 1px solid #aaa;
                border-radius: 5px;
                display: block;
                overflow: hidden;
                margin: 5px 4px 10px;
                word-wrap: break-word;
                text-align: left;
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

                border: 3px solid  #1C7FFF;
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

            .form-choice{
                z-index: 0;
                display: inline-block;
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                right: 12px;
                bottom: 12px;
                cursor: pointer;
                -webkit-tap-highlight-color: transparent;
                opacity: 0;




            }
            fieldset{
                border: none;
            }
            .priceTag{
                padding-left: 20px;
                font-size : 15pt;

            }
            .generalInfo{
                list-style-type:circle;
            }
            .generalInfo li{
                font-size: 15pt;
                padding: 5px;
            }
        </style>
    </head>
    <body>
       
        <jsp:include page="../HeaderandFooter/navbar.jsp" />
        <div class="bottom-addtoCart" id="wrap">
            <p class="product-name-bottom"><%=product.getName()%></p>
            <div style="margin-right:40px; float: right;" ><input class="submit-button" type="submit" value="Add to cart" form="addtoCartForm"></div>
        </div>
        <div class="buy-product">
            <% ArrayList<ColorProduct> allColorOfProduct = productDAO.getAllColorOfProduct(prodID);
                for (ColorProduct colorProd : allColorOfProduct) {
            %>
            <div class="img-product fade" >
                <img src="<%=colorProd.getColorProd_url()%>">
            </div>
            <%}%>

            <div class="product-spec">

                <p class="ptitle">Choose your Color</p>

                <form action="/Pineapple/productServlet?action=addtoCart" method="post" id="addtoCartForm">
                    <input type="text" value ="<%=product.getProductID()%>" name="productID" style="visibility: hidden;">
                    <fieldset id="color">
                        <%

                            int i = 1;
                            for (ColorProduct colorProd : allColorOfProduct) {

                                ColorDAO colorDAO = new ColorDAO();

                        %>
                        <div class="color-content" onclick="currentColor(<%=i%>)">
                            <input id="selectColor" class="form-choice" type="radio" name="color" value="<%=colorProd.getColor()%>" >
                            <img src="<%=colorDAO.getURLColorByName(colorProd.getColor())%>"><br>
                            <span><%=colorProd.getColor()%></span>
                        </div>

                        <% i++;
                }%>
                    </fieldset>
                    <hr class="style-three">
                    <p class="ptitle">Choose your Model</p>
                    <fieldset id="Model">
                        <%
                            ArrayList<ModelProduct> allModelOfProduct = productDAO.getAllModelOfProduct(prodID);
                            int j = 1;
                            for (ModelProduct modelProd : allModelOfProduct) {
                                String generalInfo = modelProd.getGeneralInfo();
                                String[] generalInfoArray = productDAO.displayGeneralInfo(generalInfo);

                        %>
                        <div id="Model"  class="list-content" onclick="changeBorder(<%=j%>)" >
                            <input id="selectModel" class="form-choice" type="radio" name="Model" value="<%=modelProd.getModelID()%>" >

                            <ul class="generalInfo" >
                                <% for (String eachInfo : generalInfoArray) { %>

                                <li><%out.print(eachInfo);%></li>
                                    <%}%>
                            </ul>
                            <br><br>

                            <span class="priceTag"><b><%= "$" + modelProd.getPrice()%></b></span>
                        </div>
                        <%j++;
                }%>
                    </fieldset>
                    <hr class="style-three">

                </form>



            </div>
        </div>
        <jsp:include page="../HeaderandFooter/footer.jsp" />

        <script>
            changeBorder(1);
            document.getElementById("selectColor").checked = true;
            document.getElementById("selectModel").checked = true;
            var slideIndex = 1;
            showSlides(slideIndex);
            function currentColor(n) {
                showSlides(slideIndex = n);
            }
            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("img-product");
                var dots = document.getElementsByClassName("color-content");
                if (n > slides.length) {
                    slideIndex = 1;
                }
                if (n < 1) {
                    slideIndex = slides.length;
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }

            function changeBorder(n) {
                var i;

                var dots = document.getElementsByClassName("list-content");

                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }

                dots[n - 1].className += " active";
            }

            function changeBorder2(n) {
                var i;

                var dots = document.getElementsByClassName("color-content");

                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }

                dots[n - 1].className += " active";
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

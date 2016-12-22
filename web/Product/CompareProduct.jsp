<%-- 
    Document   : CompareProduct
    Created on : Dec 14, 2016, 8:24:00 PM
    Author     : nhatduthan2405
--%>


<%@page import="Color.ColorDAO"%>
<%@page import="ColorProduct.ColorProduct"%>
<%@page import="ModelProduct.ModelProduct"%>
<%@page import="Products.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Products.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String categoryName = request.getParameter("categoryName");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= categoryName + " - Compare Models"%></title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <style>
            .generalInfo{
                list-style-type:circle;
            }
            .generalInfo li{
                font-size: 15pt;
                padding: 5px;
            }
            .section-top{
                width: 100%;
                text-align: center;
                display: block;


            }
            .list-content{
                position: relative;
                padding : 30px 6px;
                border: 1px solid #aaa;
                border-radius: 5px;
                display: inline-block;
                overflow: hidden;
                margin: 5px 4px 10px;
                word-wrap: break-word;
                text-align: center;
                width: 20%;
                *display: inline;
                cursor: pointer;
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
                opacity: 1;




            }
            .containerIMG {

                height: 100%;

                text-align: justify;
                -ms-text-justify: distribute-all-lines;
                text-justify: distribute-all-lines;

                /* just for demo */
                min-width: 612px;
            }

            .imgbox1, .imgbox2, .imgbox3, .imgbox4 {
                width: 334px;
                height: 200px;
                vertical-align: top;
                display: inline-block;
                *display: inline;
                zoom: 1;

                background-color: #F4F4F4;
            }
            .stretch {
                width: 100%;
                display: inline-block;
                font-size: 0;
                line-height: 0
            }
            /* ROUNDED TWO */
            .roundedTwo {
                width: 28px;
                height: 28px;
                background: #fcfff4;

                background: -webkit-linear-gradient(top, #fcfff4 0%, #dfe5d7 40%, #b3bead 100%);
                background: -moz-linear-gradient(top, #fcfff4 0%, #dfe5d7 40%, #b3bead 100%);
                background: -o-linear-gradient(top, #fcfff4 0%, #dfe5d7 40%, #b3bead 100%);
                background: -ms-linear-gradient(top, #fcfff4 0%, #dfe5d7 40%, #b3bead 100%);
                background: linear-gradient(top, #fcfff4 0%, #dfe5d7 40%, #b3bead 100%);
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fcfff4', endColorstr='#b3bead',GradientType=0 );
                margin: 20px auto;

                -webkit-border-radius: 50px;
                -moz-border-radius: 50px;
                border-radius: 50px;

                -webkit-box-shadow: inset 0px 1px 1px white, 0px 1px 3px rgba(0,0,0,0.5);
                -moz-box-shadow: inset 0px 1px 1px white, 0px 1px 3px rgba(0,0,0,0.5);
                box-shadow: inset 0px 1px 1px white, 0px 1px 3px rgba(0,0,0,0.5);
                position: relative;
            }

            .roundedTwo label {
                cursor: pointer;
                position: absolute;
                width: 20px;
                height: 20px;

                -webkit-border-radius: 50px;
                -moz-border-radius: 50px;
                border-radius: 50px;
                left: 4px;
                top: 4px;

                -webkit-box-shadow: inset 0px 1px 1px rgba(0,0,0,0.5), 0px 1px 0px rgba(255,255,255,1);
                -moz-box-shadow: inset 0px 1px 1px rgba(0,0,0,0.5), 0px 1px 0px rgba(255,255,255,1);
                box-shadow: inset 0px 1px 1px rgba(0,0,0,0.5), 0px 1px 0px rgba(255,255,255,1);

                background: -webkit-linear-gradient(top, #222 0%, #45484d 100%);
                background: -moz-linear-gradient(top, #222 0%, #45484d 100%);
                background: -o-linear-gradient(top, #222 0%, #45484d 100%);
                background: -ms-linear-gradient(top, #222 0%, #45484d 100%);
                background: linear-gradient(top, #222 0%, #45484d 100%);
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#222', endColorstr='#45484d',GradientType=0 );
            }

            .roundedTwo label:after {
                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
                filter: alpha(opacity=0);
                opacity: 0;
                content: '';
                position: absolute;
                width: 9px;
                height: 5px;
                background: transparent;
                top: 5px;
                left: 4px;
                border: 3px solid #fcfff4;
                border-top: none;
                border-right: none;

                -webkit-transform: rotate(-45deg);
                -moz-transform: rotate(-45deg);
                -o-transform: rotate(-45deg);
                -ms-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }

            .roundedTwo label:hover::after {
                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
                filter: alpha(opacity=30);
                opacity: 0.3;
            }

            .roundedTwo input[type=checkbox]:checked + label:after {
                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
                filter: alpha(opacity=100);
                opacity: 1;
            }
            .submit-button{

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
            #compareButton{
                display: none;
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
            .sec-agu{
                font-size: 40pt;
            }
        </style>
    </head>

    <body>
        <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
        <div class="section-top" id="wrap">
            <p class="sec-agu">Compare <%=categoryName%> models</h1>
            <p id="compareButton"><a href="" id="testHref"><button class="buttonPress" id="buttonPress" ><span>Compare models</span></button></a></p>
            <p id="checkEnoughModels" >Select two models for a more detailed comparison</p>


        </div>



        <div class="containerIMG" id="containCheckboxes">      

            <% ProductDAO productDAO = new ProductDAO();
                ArrayList<Products> allProductsFromCategory = productDAO.getAllProductsFromCategory(categoryName);

                for (Products product : allProductsFromCategory) {
                    String productName = product.getName();
                    String ava = product.getAva_url();
                    ArrayList<ModelProduct> allModelOfProduct = productDAO.getAllModelOfProduct(product.getProductID());
                    for (ModelProduct model : allModelOfProduct) {
                        String generalInfo = model.getGeneralInfo();
                        String[] generalInfoArray = productDAO.displayGeneralInfo(generalInfo);
            %>
            <div id="<%=model.getModelID()%>"  class="list-content" onclick="" >
                <input  type="checkbox" value="<%=model.getModelID()%>" id="<%=model.getModelID()%>"  onclick="checkTotalCheckedBoxes()"/><br>      
                <img style="width: 118px;height: 69px;" src="<%=ava%>" alt="<%=productName%>">

                <p><%=productName%></p>
                <p><%="$" + model.getPrice()%></p>


            </div>
            <%}
                }%>

            <span class="stretch"></span>
        </div>


        <script>

            function checkTotalCheckedBoxes()
            {
                var link = document.getElementById("linktoResult");
                var checkLength = 0;
                var boxes = document.getElementById("containCheckboxes").getElementsByTagName("input");
                for (var i = 0; i < boxes.length; i++)
                {
                    boxes[i].checked ? checkLength++ : 0;


                }
                if (checkLength == 1) {
                    document.getElementById("checkEnoughModels").innerHTML = "Select another model to compare";
                } else
                    document.getElementById("checkEnoughModels").innerHTML = "Select two models for a more detailed comparison";
                if (checkLength == 2) {
                    link.href = "/Pineapple/Product/compareResult.jsp?model1=";
                    document.getElementById("compareButton").style.display = "block";
                    document.getElementById("checkEnoughModels").style.display = "none";
                    for (var i = 0; i < boxes.length; i++)
                    {
                        boxes[i].checked ? checkLength++ : 0;
                        boxes[i].checked ? link.href += boxes[i].value + "&" + "model2=" : "#";

                    }
                    var n = link.href.lastIndexOf("&");
                    var mainLink = link.href.substr(0, n);
                    link.href = mainLink;

                    document.getElementById("testHref").href = mainLink;
                } else {
                    document.getElementById("compareButton").style.display = "none";
                    document.getElementById("checkEnoughModels").style.display = "block";
                    link.href = "#";
                }
            }


        </script>
    </body>
</html>

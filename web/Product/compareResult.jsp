<%-- 
    Document   : CompareProduct
    Created on : Dec 14, 2016, 8:24:00 PM
    Author     : nhatduthan2405
--%>

<%@page import="ModelProduct.ModelProdDAO"%>
<%@page import="Color.ColorDAO"%>
<%@page import="ColorProduct.ColorProduct"%>
<%@page import="ModelProduct.ModelProduct"%>
<%@page import="Products.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Products.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compare Result</title>
        <style>
            .generalInfo{
                list-style-type:circle;
            }
            .generalInfo li{
                font-size: 15pt;
                padding: 5px;
                text-align: left;
            }
            .section-top{
                width: 100%;
                text-align: center;
                display: block;


            }
            .list-content{
                position: relative;


                display: inline-block;
                overflow: hidden;
                margin: 5px 4px 10px;
                word-wrap: break-word;
                text-align: center;
                width: 40%;
                cursor: pointer;
            }
            .list-content{
                font-size: 20pt;
            }
            .linkto{
                text-decoration: none;
                color: #08c;
                font-size: 15pt
            }
            .linkto:visited{
                color: #08c;
            }
            .linkto:hover{
                text-decoration: underline;
            }
            .list-content span{
                padding-right: 20px;
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
            .containerCompare{
                text-align:center;
                padding: 5px 0 0 0;


            }
            .eachPartofCompare{
                position: relative;
                padding-bottom: 10px;
                border-bottom: 1px solid #aaa;
                font-size: 18pt;
                display: inline-block;
                overflow: hidden;

                word-wrap: break-word;
                text-align: left;
                width: 82%;

            }
            .sec-agu{
                font-size: 40pt;
            }
        </style>
    </head>
    <%

        int model1 = Integer.parseInt(request.getParameter("model1"));
        int model2 = Integer.parseInt(request.getParameter("model2"));


    %>
    <%         ModelProdDAO modelDAO = new ModelProdDAO();
        ModelProduct modelProd1 = modelDAO.getModelByID(model1);
        ProductDAO prodDAO = new ProductDAO();
        Products product1 = prodDAO.getOneProduct(modelProd1.getProductID());
        String generalInfo1 = modelProd1.getGeneralInfo();
        String[] generalInfoArray1 = prodDAO.displayGeneralInfo(generalInfo1);

        ModelProduct modelProd2 = modelDAO.getModelByID(model2);

        Products product2 = prodDAO.getOneProduct(modelProd2.getProductID());
        String generalInfo2 = modelProd2.getGeneralInfo();
        String[] generalInfoArray2 = prodDAO.displayGeneralInfo(generalInfo2);
    %>
    <body>
        <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
        <div class="section-top">
            <p class="sec-agu">Compare <%=product1.getCategory()%> models</p>
            <p><a href="/Pineapple/Product/CompareProduct.jsp?categoryName=<%=product1.getCategory()%>" class="linkto">Choose other <%=product1.getCategory()%> models to compare</a></p>
        </div>
        <div class="containerCompare">


            <div id="Model"  class="list-content" onclick="" >

                <img style="width: 355px;height: 300px;" src="<%=product1.getAva_url()%>" alt="<%=product1.getName()%>">

                <p><%=product1.getName()%></p>
                <p><%="$" + modelProd1.getPrice()%></p>
                <span><a class="linkto" href="/Pineapple/Product/IntroProduct.jsp?productID=<%=product1.getProductID()%>">Learn more</a></span> <span><a class="linkto" href="/Pineapple/Product/BuyProduct.jsp?productID=<%=product1.getProductID()%>">Buy now</a></span>

            </div>
            <div id="Model"  class="list-content" onclick="" >
                <img style="width: 355px;height: 300px;" src="<%=product2.getAva_url()%>" alt="<%=product2.getName()%>">

                <p><%=product2.getName()%></p>
                <p><%="$" + modelProd2.getPrice()%></p>
                <span><a class="linkto" href="/Pineapple/Product/IntroProduct.jsp?productID=<%=product2.getProductID()%>">Learn more</a></span> <span><a  class="linkto" href="/Pineapple/Product/BuyProduct.jsp?productID=<%=product2.getProductID()%>">Buy now</a></span>

            </div>

        </div>    
        <div class="containerCompare">
            <div class="eachPartofCompare">
                <span>General Specifications</span>
            </div> 
            <div id="Model"  class="list-content" onclick="" >

                <ul class="generalInfo" >
                    <% for (String eachInfo : generalInfoArray1) { %>

                    <li><%out.print(eachInfo);%></li>
                        <%}%>
                </ul>

            </div>
            <div id="Model"  class="list-content" onclick="" >

                <ul class="generalInfo" >
                    <% for (String eachInfo : generalInfoArray2) { %>

                    <li><%out.print(eachInfo);%></li>
                        <%}%>
                </ul>

            </div>

        </div>    
        <div class="containerCompare" >
            <div class="eachPartofCompare">
                <span>Color</span>
            </div> 
            <div id="Model" style="text-align:left" class="list-content" onclick="" >


                <% ArrayList<ColorProduct> allColorOfProduct1 = prodDAO.getAllColorOfProduct(product1.getProductID());
                    for (ColorProduct colorProd : allColorOfProduct1) {
                        ColorDAO colorDAO = new ColorDAO();

                %>
                <img style="width: 28px; height:28px;" src="<%=colorDAO.getURLColorByName(colorProd.getColor())%>">
                <%}%>
            </div>
            <div id="Model" style="text-align:left" class="list-content" onclick="" >


                <% ArrayList<ColorProduct> allColorOfProduct2 = prodDAO.getAllColorOfProduct(product2.getProductID());
                    for (ColorProduct colorProd : allColorOfProduct2) {
                        ColorDAO colorDAO = new ColorDAO();

                %>
                <img style="width: 28px; height:28px;" src="<%=colorDAO.getURLColorByName(colorProd.getColor())%>">
                <%}%>
            </div>

        </div>    








    </body>
</html>

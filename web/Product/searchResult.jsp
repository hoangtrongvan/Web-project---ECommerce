<%-- 
    Document   : searchResult
    Created on : Dec 15, 2016, 1:54:53 PM
    Author     : nhatduthan2405
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Products.Products"%>
<%@page import="Products.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
        <style>
           .searchBox {
    width: 300px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

.searchBox:focus {
    width: 40%;
}
.product-div{
    width: 70%;
    
    display: block;
    
    overflow: auto;
    padding-bottom: 40px;
}
.product-image{
    width: 20%;
    float: left;
    
}
.product-image img{
    
    width: 100%;
    height: auto;
    float: left;
}
.product-description{
    padding: 10px;
    width: 75%;
    float: right;
    
}
.product-description span{
    padding-right: 50px;
}
.product-description h2{
    border-bottom: 1px solid #333;
    padding-bottom: 10px;
}
.container{
    padding: 60px 60px 20px 100px;
    
    text-align: left;
}
.containAllSearch{
   
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
        </style>
    </head>
    <body>
        <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
        <div class="container">
            <div class="containAllSearch">
          <input class="searchBox" type="text" placeholder="Search pineapple.com.." id="inputSearch">
        <a style="display:none;" href="#" id="linkto"><button type="submit" class="buttonPress" id="button" onclick="gotosearchResult2()"><span>Search</span></button></a>
        <%
            String searchKey = request.getParameter("searchKey");
            ProductDAO productDAO = new ProductDAO();
             ArrayList<Products> allRelaredProducts = productDAO.getAllRelatedProducts(searchKey);
             int results = allRelaredProducts.size();
        
        %>
             <p><%=results%> results found</p>
        <%     for(Products product : allRelaredProducts){
        
        %>
        <div class="product-div">
            <div class="product-image">
            <img src="<%=product.getAva_url()%>">
            </div>
            <div class="product-description">
            <h2><%=product.getName() %></h2>
            <p><%=product.getBrief_Desc()%></p>
             <span><a class="linkto" href="/Pineapple/Product/IntroProduct.jsp?productID=<%=product.getProductID()%>">Learn more</a></span> 
             <span><a class="linkto" href="/Pineapple/Product/BuyProduct.jsp?productID=<%=product.getProductID()%>">Buy now</a></span>
            
            </div>
            
        </div>
        <%}%>
            </div>
        </div>
            <script>
                document.getElementById("inputSearch")
    .addEventListener("keyup", function(event) {
    event.preventDefault();
    if (event.keyCode == 13) {
        if(document.getElementById("inputSearch").value!="")
        document.getElementById("button").click();
    }
});
 function gotosearchResult2(){
     var searchKey2 = document.getElementById("inputSearch").value;
     document.getElementById("linkto").href = "/Pineapple/Product/searchResult.jsp?searchKey=" + searchKey2;
 }           
 
    var request;

function getRequestObject() {
    if (window.ActiveXObject) {
        return(new ActiveXObject("Microsoft.XMLHTTP"));
    } else if (window.XMLHttpRequest) {
        return(new XMLHttpRequest());
    } else {
        return(null);
    }
}

function sendRequestWithData(address, data, 
                              responseHandler) {
    request = getRequestObject();
    request.onreadystatechange = responseHandler;
    request.open("POST", address, true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(data);
}

function displayTimeInCity() {
    var address = "showTimeinCity";
    var city = document.getElementById("city").value;
    var data = "city=" + escape(city) +  "&useHTML=true";
    sendRequestWithData(address, data, showResponseText);
}

function showResponseText() {
if ((request.readyState == 4) &&
(request.status == 200)) {
document.getElementById("resultText").innerHTML = request.responseText;
}
}
            </script>
    </body>
</html>

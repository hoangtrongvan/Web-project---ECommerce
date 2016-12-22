<%-- 
    Document   : addProduct
    Created on : Dec 11, 2016, 10:07:23 PM
    Author     : nhatduthan2405
--%>

<%@page import="ColorProduct.ColorProdDAO"%>
<%@page import="ColorProduct.ColorProduct"%>
<%@page import="ModelProduct.ModelProduct"%>
<%@page import="ModelProduct.ModelProdDAO"%>
<%@page import="Products.Products"%>
<%@page import="Products.ProductDAO"%>
<%@page import="Color.Color"%>
<%@page import="Color.ColorDAO"%>
<%@page import="Category.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Category.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <style>
    body {
    margin: 0;
    overflow: hidden;
}

.tab {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 20%;
    background-color: #f1f1f1;
    position: fixed;
    height: 100%;
    overflow: auto;
}

.tab li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

.tab li a.active {
    background-color: #1C7FFF;
    color: white;
}

.tab li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
.tabcontent {
    display: block;
    padding: 6px 12px;
   
    
    margin-left:20%;
    padding:1px 16px;
    height: 610px;
    overflow: auto;
}
.ava-content{
    
    text-align: center;
   
}
.avatar, #blah{
    
    padding: 20px;
    height: 180px;
    width: 180px;
    border-radius: 50%;
    
}
#blah{
    padding: 0;
    border: 3px dotted #333;
    margin-bottom: 10px;
}
.avaChange{
    margin: 20px;
    margin-left: 46px;
    position: absolute;
    padding: 20px;
    height: 142px;
    width: 142px;
    border-radius: 50%;
   
                z-index: 1;
               
                
                background-color: rgba(0,0,0,0.6);
                opacity: 0;
                transition: opacity 250ms ease;
}
.avaChange:hover{
    opacity: 1;
}
.displayName{
    text-align: center;
}
.style-two {
    border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #333, #ccc);
   
}
.inputText{
                width: 654px;
                padding: 12px 20px;
                margin: 8px 0;
                display : incline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .inputText2{
                width: 412px;
                padding: 12px 20px;
                margin: 8px 0;
                display : incline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .textarea{
                
                padding: 12px 20px;
                margin: 8px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .avaButton{
   
   text-align: center;
}
            #myBtn{
                width: 120px;
                background-color: #1C7FFF;
                color: white;
                padding: 5px;
                
                border : none;
                border-radius: 4px;
                cursor : pointer;
                margin-top: 60px;
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
             .submit-button:hover, #myBtn:hover{
                background-color: #0A74FE;
            }
            body {
    margin: 0;
    
    padding : 0;
    font-family: 'Open Sans', sans-serif;
            }
            .submit-button:hover{
                background-color: #0A74FE;
            }
            #snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

.btn-upload {
    position: relative;
    overflow: hidden;
    display: inline-block;
     cursor: pointer;
}
.btn-upload input[type=file] {
    position: absolute;
    opacity: 0;
    z-index: 0;
    max-width: 100%;
    height: 100%;
    display: block;
     cursor: pointer;
}
.btn-upload .btn{
    padding: 8px 20px;
    background: #337ab7;
    border: 1px solid #2e6da4;
    color: #fff;
    border: 0;
    cursor: pointer;
}
.btn-upload:hover .btn{
    padding: 8px 20px;
    background: #2e6da4;
    color: #fff;
    border: 0;
}
.hidden{
    display:none;
}
.title{
    font-weight: bold;
    font-size: 14pt;
}
</style>
    </head>
    
    <%String prodID = request.getParameter("prodID");
      ProductDAO productDAO = new ProductDAO();
                       
      Products product = new Products();
      product = productDAO.getOneProduct(prodID);
      CategoryDAO categoryDAO = new CategoryDAO();
      ArrayList<Category> allcategories = categoryDAO.getAllCategories();
      String pathFile = "E:/Web/Github/Web-project---ECommerce/web/ProductsContainer";
                            
                           
           %>            
    <body>
         <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
         <ul class="tab">
           <li class="ava-content">
               <div style="position : relative;">
               
               <img class="avatar" src="<%=product.getAva_url()%>">
               </div>
           </li>
           <li class="displayName">
               
               <h3><%=product.getName()%></h3>
               <p style="color: #80C8EA;"><b><%=product.getProductID()%></b></p>
               <br>
          </li>
          
          
   <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'EditProduct')" id="defaultOpen">Edit Product</a></li>
  
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'EditModel')">Edit Model</a></li>
</ul>
        <div id="EditProduct" class="tabcontent">
         
           
               
                    <form class="form-signin"  action="/Pineapple/productServlet?action=updateProductInfo" method="post" id="addnewProduct" >
                        
                        <p class="title">Current Category</p>
                        
                        
                         <p><%=product.getCategory()%> </p>
                        
                        
                        <p class="title">Product ID</p>
                        <input  class="inputText" type="text" placeholder="Product ID" value="<%=product.getProductID()%>" name ="prodID" readonly><br>
                        <p class="title">Product Name</p>
                        <input  class="inputText" type="text" value="<%=product.getName()%>" placeholder="Product Name" name ="prodName" required>
                        <p class="title">Caption</p>
                        <input  class="inputText" type="text" value="<%=product.getCaption()%>" placeholder="Caption" name ="caption" required>
                        <p class="title">Brief Description</p>
                        <textarea class="textarea" rows="4" cols="85" placeholder="Brief Description"  name="briefdescription" required><%=product.getBrief_Desc()%></textarea><br>
                        <p class="title">Description 1</p>
                        <textarea class="textarea" rows="4" cols="85" placeholder="Description 1" name="description1"  required><%=product.getDesc1() %></textarea><br>
                        <p class="title">Description 2</p>
                        <textarea class="textarea" rows="4" cols="85" placeholder="Description 2" name="description2"  required><%=product.getDesc2() %></textarea><br>
                     
                       
                       
         
                       
                            
                           
                     
              
                  <input class="submit-button" type="submit" value="Update">      
                       
                         
                 </form>  
                
            
            
                 
                 
        </div> 
       
        
        <div id="EditModel" class="tabcontent">
            <form action="/Pineapple/productServlet?action=updateModel" method="post">
                <input class="hidden" type="text" value="<%=prodID%>" name="prodID">
        <% 
            ModelProdDAO modelDAO = new ModelProdDAO();
            ArrayList<ModelProduct> allmodelOfProduct = modelDAO.getallModelProdByProdID(prodID);
            int i = 0;
            for (ModelProduct model : allmodelOfProduct ){ %>
            <p class="title">Model <%=++i%> </p>
            <input type="text" class="hidden" name="modelID<%=i%>" value="<%=model.getModelID()%>">
            <textarea class="textarea" rows="10" cols="50" placeholder="General Information" name="generalInformation<%=i%>"><%=model.getGeneralInfo()%></textarea><br>
            <p class="title">Price ($)</p>
            <input type="text" class="inputText2" name="price<%=i%>" placeholder="Price of model" value="<%=model.getPrice()%>">
            
        <%}%>
        <br><br>
        <input type="text" name="amountModel" class="hidden" value="<%=allmodelOfProduct.size()%>">
        <input type="submit" class="submit-button" value="Update">
            </form>
        </div>
    </body>
    <script>
function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

</script>
</html>

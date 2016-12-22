<%-- 
    Document   : addProduct
    Created on : Dec 11, 2016, 10:07:23 PM
    Author     : nhatduthan2405
--%>

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
        <title>Add Product</title>
        <style>
            .inputText{
                width: 654px;
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
            .submit-button:hover{
                background-color: #0A74FE;
            }
            .title{
    font-weight: bold;
    font-size: 14pt;
}
.containerContent{
    padding: 20px 40px 20px 40px;
}
        </style>
    </head>
    <body>
         <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
         <jsp:include page="../HeaderandFooter/horizon-nav.jsp" /> 
           
         <div class="containerContent">
                    <form class="form-signin" enctype="multipart/form-data" action="/Pineapple/productServlet?action=addnewProduct" method="post" id="addnewProduct" >
                        <p class="title">Category</p>
                        <select name="Category">
                        <% 
                            CategoryDAO categoryDAO = new CategoryDAO();
                            ArrayList<Category> allcategories = categoryDAO.getAllCategories();
                            
                           

                            for(Category category: allcategories){
                                String categoryName = category.getCategory();
                        %> 
                            
                            <option value="<%=categoryName%>"><%=categoryName%></option>
                           
                        <%}%>
                        </select><br><br>
                        <p class="title">Small Icon</p>
                        <input type="file" name="small_icon" id="file"  accept='image/*' required/> <br><br>
                        <p class="title">Avatar of Product</p>
                        <input type="file" name="avaProd" id="file"  accept='image/*' required/> <br><br>
                        <p class="title">Large Image</p>
                        <input type="file" name="large_img" id="file"  accept='image/*' required/> <br><br>
                        
                        <input  class="inputText" type="text" placeholder="Product ID" name ="prodID" required><br><br>
                        <input class="inputText" type="text" placeholder="Product Name" name ="prodName" required>
                        <br><br>
                        <input class="inputText" type="text" placeholder="Caption" name ="caption" required>
                        <br><br>
                        <textarea class="textarea" rows="4" cols="85" placeholder="Brief Description" name="briefdescription"></textarea><br><br>
                        <textarea class="textarea" rows="4" cols="85" placeholder="Description 1" name="description1"></textarea><br>
                        <p class="title">Image for Description 1</p>
                        <input type="file" name="img_desc1" id="file"  accept='image/*' required/><br><br>
                        <textarea class="textarea" rows="4" cols="85" placeholder="Description 2" name="description2"></textarea><br>
                        <p class="title">Image for Description 2</p>
                        <input type="file" name="img_desc2" id="file"  accept='image/*' required/><br><br>
                       
                        <p class="title">Color of Product</p>
                        <% 
                            ColorDAO colorDAO = new ColorDAO();
                            ArrayList<Color> allColors = colorDAO.getallColors();
                            
                           

                            for(Color color : allColors){
                        %>        
                        <input type="checkbox" name="color" value="<%=color.getName()%>"><img src="<%=color.getColor_img()%>"><%=color.getName()%><br><br><br>
                       
                        
                        
                        <%}%>    
                            
         
                            
                        <br><br>
                            <input  class="inputText" type="number" name="modelAmount" placeholder="Amount of Model" min="1" max="5">
                            
                           
                      </form>  
              
                        
                       
                         
                
                
            
            
                        <br><br>
                 <input class="submit-button" type="submit" value="Submit" form="addnewProduct">
         </div>
       <script>
            var active = document.getElementById("addProd");
            active.className += " active";
       </script>          
    </body>
</html>

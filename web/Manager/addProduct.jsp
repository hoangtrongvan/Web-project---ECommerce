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
        <title>JSP Page</title>
    </head>
    <body>
         <h1 style="color:#767676">Add Product</h1>
               
                
                <hr class="style-two">
           
               
                    <form class="form-signin" enctype="multipart/form-data" action="/Pineapple/productServlet?action=addnewProduct" method="post" id="addnewProduct" >
                        <p>Category</p>
                        <select name="Category">
                        <% 
                            CategoryDAO categoryDAO = new CategoryDAO();
                            ArrayList<Category> allcategories = categoryDAO.getAllCategories();
                            
                           

                            for(Category category: allcategories){
                                String categoryName = category.getCategory();
                        %> 
                            
                            <option value="<%=categoryName%>"><%=categoryName%></option>
                           
                        <%}%>
                        </select><br>
                        <p>Small Icon</p>
                        <input type="file" name="small_icon" id="file"  accept='image/*' required/> <br>
                        <p>Avatar of Product</p>
                        <input type="file" name="avaProd" id="file"  accept='image/*' required/> <br>
                        <p>Large Image</p>
                        <input type="file" name="large_img" id="file"  accept='image/*' required/> <br>
                        
                        <input style = "width: 657px;" class="inputText" type="text" placeholder="Product ID" name ="prodID" required><br>
                        <input style = "width: 657px;" class="inputText" type="text" placeholder="Product Name" name ="prodName" required>
                        <br>
                        <input style = "width: 657px;" class="inputText" type="text" placeholder="Caption" name ="caption" required>
                        <br>
                        <textarea rows="4" cols="50" placeholder="Brief Description" name="briefdescription"></textarea><br>
                        <textarea rows="4" cols="50" placeholder="Description 1" name="description1"></textarea><br>
                        <input type="file" name="img_desc1" id="file"  accept='image/*' required/><br> 
                        <textarea rows="4" cols="50" placeholder="Description 2" name="description2"></textarea><br>
                        <input type="file" name="img_desc2" id="file"  accept='image/*' required/><br>
                       
                        <% 
                            ColorDAO colorDAO = new ColorDAO();
                            ArrayList<Color> allColors = colorDAO.getallColors();
                            
                           

                            for(Color color : allColors){
                        %>        
                        <input type="checkbox" name="color" value="<%=color.getName()%>"><img src="<%=color.getColor_img()%>"><%=color.getName()%><br>
                       
                        
                        
                        <%}%>    
                            
         
                            
                            
                            <input  type="number" name="modelAmount" placeholder="Amount of Model" min="1" max="5">
                            
                           
                      </form>  
              
                        
                       
                         
                
                
            
            
                
                 <input class="submit-button" type="submit" value="Submit" form="addnewProduct">
                 
    </body>
</html>

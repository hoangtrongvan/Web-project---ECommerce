
<%@page import="Category.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Category.CategoryDAO"%>
<%@page import="Customer.User"%>
<%@page import="Customer.UserDAO"%>
<style>
    body {
    margin: 0;
    
    padding : 0;
    font-family: 'Open Sans', sans-serif;
    
    
}
.signup-button{
    padding: 5px;
    color: #ffffff;
}
.signup-button:hover{
    color: #ffffff;
}
.nav{
    margin-top: 0;
    background-color: #151515;
    color: #c1c1c1;
    list-style: none;
    padding : 20px 0 20px 0;
    font-size: 10pt;
    margin-bottom: 0;
    text-align: left;
    
}


.nav li{
   
    display: inline-block;
    padding : 0 15px 0 15px;
    
}

.logo{
    float: left;
}
.logo img{
    width: 35px;
    height: 35px;
    margin-top: 10px;
    margin-left: 15px;
    margin-right: 15px;
}
.nav li a {
    text-decoration: none;
    color : #c1c1c1;
}
.nav li a:hover{
    color : #ffffff;
}
.modal1 {
    /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 9999; /* Sit on top */
    
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    /* Fallback color */
    /* Black w/ opacity */
     background: rgba(0, 0,1,0.8);
    visibility: hidden;
    opacity: 0;
    
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    margin-top: 150px;
    width: 70%;
    cursor:text;
    
   
  
}



.close1 {
    padding: 20px;
     top: 0;
    color: #c1c1c1;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close1:hover,
.close1:focus {
    color: #ffffff;
    text-decoration: none;
    cursor: pointer;
}



.modal-content input[type=text] {
    width: 100%;
    
    height: 80px;
    outline : none;
    font-size: 20pt;
    color: #ffffff;
    background-color: #2C2C2C;
    border: none;
    padding: 8px 20px 8px 20px;
    
}
.special{
    padding: 8px;
    background-color: #1C7FFF;
    border: 1px solid #1C7FFF;
    color: #ffffff;
    border-radius: 4px;
}

.special:hover{
    background-color: #0A74FE;
    color: #ffffff;
}

.cart {
  float: right;
}   
.cart img,.dropdown img{
    width: 35px;
    height: 35px;
    margin-top: 10px;
    margin-left: 15px;
    margin-right: 15px;
}


.dropdown {
    float: right;
    
    
    
    
}

.dropdown-content {
    display: none;
    position: absolute;
    z-index: 999;
    background-color: #f9f9f9;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    right: 0;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.show {display:block;}
.chip {
    display: inline-block;
    padding: 0 25px;
    height: 50px;
    font-size: 16px;
    line-height: 50px;
    border-radius: 25px;
    background-color: #f1f1f1;
}

.chip img {
    float: left;
    margin: 0 10px 0 -25px;
    height: 50px;
    width: 50px;
    border-radius: 50%;
}

.signOut{
    
    
}
.chip {
    display: inline-block;
    padding: 0 25px;
    height: 50px;
    font-size: 16px;
    line-height: 50px;
    border-radius: 25px;
    background-color: #f1f1f1;
}

.chip img {
    float: left;
    margin: 0 10px 0 -25px;
    height: 50px;
    width: 50px;
    border-radius: 50%;
}
</style>




<div class="navcontent">
        <% 
            String uEmail = null;
            
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                
                if(cookie.getName().equals("uEmail")){
                    uEmail= cookie.getValue();
                    
                }
            }
            }
            UserDAO userDAO = new UserDAO();
            User loginUser = userDAO.getUser(uEmail);
            session.setAttribute("loginUser", loginUser);
            String uFirstname = loginUser.getFirst_name();
            %>
      <div class="logo">
            <a href="/Pineapple/webpages/index.jsp"><img src="/Pineapple/icon/pineapple.png"></a>
        </div>
      <div style ="float : right; " class="logo">
            <a href="#"><img onclick="myFunction()" class="dropbtn"  src="/Pineapple/icon/maincart.png"></a>
        </div>
        
  
     
    <ul class="nav">
       
        <% 
                            CategoryDAO categoryDAO = new CategoryDAO();
                            ArrayList<Category> allcategories = categoryDAO.getAllCategories();
                            
                           

                            for(Category category: allcategories){
                                String categoryName = category.getCategory();
                        %> 
        
        <li><a href="/Pineapple/Product/Category.jsp?categoryName=<%=categoryName%>"><%=categoryName%></a></li>
        
        <% }%>
        <li  id="myBtn1"><a href="#">Search</a></li>
        <%if(uEmail!=null){ %>
        
          
             

       
        <% }%>
         <%if (uEmail!=null){%>
         <% if (loginUser.getIsManager()==1 || loginUser.getIsManager()==2){%>
         
         <li style="float: right;"><a style="color:#ffffff;" class="special" href="/Pineapple/Manager/Product-List.jsp">Manager</a></li>
         
         <%}%>
         
         
        <%}else{%>  
         <li style="float: right;"><a style="color:#ffffff;" class="special" href="/Pineapple/User/signup.jsp">Sign up</a></li>
        <li style="float: right;"><a href="/Pineapple/User/login.jsp">Sign in</a></li>
        <%}%>
        <li style="float: right;"><a href="#">Help & Support</a></li>
        <!-- The Modal -->
    </ul>
    
<div id="myModal1" class="modal1">
   <span class="close1">&times</span>
  <!-- Modal content -->
  <div class="modal-content">
    
     
 
   <form>
  <input type="text" name="search" placeholder="Search pineapple.com.." >
</form>
  </div>
</div>
</div>
        
<div id="myDropdown" class="dropdown-content">
    
    <a href="/Pineapple/Transaction/PineappleCart.jsp">Cart</a>
    <a href="/Pineapple/User/account.jsp">Account</a>
    <a  class="signOutContainer" href="#home"> 
        <label for="signout">Sign out, <%=uFirstname%></label>
    </a>
    <form action="/Pineapple/userServlet?action=signout" method="post">
                 
             <input style="display: none;" class="signOut" type="submit" value="" id="signout">
        </form>
  </div>
        <script>
            
// Get the modal
var modal1 = document.getElementById('myModal1');

// Get the button that opens the modal
var btn1 = document.getElementById("myBtn1");

// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close1")[0];


// When the user clicks the button, open the modal
btn1.onclick = function() {
    modal1.style.visibility = "visible";
     modal1.style.opacity = "1";
     modal1.style.transition = "opacity 0.1s linear";
    
     
};

// When the user clicks on <span> (x), close the modal
span1.onclick = function() {
    modal1.style.visibility = "hidden";
    modal1.style.opacity = "0";
    modal1.style.transition = "visibility 0s 0.1s,opacity 0.1s linear";
   
};
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
        </script>
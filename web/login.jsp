<%-- 
    Document   : login
    Created on : Nov 15, 2016, 8:35:00 AM
    Author     : nhatduthan2405
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            .recover{
    display: none;           /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    visibility: hidden;
    opacity: 0;
    
    padding-top: 100px;
       
               
                
            }
            .login{
                width: 100%;
               top: 0;
               z-index: 1;
                
                padding-top: 60px;
                padding-bottom: 60px;
               
                
            }
            .login-content,.recover-content{
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                border: 0 solid #333;
                border-radius: 4px;
                width: 80%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                
               
            }
            .login-header,.recover-header{
                padding: 2px 16px;
                color: black;
            }
            .login-body{
                padding: 2px 15px;
                
                display: block;
                overflow: auto;
                
            }
             .recover-body{
                padding: 2px 15px;
                
                width: 100%;
            }
            .login-footer,.recover-footer{
                padding: 10px 16px;
                color: black;
                 display: block;
                overflow: auto;
                
            }
            hr.style-two {
    border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #333, #ccc);
   
}
.div-left{
    
    float: left;
    padding-top: 40px;
    
    width: 50%;
}
.div-right{
    
    float: left;
    padding-top: 40px;
    width: 40%;
    
}
.inputText{
                width: 327px;
                padding: 12px 20px;
                margin: 8px 0;
                display : incline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .inputEmail{
                width: 80%;
                padding: 20px 20px;
                margin: 8px 0;
                display : incline-block;
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
            .submit-button:hover{
                background-color: #0A74FE;
            }
            .form-signin{
                margin-left: 50px;
            }
.div-left{
   text-align: left;
}
.forgotPassword, .Sign-up,.forgotPassword:visited,.Sign-up:visited{
    color: blue;
    text-decoration: none;
}
.forgotPassword:hover,.Sign-up:hover{
    text-decoration: underline;
}
body {
    margin: 0;
    
    padding : 0;
    font-family: 'Open Sans', sans-serif;
    
    
}
.cancel{
 width: 100px;
               
               
                padding: 14px 20px;
                margin: 8px 0;
                border : none;
                border-radius: 4px;
                cursor : pointer;    
background-color: #f9f9f9;
color: #1C7FFF;
border: 1px solid #ccc;

}
.cancel:hover{
    background-color: #EDEDED;
}
/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color:#333;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #1C7FFF;
    text-decoration: none;
    cursor: pointer;
}

        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="login">
        <div class="login-content">
            <div class="login-header">
                <h2>Please Sign in</h2>
               
                
                <hr class="style-two">
            </div>
            <div class="login-body">
                <div class="div-left">
                    <form class="form-signin" action="login">
                        <h2>Sign in to Pineapple</h2>
                        <input class="inputText" type="text" name="username" placeholder="Pineapple ID*" required><br>
                        <input class="inputText" type="password" name="password" placeholder="Password*" required><br>
                        <a class="forgotPassword" href="#" id="myBtn">Forgot your Pineapple ID or Password?</a><br><br>
                        <input class="submit-button" type="submit" value="Sign in">
                               
                    </form>
                </div>
                <div class="div-right">
                    <h3>You can use your Pineapple ID for other Pineapple services 
                        such as</h3>
                    <ul>
                        <li> Pineapple Store
                        <li> pTunes Store
                        <li> pPhoto Print Products
                        <li> pCloud
                            
                    </ul><br>
                    
                    <a class="Sign-up" href="signup.jsp">Don't have an Pineapple ID? Create one now.</a>
                </div>
            </div>
            <div class="login-footer">
                <hr class="style-two">
                 <input class="cancel" type="submit" value="Cancel">
                 <p style="float:right;">Questions? Just ask. 1-800-MY-PINEAPPLE</p>
            </div>
        </div>
        </div>
        </div>
        
       
        <div class="recover" id="myRecover">
        <div class="recover-content">
            <div class="recover-header">
                <span class="close">&times</span>
                <h2>Please input your email</h2>
                
                <hr class="style-two">
            </div>
            <div class="recover-body" style="text-align:center;" >
                
                    <form action="#" method="post">
                        <h2>We will send the password to your email</h2>
                        <input class="inputEmail" type="text" placeholder="name@example.com*" required><br>
                        
                    <div class="recover-footer" style="text-align:right;">
                <hr class="style-two">
                 <input style="right:0;" class="cancel" type="submit" value="Submit">
                 
            </div>    
                               
                    </form>
                
            </div>
            <div class="recover-footer" style="text-align:right;">
                <hr class="style-two">
                 <input style="right:0;" class="cancel" type="submit" value="Submit">
                 
            </div>
        </div>
        </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script>
// Get the modal
var modal = document.getElementById('myRecover');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
    modal.style.visibility = "visible";
     modal.style.opacity = "1";
     modal.style.transition = "opacity 0.1s linear";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
   modal.style.visibility = "hidden";
    modal.style.opacity = "0";
    modal.style.transition = "visibility 0s 0.1s,opacity 0.1s linear";
    
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
         modal.style.visibility = "hidden";
    modal.style.opacity = "0";
    modal.style.transition = "visibility 0s 0.1s,opacity 0.1s linear";
    }
}
</script>
    </body>
</html>

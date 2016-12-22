<%-- 
    Document   : signup
    Created on : Nov 15, 2016, 9:26:11 PM
    Author     : nhatduthan2405
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        
        <title>Sign Up</title>
        <style>
            .signup{
                padding: 60px;
            }
            .signup-content{
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                border: 0 solid #333;
                border-radius: 4px;
                width: 80%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
               
            }
            .signup-header{
                padding: 2px 16px;
                color: black;
            }
            .signup-body{
                padding: 2px 15px;
                
                
            }
            .signup-footer{
                padding: 10px 16px;
                color: black;
                border-top: 0.5px;
            }
            hr.style-two {
    border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #333, #ccc);
   
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
            body {
    margin: 0;
    
    padding : 0;
    font-family: 'Open Sans', sans-serif;
            }
            .submit-button:hover{
                background-color: #0A74FE;
            }
           
    .popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* The actual popup */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 100%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}


/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}

.Error{
    color: red;
}


        </style>
    </head>
    <body>
        
        <jsp:include page="../HeaderandFooter/navbar.jsp" />
       
         <div class="signup">
        <div class="signup-content">
            <div class="signup-header" >
                <h2>Sign Up</h2>
               
                
                <hr class="style-two">
            </div>
            <div class="signup-body">
                <% String notmatch = (String)session.getAttribute("notMatch");
                   session.removeAttribute("notMatch");
                   String wasRegistered = (String)session.getAttribute("wasRegistered");
                   session.removeAttribute("wasRegistered");
                %>
                    <form class="form-signin" action="/Pineapple/userServlet?action=signup" method="post" id="signupForm" onsubmit="return(validate());">
                        <input style = "width: 657px;" class="inputText" type="email" placeholder="name@example.com" name="email" required ><%if(wasRegistered!=null){ %><br> <span class="Error"> <% out.println(wasRegistered); %></span> <% }%><br>
                        <input style = "width: 657px;" class="inputText" type="password" placeholder="password" name ="password" required  onkeyup="CheckPasswordStrength(this.value)">
                        <span id="password_strength"></span><br>
                        <input style = "width: 657px;" class="inputText" type="password" placeholder="confirm password" name ="confirm_password" required><%if(notmatch!=null){ %><br> <span class="Error"> <% out.println(notmatch); %></span> <% }%><br>
           
                        <input class="inputText" type="text" placeholder="first name" name ="first_name" required>
                        <input class="inputText" type="text" placeholder="last name" name ="last_name" required><br>
                        <input class="inputText" type="text" placeholder="birthday" name ="birthday" required>
                        <input class="inputText" type="tel" placeholder="phone number" name ="phone_number" required><br>
                        <input style = "width: 657px;" class="inputText" type="text" placeholder="address" name ="address"  required><br><br>
                        <input type="checkbox" name="recieveInfo" value="wannaRecieve">recieve information from us<br>
                       
                      </form>  
                        
                        
                       
                         
                
                
            </div>
            <div class="signup-footer">
                <hr class="style-two">
                 <input class="submit-button" type="submit" value="Submit" form="signupForm">
                 
            </div>
        </div>
        </div>
        
        <jsp:include page="../HeaderandFooter/footer.jsp" />
<script type="text/javascript">
     function displayOldInfo(){
    document.signupForm.fullName.value = getCookie("fullname") ;
    document.signupForm.email.value = getCookie("email") ;
    document.signupForm.userName.value = getCookie("username");
    }
    function setCookie(cname,cvalue,exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays*24*60*60*1000));
            var expires = "expires=" + d.toGMTString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }
    
    
    function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i = 0; i < ca.length; i++) {
            var c = ca[i];
                while (c.charAt(0) == ' ') {
                     c = c.substring(1);
                 }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
    }
    
   
    function validate()
      {
      
         var fullName = document.signupForm.fullName.value;
         if( fullName == "" )
         {
            alert( "Please provide your fullname" );
            document.signupForm.fullName.focus() ;
            return false;
         }else setCookie("fullname",fullName,30);
         
         
         var email = document.signupForm.email.value;
         var atPosition = email.indexOf("@");
         var dotPosition = email.lastIndexOf(".");
         var lastPosition = email.length;
         if(atPosition < 1 || dotPosition - atPosition < 2 || lastPosition - dotPosition < 2) 
         {
            alert("Please provide correct email");
            document.signupForm.email.focus() ;
            return false;
         }else setCookie("email",email,30);
         var userName = document.signupForm.userName.value;
         if( userName == "" )
         {
            alert( "Please provide your username" );
            document.signupForm.userName.focus() ;
            return false;
         }else setCookie("username",userName,30);
         var password = document.signupForm.password.value;
         var confirmPass = document.signupForm.confirm_password.value;
         if( password!=confirmPass)
         {
            alert( "Confirm Password not match" );
            document.signupForm.confirm_password.focus() ;
            return false;
         }
         return (true);
     }
    function CheckPasswordStrength(password) {
        var password_strength = document.getElementById("password_strength");
 
        //TextBox left blank.
        if (password.length == 0) {
            password_strength.innerHTML = "";
            return;
        }
 
        //Regular Expressions.
        var regex = new Array();
        regex.push("[A-Z]"); //Uppercase Alphabet.
        regex.push("[a-z]"); //Lowercase Alphabet.
        regex.push("[0-9]"); //Digit.
        regex.push("[$@$!%*#?&]"); //Special Character.
 
        var passed = 0;
 
        //Validate for each Regular Expression.
        for (var i = 0; i < regex.length; i++) {
            if (new RegExp(regex[i]).test(password)) {
                passed++;
            }
        }
 
        //Validate for length of Password.
        if (passed > 2 && password.length > 8) {
            passed++;
        }
 
        //Display status.
        var color = "";
        var strength = "";
        switch (passed) {
            case 0:
            case 1:
                strength = "Weak";
                color = "red";
                break;
            case 2:
                strength = "Good";
                color = "darkorange";
                break;
            case 3:
            case 4:
                strength = "Strong";
                color = "green";
                break;
            case 5:
                strength = "Very Strong";
                color = "darkgreen";
                break;
        }
        password_strength.innerHTML = strength;
        password_strength.style.color = color;
    }
</script>
    </body>
</html>

<%-- 
    Document   : account
    Created on : Dec 6, 2016, 9:23:24 AM
    Author     : nhatduthan2405
--%>

<%@page import="Customer.UserDAO"%>
<%@page import="Customer.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
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
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-top: none;
                margin-left:20%;
                padding:1px 16px;
                height:1000px;
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
                width: 327px;
                padding: 12px 20px;
                margin: 8px 0;
                display : incline-block;
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

            @-webkit-keyframes fadein {
                from {bottom: 0; opacity: 0;} 
                to {bottom: 30px; opacity: 1;}
            }

            @keyframes fadein {
                from {bottom: 0; opacity: 0;}
                to {bottom: 30px; opacity: 1;}
            }

            @-webkit-keyframes fadeout {
                from {bottom: 30px; opacity: 1;} 
                to {bottom: 0; opacity: 0;}
            }

            @keyframes fadeout {
                from {bottom: 30px; opacity: 1;}
                to {bottom: 0; opacity: 0;}
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */

                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                border: 1px solid #888;
                width: 10px;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: animatetop;
                -webkit-animation-duration: 0.4s;
                animation-name: animatetop;
                animation-duration: 0.4s
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
                color: #333;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .modal-header {
                padding: 2px 16px;
                background-color: #F3F3F3;
                color: #333;
            }

            .modal-body {
                padding: 16px 16px;
                text-align: center;
            }

            .modal-footer {
                padding: 2px 16px;
                background-color: #F3F3F3;
                color: #333;
                display: block;
                overflow: auto;
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
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    </head>
    <body>
        <%
            String uEmail = null;

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("uEmail")) {
                        uEmail = cookie.getValue();

                    }
                }
            }
            UserDAO userDAO = new UserDAO();
            User loginUser = userDAO.getUser(uEmail);

            String firstname = loginUser.getFirst_name();
            String lastname = loginUser.getLast_name();
            String full_name = firstname + " " + lastname;
            String dob = loginUser.getDob();
            String phone_number = loginUser.getPhone_number();
            String address = loginUser.getAddress();
            String ava_url = loginUser.getImage_url();
            String email = loginUser.getEmail();
        %>
        <%if (uEmail==null){
            response.sendRedirect("../webpages/Error.jsp");
        }%>
        <jsp:include page="../HeaderandFooter/navbar.jsp" />
        <div id="snackbar"></div>
        <%
            String success = (String) session.getAttribute("SuccessUpdated");
            session.removeAttribute("SuccessUpdated");
            String valid = (String) session.getAttribute("Valid");
            session.removeAttribute("Valid");
      if (success != null) {%>
        <script>
            var password_strength = document.getElementById("password_strength");


            var x = document.getElementById("snackbar")
            x.innerHTML = "<%=success%>";
            x.className = "show";
            setTimeout(function () {
                x.className = x.className.replace("show", "");
            }, 3000);

        </script>

        <%} else if (valid != null) {%>

        <script>
            var password_strength = document.getElementById("password_strength");


            var x = document.getElementById("snackbar")
            x.innerHTML = "<%=valid%>";
            x.className = "show";
            setTimeout(function () {
                x.className = x.className.replace("show", "");
            }, 3000);

        </script>

        <%}%>





        <ul class="tab">
            <li class="ava-content">
                <div style="position : relative;">
                    <div class="avaChange"><button id="myBtn">Change Avatar</button></div>
                    <img class="avatar" src="<%=ava_url%>">
                </div>
            </li>

            <li class="displayName">

                <h3><%=full_name%></h3>
                <p style="color: #80C8EA;"><b><%=email%></b></p>
                <br>
            </li>

            <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'MyProfile')" id="defaultClick">My Profile</a></li>
            <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'AccountSettings')">Account Settings</a></li>
            <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'ChangePassword')">Change Password</a></li>
        </ul>

        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close">x</span>
                    <h2>Upload an avatar</h2>
                </div>
                <div class="modal-body">
                    <img id="blah" src="..\avatars\defaultAvatar.png" alt="" />
                    <form method="POST" action="/Pineapple/userServlet?action=changeAvatar" enctype="multipart/form-data" id="uploadAva">
                        <label class="btn-upload">
                            <input type="file" name="file" id="file"  accept='image/*' required/> 
                            <script>
                                var fl = document.getElementById('file');

                                fl.onchange = function (e) {
                                    var ext = this.value.match(/\.(.+)$/)[1];
                                    switch (ext)
                                    {
                                        case 'jpg':
                                        case 'JPG':
                                        case 'png':
                                        case 'PNG':


                                            break;
                                        default:
                                            alert('Sorry only image types are accepted');
                                            this.value = '';
                                    }
                                };
                            </script>
                            <button class="btn">Browse</button>
                        </label><br/>




                    </form>
                    <script>
                        function readURL(input) {
                            if (input.files && input.files[0]) {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    $('#blah').attr('src', e.target.result);
                                }

                                reader.readAsDataURL(input.files[0]);
                            }
                        }

                        $("#file").change(function () {
                            readURL(this);
                        });</script>
                </div>
                <div class="modal-footer">
                    <input style="float:right;" class="submit-button" type="submit" value="Upload" name="upload" id="upload" form="uploadAva"/>
                </div>
            </div>

        </div>

        <script>
            // Get the modal
            var modal = document.getElementById('myModal');

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
        <div id="MyProfile" class="tabcontent">

            <h1 style="color:#767676">My Profile</h1>
            <hr class="style-two">
            <h4>Email</h4>
            <p><%=email%></p>
            <h4>Name</h4>
            <p><%=firstname + " " + lastname%></p>
            <h4>Date Of Birth</h4>
            <p><%=dob%></p>
            <h4>Address</h4>
            <p><%=address%></p>
            <h4>Phone Number</h4>
            <p><%=phone_number%></p>



        </div>

        <div id="AccountSettings" class="tabcontent">

            <div class="signup-content">
                <div class="signup-header" >
                    <h1 style="color:#767676">Edit Profile</h1>


                    <hr class="style-two">
                </div>
                <div class="signup-body">

                    <form class="form-signin" action="/Pineapple/userServlet?action=updateInfo" method="post" id="updateInfoForm" >
                        <input class="inputText" value="<%=email%>" type="email" placeholder="name@example.com" name="email" readonly><br>

                        <input class="inputText" value="<%=firstname%>" type="text" placeholder="first name" name ="first_name" required><br>
                        <input class="inputText" value="<%=lastname%>" type="text" placeholder="last name" name ="last_name" required><br>
                        <input class="inputText" value="<%=dob%>" type="text" placeholder="birthday" name ="birthday" required><br>
                        <input class="inputText" value="<%=phone_number%>" type="tel" placeholder="phone number" name ="phone_number" required><br>
                        <input class="inputText" value="<%=address%>" type="text" placeholder="address" name ="address"  required><br><br>


                    </form>  







                </div>
                <div class="signup-footer">

                    <input class="submit-button" type="submit" value="Submit" form="updateInfoForm">

                </div>
            </div>
        </div>
        <div id="ChangePassword" class="tabcontent">
            <div class="signup-content">
                <div class="signup-header" >
                    <h1 style="color:#767676">Change Password</h1>


                    <hr class="style-two">
                </div>
                <div class="signup-body">

                    <form class="form-signin" action="/Pineapple/userServlet?action=updatePassword" method="post" id="updatePassword" >

                        <input style = "width: 657px;" class="inputText" type="password" placeholder="old password" name ="old_password" required>

                        <input style = "width: 657px;" class="inputText" type="password" placeholder="new password" name ="new_password" required>

                        <input style = "width: 657px;" class="inputText" type="password" placeholder="confirm new password" name ="confirm_newpassword" required><br>



                    </form>  






                </div>
                <div class="signup-footer">

                    <input class="submit-button" type="submit" value="Submit" form="updatePassword">

                </div>
            </div>

        </div>

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
            document.getElementById("defaultClick").click();

        </script>
    </body>
</html>

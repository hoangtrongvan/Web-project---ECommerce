<%-- 
    Document   : Success
    Created on : Dec 19, 2016, 3:02:43 PM
    Author     : nhatduthan2405
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contacts</title>
        <style>
            .contrainerSuccess{
                padding-top: 40px;
                text-align: center;
                font-size: 15pt;

            }
            .contrainerSuccess img{
                width: 120px;
                height: 120px;
            }
            .contrainerSuccess h1{
                font-size: 50pt;
                font-weight: bold;
            }
            .signature{

                font-style: italic;
            }
            .founderName,.signature{
                font-size: 12pt;
            }
            .userName, .thankyou{
                color: #7E7E7E;
            }
            .chip {
                display: inline-block;
                
                padding: 0 25px;
                height: 50px;
                font-size: 16px;
                line-height: 50px;
                margin-right: 20px;
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
    </head>
    <body>

        <jsp:include page="../HeaderandFooter/navbar.jsp" />
        <div class="contrainerSuccess">
            <img src="/Pineapple/icon/contacts.ico">
            <h1>Contacts</h1>
            <div class="chip">
                <img src="/Pineapple/icon/phoneNumber.png" alt="Person" width="96" height="96">
                0932700472
                
            </div>
            <div class="chip">
               
                 <img src="/Pineapple/icon/email.ico" alt="Person" width="96" height="96">
                pineapplevncorp@gmail.com
                 
            </div>
            <div class="chip">
                
                 <img src="/Pineapple/icon/facebookIcon.png" alt="Person" width="96" height="96">
                facebook.com/pineapple
            </div>
             <div class="chip">
                
                 <img src="/Pineapple/icon/twitter1.png" alt="Person" width="96" height="96">
                @pineapple
            </div>
            

        </div>
    </body>
</html>

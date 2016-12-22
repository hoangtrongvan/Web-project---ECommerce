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
        <title>Successful Transaction</title>
        <style>
            .contrainerSuccess{
                padding-top: 40px;
                text-align: center;
                font-size: 15pt;
                
            }
            .contrainerSuccess img{
                width: 80px;
                height: 80px;
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
        </style>
    </head>
    <body>
        <%String userName = request.getParameter("userName");
        if (userName == null) {
                response.sendRedirect("../webpages/Error.jsp");
            }
        %>
        <jsp:include page="../HeaderandFooter/navbar.jsp" />
        <div class="contrainerSuccess">
            <img src="/Pineapple/images/sucessfulCheckout.png">
            <h1>You're all set!</h1>
            <p class="userName">USER : <b><%=userName%><b></p>
            <p class="thankyou">Thanks for being awesome, we hope you enjoy your purchase!</p>
            <p class="thankyou">We'll send a receipt to your email shorly.</p>
            <br><br>
            <p class="founderName"><b>Nhat Truong,</b></p>
            <p class="signature">Co-founder, Pineapple.Inc</p>
            
        </div>
    </body>
</html>

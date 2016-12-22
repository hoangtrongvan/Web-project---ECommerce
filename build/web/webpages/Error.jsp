<%-- 
    Document   : Error
    Created on : Dec 1, 2016, 9:12:49 PM
    Author     : nhatduthan2405
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <style>
            
             .contrainerSuccess{
                padding-top: 150px;
                text-align: center;
                font-size: 15pt;
                
            }
            .contrainerSuccess img{
                width: 100px;
                height: 100px;
            }
            .contrainerSuccess h1{
                font-size: 30pt;
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
        <jsp:include page="../HeaderandFooter/navbar.jsp" />
        
        <div class="contrainerSuccess">
            <img src="/Pineapple/images/error.png">
            <h1 class="containerH1">Page Not Found 404</h1>
        </div>
            
        
        
    </body>
</html>

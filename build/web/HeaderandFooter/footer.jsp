
<style>
    body {
        margin: 0;

        padding : 0;
        font-family: 'Open Sans', sans-serif;



    }

    .footer-content{
        margin-top: 4px;
        background-color: #F4F4F4;
        color: #151515;
        display: block;

        padding : 10px;
        font-size: 10pt;
        margin-bottom: 0;

        text-align: center;

    }
    .categories,.subcribe{
        display: inline-block;
        vertical-align: top;
        text-align: left;

    }
    .subcribe{
        margin-left: 200px;

    }
    .categories ul{
        list-style: none;
    }
    .categories a,.categories a:visited{
        color: #333333;
        text-decoration: none;
    }
    .categories a:hover{
        text-decoration: underline;
        color: black;
    }
    .bottom{

        margin-top: 0;
        background-color: #151515;
        color: #c1c1c1;
        display: block;

        padding: 3px;
        font-size: 10pt;
        margin-bottom: 0;
        text-align: center;
    }
    .inputsubcribeEmail{
        width: 80%;
        padding: 20px 20px;

        display: block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        display: inline-block;
    }     
    .subcribe-button{
        margin-left: 0;
        width: 100px;
        background-color: #333;
        color: #c1c1c1;
        padding: 20px 20px;

        border : none;
        border-radius: 4px;
        cursor : pointer;
        display: inline-block;



    }
    .subcribe-button:hover{
        color: white;
        background-color: black;

    }
    .content-bottom{
        margin-bottom: 0;
        border-bottom: none;

        bottom: 0;
    }
    #announcement{
        padding-top: 10px;
    }

</style>
<div class="content-bottom">
    <div class="footer-content">
        <div class="categories">

            <ul>
                <li><h4>Categories</h4></li>
                <li><a href="/Pineapple/webpages/index.jsp">Home</a></li>
                <li><a href="/Pineapple/Product/Category.jsp?categoryName=pac">Pac</a></li>
                <li><a href="/Pineapple/Product/Category.jsp?categoryName=pPhone">pPhone</a></li>
                <li><a href="/Pineapple/Product/Category.jsp?categoryName=pPad">pPad</a></li>
                <li><a href="/Pineapple/webpages/Contacts.jsp">Contacts</a></li>
            </ul>
        </div>
       

        <div class="subcribe">
            <h3>Stay up-to-date with our new openings, upcoming events, seasonal specials, and promotions</h3>
            <form action="javascript:void(0)" id="subForm">
                <input class="inputsubcribeEmail" type="text" name="email" placeholder="name@example.com*" required id="inputSubEmail">


                <input class="subcribe-button" type="submit" value="Subcribe" onclick="subcribe()">
                <br><br>
                <span id="announcement"></span>
            </form>
           

        </div>
    </div>

    <div class="bottom">
        <h5>Copyright © 2016 PineApple Inc. All rights reserved.</h5>
    </div>
    <div class="clr"></div>
    <script>
        function validate() {
            var email = document.subForm.email.value;
            var atPosition = email.indexOf("@");
            var dotPosition = email.lastIndexOf(".");
            var lastPosition = email.length;
            if (atPosition < 1 || dotPosition - atPosition < 2 || lastPosition - dotPosition < 2)
            {
                alert("Please provide correct email");
                document.subForm.email.focus();
                return false;
            } else {

                subcribe();
            }

        }
        var request;
        function getRequestObject() {
            if (window.ActiveXObject) {
                return(new ActiveXObject("Microsoft.XMLHTTP"));
            } else if (window.XMLHttpRequest) {
                return(new XMLHttpRequest());
            } else {
                return(null);
            }
        }

        function sendRequestWithData(address, data,
                responseHandler) {
            request = getRequestObject();
            request.onreadystatechange = responseHandler;
            request.open("POST", address, true);
            request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            request.send(data);
        }

        function subcribe() {
            var address = "/Pineapple/userServlet";
            var subEmail = document.getElementById("inputSubEmail").value;
            var data = "action=subcribe" + "&subEmail=" + subEmail;
            sendRequestWithData(address, data, showResponseText);
        }

        function showResponseText() {
            if ((request.readyState == 4) &&
                    (request.status == 200)) {
                document.getElementById("announcement").innerHTML = request.responseText;
            }
        }

    </script>
</div>


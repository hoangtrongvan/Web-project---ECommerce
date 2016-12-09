<style>
body {
    margin: 0;
}

.horizon-nav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

.horizon-nav li {
    float: left;
}

.horizon-nav li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.horizon-nav li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #1C7FFF;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<ul class="horizon-nav" id="wrap">
  <li><a id="prod" class="current" href="/Pineapple/Manager/Product-List.jsp">Product List</a></li>
  <li><a id="cus" class="current" href="/Pineapple/Manager/Customer-List.jsp">User List</a></li>
  <li><a id="mana" class="current" href="/Pineapple/Manager/Manager-List.jsp">Manager List</a></li>
  <li><a id="ord" class="current" href="/Pineapple/Manager/Order-List.jsp">Order List</a></li>
  <li><a id="total"  class="current" href="#news">Total Income</a></li>
</ul>
 <script>
    var elementPosition = $('#bla').offset();

    $(window).scroll(function () {
        if ($(window).scrollTop() > elementPosition.top) {
            $('#wrap').css('position', 'fixed').css('top', '0').css('width','100%');
        } else {
            $('#wrap').css('position', 'static');
        }
     });
    
</script>
<%-- 
    Document   : index
    Created on : Nov 19, 2016, 11:36:43 PM
    Author     : nhatduthan2405
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Pineapple</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <style>
      .mySlides {
    display:none;
  
  
   
}

/* Slideshow container */
.slideshow-container {
  margin-top: 0;
  width: 100%;
  height: 500px;
  overflow:hidden;
  position: relative;
  top: -5%;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  top: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
  
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}
.mySlides img{
    
   
   
  min-height:100%;
  
    
    
    width:100%;
    
}
@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
.dotDiv{

  
  position: absolute;
  bottom: 10px;
  
  left: 50%; 
  
}
/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.9);
} 

.special2{
      padding: 8px;
    background-color: #1C7FFF;
    border: 1px solid #151515;
     
      
    border-radius: 4px;
}
.special2 span{
    visibility: hidden;
}
.containerIMG {
    
    height: 200px;
    
    text-align: justify;
    -ms-text-justify: distribute-all-lines;
    text-justify: distribute-all-lines;
    
    /* just for demo */
    min-width: 612px;
}

.imgbox1, .imgbox2, .imgbox3, .imgbox4 {
    width: 334px;
    height: 200px;
    vertical-align: top;
    display: inline-block;
    *display: inline;
    zoom: 1;
        
    background-color: #F4F4F4;
}
.stretch {
    width: 100%;
    display: inline-block;
    font-size: 0;
    line-height: 0
}
.desc{
      padding: 15px;
    text-align: center;
}


  </style>

  
</head>
<body>
    
    <jsp:include page="navbar.jsp" />
     <div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="images/1.jpg" style="-webkit-transform: translate(0, -150px);" >
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="images/2.jpg" style="-webkit-transform: translate(0, -150px);" >
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="images/3.jpg" style="-webkit-transform: translate(0, 150px);" >
  <div class="text">Caption Three</div>
</div>
<div class="dotDiv" style="text-align:center">
  <span class="dot"></span>
  <span class="dot"></span>
  <span class="dot"></span>
</div>
<a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a>        
</div>
    <div class="containerIMG">
         
    <div class="imgbox1">
       <div class="desc">Advertising</div>
       
    </div>
          
    <div class="imgbox2">
       <div class="desc">Advertising</div>
       
    </div>
    <div class="imgbox3">
        <div class="desc">Advertising</div>
        
        
    </div>
          
    <div class="imgbox4">
     <div class="desc">Advertising</div>
        
    </div>
        <span class="stretch"></span>
    </div>
<jsp:include page="footer.jsp" />

    <script>


var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 4000); // Change image every 2 seconds
    
    }
    function plusSlides(n) {
  showSlides(slideIndex += n);
}
</script>



</body>
</html>



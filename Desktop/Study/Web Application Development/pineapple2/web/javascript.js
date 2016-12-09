
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.visibility = "visible";
     modal.style.opacity = "1";
     modal.style.transition = "opacity 0.1s linear";
    
     
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.visibility = "hidden";
    modal.style.opacity = "0";
    modal.style.transition = "visibility 0s 0.1s,opacity 0.1s linear";
   
}

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

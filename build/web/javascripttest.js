
// Get the modal
var modal1 = document.getElementById('myModal1');

// Get the button that opens the modal
var btn1 = document.getElementById("myBtn1");

// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close1")[0];


// When the user clicks the button, open the modal
btn1.onclick = function() {
    modal1.style.visibility = "visible";
     modal1.style.opacity = "1";
     modal1.style.transition = "opacity 0.1s linear";
    
     
};

// When the user clicks on <span> (x), close the modal
span1.onclick = function() {
    modal1.style.visibility = "hidden";
    modal1.style.opacity = "0";
    modal1.style.transition = "visibility 0s 0.1s,opacity 0.1s linear";
   
};

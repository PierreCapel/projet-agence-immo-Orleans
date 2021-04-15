/*
* --------- script message of contact.html.twig--------------
*/

const message ="Votre message à bien été envoyé";

document
  .getElementById("contactForm")
  .addEventListener("submit", function(event) {
    event.preventDefault();
    alert(message);
  });
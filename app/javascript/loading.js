import Typed from 'typed.js';

const loading = () => {
  let options = {
      strings: [
      "LOOKING FOR <br> TEAM MATES",
      "8567 players <br> online",
      "6342 girls <br> online",
      "342 friends <br> of my friends",
      "576 <br> endorsements",
      "That's it!",
      "Your team <br> is complete"
      ],
      typeSpeed: 10,
      onComplete: function() {
        document.querySelector(".typed-cursor").remove();
      }
  }

  let typed = new Typed(".typed" , options);

  const circles = document.querySelectorAll(".tool");
  circles.forEach(function(circle, index) {
    circle.classList.add("toggle-content");
    circle.classList.add("to-remove");
  })

  function animate(){
    let circle = document.querySelector(".to-remove");
    circle.classList.remove("to-remove");
    circle.classList.add("is-grow");
  }
  setInterval(animate, 2500);
}

export { loading };

import Typed from 'typed.js';

const loading = () => {
  let options = {
      strings: ["Looking for team mates",
      "8567 players online",
      "6342 girls online",
      "342 friends of my friends",
      "576 top endorsement",
      "That's it!",
      "Your team is complete"
      ],
      typeSpeed: 40,
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
    // function vis(){
    //   circle.classList.add("is-visible")
    // }
    // setTimeout(vis, 1000);
  }
  setInterval(animate, 1000);


}

export { loading };

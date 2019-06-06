
const reviews = () =>{
  const submitBtn = document.querySelector("#review-sub");

  submitBtn.addEventListener('click', event => {
    const cards = document.querySelectorAll(".flipcard-user");

    cards.forEach(function(card, index){

      const addFriend = card.querySelector(".add_friend")
      const endorse = card.querySelector(".endorse")
      const nok = card.querySelector(".nok")
      const nokPositive = card.querySelector(".nok_positiveness")
      const nokCom = card.querySelector(".nok_communication")
      const nokHelp = card.querySelector(".nok_helpfulness")
      const nokRespect = card.querySelector(".nok_respect")

      let friend = false;
      if (addFriend.checked) {
        friend = true;
      }

      let endor = false
      if (endorse.checked) {
        endor = true
      }

      let nokk = false;
      let nokpositive = false;
      let nokcom = false;
      let nokhelp = false;
      let nokrespect = false;

      if (nok.checked) {
        nokk =  true
        if (nokCom.checked) {
          nokcom = true;
        }
        if (nokPositive.checked) {
          nokpositive = true;
        }
        if (nokHelp.checked) {
          nokhelp = true;
        }
        if (nokRespect.checked) {
          nokrespect = true;
        }
      }

      let mydata = {
        "add_friend": friend,
        "endorse": endor,
        "nok": nokk,
        "nok_positiveness": nokpositive,
        "nok_respect": nokrespect,
        "nok_communication": nokcom,
        "nok_helpfulness": nokhelp,
        "user_reviewed_id": card.id
      }

      const pathname = window.location.pathname;
      const teamId = pathname.split("/")[2];

      fetch("/teams/" + teamId + "/user_reviews", {
        method: "POST",
        body: JSON.stringify(mydata),
        headers: { "Content-Type": "application/json" }
      }).then((response) => {
        if (response.ok) {

        } else {
          alert("the fuck did you do");
        }
      })
    })

    const reviewTeam = () => {
      const teamCard = document.querySelector(".flipcard-team");

      let rating = teamCard.querySelector("#rater").dataset.rating
      let comment = teamCard.querySelector("#team_review_comment").value;

      let mydata = {
        "rating": rating,
        "comment": comment
      }
      const pathname = window.location.pathname;
      const teamId = pathname.split("/")[2];

      fetch("/teams/" + teamId + "/team_reviews", {
        method: "POST",
        body: JSON.stringify(mydata),
        headers: { "Content-Type": "application/json" }
      }).then((response) => {
        if (response.ok) {
          let prof = document.querySelector("#user-profile")
          window.location.href = prof.href;
        } else {
          location.reload();
        }
      })
    }
    reviewTeam();
  })
}

export { reviews }




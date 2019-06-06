let friends = document.querySelectorAll(".friend");
let mates = document.querySelectorAll(".mate");

const manageMates = () => {

  friends.forEach(function(friend, index) {
    friend.addEventListener("click", function(){
      clickFriend(friend);
    });
  })

  mates.forEach(function(mate, index) {
    mate.addEventListener("click", function(){
      clickMate(mate);
    });
  })

  const clickFriend = (item) => {

    let circle = document.querySelector(".empty");
    let circleImg = circle.querySelector("img");
    let itemImg = item.querySelector("img");

    let pathname = window.location.pathname;
    let teamId = pathname.split("/")[2];

    let mydata = {
      "user_id": item.id,
      "team_id": teamId
    }

    fetch("/teams/" + teamId + "/team_memberships", {
      method: "POST",
      body: JSON.stringify(mydata),
      headers: { "Content-Type": "application/json" }
    }).then((response) => {
      if (response.ok) {
        // circleImg.replaceWith(itemImg);
        // circle.setAttribute("id", item.id);
        // item.remove();
        // circle.classList.remove("empty");
        // circle.classList.add("mate");
        location.reload()
      } else {
        alert("the fuck did you do");
      }
    })

  }

  const clickMate = (mate) => {
    const currentUser = document.querySelector(".team-circle")

    console.log(currentUser);
    if ( mate.id != currentUser.id.to_i ) {
      let pathname = window.location.pathname;
      let teamId = pathname.split("/")[2];
      let mydata = {
        "user_id": mate.id,
        "team_id": teamId
      }

      fetch("/teams/" + teamId + "/destroy", {
        method: "DELETE",
        body: JSON.stringify(mydata),
        headers: { "Content-Type": "application/json" }
      }).then((response) => {
        if (response.ok) {
          location.reload();
        } else {
          alert("the fuck did you do");
        }
      })
    }
  }
}

export { manageMates };

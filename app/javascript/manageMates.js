const manageMates = () => {
  let friends = document.querySelectorAll(".friend");

  friends.forEach(function(friend, index) {
    friend.addEventListener("click", function(){
      onClick(friend);

    });
  })

  const onClick = (item) => {

    let circle = document.querySelector(".empty");
    let circleImg = circle.querySelector("img");
    let itemImg = item.querySelector("img");

    let pathname = window.location.pathname;
    let teamId = pathname.split("/")[2];

    console.log(item.id)

    let mydata = {
      "user_id": item.id,
      "team_id": teamId
    }

    Rails.ajax({
      type: "POST",
      url: "/teams/" + teamId + "/team_memberships",
      data: mydata,
      success: function(repsonse){
        circleImg.replaceWith(itemImg);
        circle.setAttribute("id", item.id);
        item.remove();
        circle.classList.remove("empty")
      },
      error: function(repsonse){
        alert("the fuck did you do")
      }
    })


  }

}

export { manageMates };

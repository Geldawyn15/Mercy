const gameSelect = () => {
  document.querySelector(".team_game").classList.add("hidden-rank");

  document.querySelector("#ow").addEventListener("click", function(){

    let label = document.querySelector("#team_label_1");
    let select = document.querySelector("#team_select_1");
    let radio = document.querySelectorAll(".game-radio");

    makeHidden();
    setRank(label, select, radio[0]);
  });

  document.querySelector("#csgo").addEventListener("click", function(){
    let label = document.querySelector("#team_label_2");
    let radio = document.querySelectorAll(".game-radio");
    let select = document.querySelector("#team_select_2");

    makeHidden();
    setRank(label, select, radio[1]);
  });

  document.querySelector("#lol").addEventListener("click", function(){
    let label = document.querySelector("#team_label_3");
    let radio = document.querySelectorAll(".game-radio");
    let select = document.querySelector("#team_select_3");

    makeHidden();
    setRank(label, select, radio[2]);

  });

  const makeHidden = () => {
    let selectLabel = document.querySelectorAll(".rank-label")
    let select = document.querySelectorAll(".rank-select")

    select.forEach(function(item, index){
      if (!item.classList.contains("hidden-rank")) {
        item.classList.add("hidden-rank");
        item.setAttribute("disabled", false);
      }
    })

    selectLabel.forEach(function(item, index) {
      if (!item.classList.contains("hidden-rank")) {
        item.classList.add("hidden-rank")
      }
    })
  }

  const setRank = (label, select, radio) => {
    label.classList.remove("hidden-rank");
    select.classList.remove("hidden-rank");
    select.removeAttribute("disabled");
    radio.checked = true;
  }
}

export { gameSelect };

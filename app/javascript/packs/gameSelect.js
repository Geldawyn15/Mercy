
function gameSelect() {
  document.querySelector("#ow").addEventListener("click", function(){
    document.querySelector("#team_game_id_1").checked = true;
  });

  document.querySelector("#csgo").addEventListener("click", function(){
    document.querySelector("#team_game_id_2").checked = true;
  });

  document.querySelector("#lol").addEventListener("click", function(){
    document.querySelector("#team_game_id_3").checked = true;
  });
}

export * from "./gameSelect"



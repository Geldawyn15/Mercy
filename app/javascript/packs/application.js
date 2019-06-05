import "bootstrap";
import { gameSelect } from "../gameSelect.js";
import { manageMates } from "../manageMates.js";
import { initRaterJs } from "../star-rating.js";
import { nokCheckbox } from "../user_rating.js";
import { initCardFlipped } from "../init_card_flipped.js";

initCardFlipped()

if(window.location.href.indexOf("/review") > -1){
  let exists = document.querySelector("#rater");
  if (exists) {
    initRaterJs();
    nokCheckbox();
  }
}

if(window.location.href.indexOf("teams/new") > -1){
  gameSelect();
}

if(window.location.href.indexOf("/mates") > -1){
  manageMates();
}

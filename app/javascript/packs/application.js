import "bootstrap";
import { gameSelect } from "../gameSelect.js";
import { manageMates } from "../manageMates.js";
import { initRaterJs } from "../star-rating.js";
import { nokCheckbox } from "../user_rating.js";
import { loading } from "../loading.js";
import { initCardFlipped } from "../init_card_flipped.js";
import { reviews } from "../reviews.js";


if(window.location.href.indexOf("/review") > -1){
  initRaterJs();
  initCardFlipped();
  nokCheckbox();
  reviews();
}

if(window.location.href.indexOf("teams/new") > -1){
  gameSelect();
}

if(window.location.href.indexOf("/mates") > -1){
  manageMates();
}

if(window.location.href.indexOf("/loading") > -1){
  loading();
}

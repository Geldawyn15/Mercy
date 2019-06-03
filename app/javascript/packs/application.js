import "bootstrap";
import { gameSelect } from "../gameSelect.js";
import { manageMates } from "../manageMates.js";
import InitRaterJs from "../star-rating.js";
import { nokCheckbox } from "../user_rating.js";


InitRaterJs()
nokCheckbox()

if(window.location.href.indexOf("teams/new") > -1){
  gameSelect();
}

manageMates();

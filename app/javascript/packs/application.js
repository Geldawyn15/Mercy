import "bootstrap";
import { gameSelect } from "../gameSelect.js";

import InitRaterJs from "../star-rating.js";

InitRaterJs()

import { manageMates } from "../manageMates.js";


if(window.location.href.indexOf("teams/new") > -1){
  gameSelect();
}


manageMates();



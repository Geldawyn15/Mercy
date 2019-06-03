import "bootstrap";
import { gameSelect } from "../gameSelect.js";
import { manageMates } from "../manageMates.js";


if(window.location.href.indexOf("teams/new") > -1){
  gameSelect();
}

if(window.location.href.indexOf("/mates") > -1){
  manageMates();
}






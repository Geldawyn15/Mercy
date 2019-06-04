import rater from "rater-js";

const initRaterJs = () => {
  const myRater = rater({
        starSize:26.30,
        max:5,
        element:document.querySelector("#rater"),
        rateCallback:function rateCallback(rating, done) {
          team_review_rating
          console.log(rating)
          this.setRating(rating);
          done();
        }
    })
}

export { initRaterJs };

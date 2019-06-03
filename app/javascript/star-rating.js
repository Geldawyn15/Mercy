import rater from "rater-js";

const InitRaterJs = () => {
  const myRater = rater({
        starSize:32,
        element:document.querySelector("#rater"),
        rateCallback:function rateCallback(rating, done) {
          team_review_rating
          console.log(rating)
          this.setRating(rating);
          done();
        }
    })
}

export default InitRaterJs

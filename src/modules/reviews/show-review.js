import  Review  from "../../db/models/Reviews.js"
import  NotFoundError  from "../../shared/errors/index.js";

async function showReview(id) {
  const review = await Review.findByPk(id);
  if (!review) {
    throw new NotFoundError("Review is not found");
  }

  return review;
}

export default showReview;

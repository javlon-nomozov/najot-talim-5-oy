import  Review  from "../../db/models/Reviews.js"
import  NotFoundError  from "../../shared/errors/index.js";

async function deleteReview(id, data) {
  const review = await Review.findByPk(id);
  if (!review) {
    throw new NotFoundError("Review is not found");
  }

  await review.destroy();
  return review;
}

export default deleteReview;

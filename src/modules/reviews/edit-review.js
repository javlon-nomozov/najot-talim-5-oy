import  Review  from "../../db/models/Reviews.js"
import  NotFoundError  from "../../shared/errors/index.js";

async function editReview(id, data) {
  const review = await Review.findByPk(id);
  if (!review) {
    throw new NotFoundError("Review is not found");
  }

  Object.keys(data).forEach((key) => {
    review[key] = data[key];
  });

  await review.save();
  return review;
}

export default editReview;

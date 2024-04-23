import Review from "../../db/models/Reviews.js";
import Company from "../../db/models/Company.js";

async function addReview(data) {
  try {
    const review = await Review.create(data);

    const company = await Company.findByPk(data.company_id);
    if (!company) {
      throw new Error("Company not found");
    }

    if (company.rate_count === 0) {
      company.avgRating = data.rating;
    } else {
      company.avgRating =
        (company.avgRating * company.rate_count + data.rating) /
        (company.rate_count + 1);
    }
    company.rate_count += 1;
    await company.save();

    return review;
  } catch (err) {
    console.log("Error creating review: ", err);
    throw new Error("Failed to create review");
  }
}

export default addReview;

import { Op } from "sequelize";
import User  from "../../db/models/User.js";
import Review   from "../../db/models/Reviews.js";

async function listReviews({ q = "", sortBy = "createdAt", order = "DESC", offset = 0, limit = 5 }) {
  const { count, rows } = await Review.findAndCountAll({
    where: {
      content: {
        [Op.iLike]: `%${q}%`,
      },
    },
    limit,
    offset,
    order: [[sortBy, order]],
    include: [User],
  });

  return {
    reviews: rows,
    meta: {
      total: count,
      offset,
      order,
    },
  };
}

export default listReviews;

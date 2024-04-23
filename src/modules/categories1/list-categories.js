import { Op } from "sequelize";
import Category from "../../db/models/Category.js";

function listCategory({
  q = "",
  sortBy = "createdAt",
  order = "desc",
  offset = 0,
  limit = 5,
} = {}) {
  return Category.findAndCountAll({
    include: [{ model: Category, as: "Parent", attributes: ["id", "name"] }],
    offset,
    limit,
    order: [[sortBy, order]],
    where: {
      name: { [Op.iLike]: `%${q}%` },
    },
  })
    .then(({ count, rows }) => {
      return {
        users: rows,
        meta: { total: count, offset, limit },
      };
    })
    .catch((err) => {
      console.log("Error getting all users:", err);
    });
}

export default listCategory;

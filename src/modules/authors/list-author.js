import { Op } from "sequelize";
import Author from "../../db/models/Author.js";

function listAuthor({
  q = "",
  sortBy = "createdAt",
  order = "desc",
  offset = 0,
  limit = 5,
} = {}) {
  return Author.findAndCountAll({
    offset,
    limit,
    order: [[sortBy, order]],
    where: {
      name: { [Op.iLike]: `%${q}%` },
    },
  })
    .then(({ count, rows }) => {
      return {
        authors: rows,
        meta: { total: count, offset, limit },
      };
    })
    .catch((err) => {
      console.log("Error getting  all authors:", err);
    });
}
export default listAuthor;

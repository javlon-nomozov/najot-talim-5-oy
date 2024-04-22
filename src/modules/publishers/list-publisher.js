import { Op } from "sequelize";
import Publisher from "../../db/models/Publisher.js";

function listPublisher({
  q = "",
  sortBy = "createdAt",
  order = "desc",
  offset = 0,
  limit = 5,
} = {}) {
  return Publisher.findAndCountAll({
    offset,
    limit,
    order: [[sortBy, order]],
    where: {
      name: { [Op.iLike]: `%${q}%` },
    },
  })
    .then(({ count, rows }) => {
      return {
        publishers: rows,
        meta: { total: count, offset, limit },
      };
    })
    .catch((err) => {
      console.log("Error getting  all publishers:", err);
    });
}
export default listPublisher;

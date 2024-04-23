import { Op } from "sequelize";
import User from "../../db/models/User.js";

function listUser({
  q = "",
  sortBy = "createdAt",
  order = "desc",
  offset = 0,
  limit = 5,
} = {}) {
  return User.findAndCountAll({
    offset,
    limit,
    order: [[sortBy, order]],
    where: {
      [Op.or]: [
        { first_name: { [Op.iLike]: `%${q}%` } },
        { last_name: { [Op.iLike]: `%${q}%` } },
      ],
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

export default listUser;

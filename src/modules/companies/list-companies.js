import { Op } from "sequelize";
import Company from "../../db/models/Company.js";
import Category from "../../db/models/Category.js";

async function listCompany({ q = "", sortBy = "createdAt", order = "DESC", offset = 0, limit = 5 } = {}) {
  const { count, rows } = await Company.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: `%${q}%`,
      },
    },
    order: [[sortBy, order]],
    include: [Category],
    offset,
    limit,
  });

  return {
    companies: rows,
    meta: {
      total: count,
      offset,
      limit,
    },
  };
}

export default listCompany;

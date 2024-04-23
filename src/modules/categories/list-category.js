import { Op } from 'sequelize';
// import Category from '../../db/models/Category.js';
import Category from '../../db/models/Category.js';

async function listCategory({ q = '', sortBy = 'createdAt', order = 'DESC', offset = 0, limit = 5 } = {}) {
  const { count, rows } = await Category.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: `%${q}%`,
      },
    },
    order: [[sortBy, order]],
    offset,
    limit,
  });

  return {
    categories: rows,
    meta: {
      total: count,
      offset,
      limit,
    },
  };
}

export default listCategory;

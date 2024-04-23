import Category from '../../db/models/Category.js';
import  NotFoundError  from '../../shared/errors/index.js';

async function editCategory(id, data) {
  const category = await Category.findByPk(id);
  if (!category) {
    throw new NotFoundError('Category is not found');
  }

  await Category.update(data, { where: { id } });
  return Category.findByPk(id);
}

export default editCategory;

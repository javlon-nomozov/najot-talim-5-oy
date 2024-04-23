import Category from '../../db/models/Category.js';
import  NotFoundError  from '../../shared/errors/index.js';

async function deleteCategory(id) {
  const category = await Category.findByPk(id);
  if (!category) {
    throw new NotFoundError('Category is not found');
  }

  await category.destroy();
  return category;
}

export default deleteCategory;

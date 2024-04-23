import Category from "../../db/models/Category.js";
import NotFoundError from "../../shared/errors/index.js";

async function showCategory(id) {
  const category = await Category.findByPk(id);
  if (!category) {
    throw new NotFoundError("Category is not found");
  }

  return category;
}

export default showCategory;

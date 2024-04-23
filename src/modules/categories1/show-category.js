import Category from "../../db/models/Category.js";
import NotFoundError from "../../shared/errors/index.js";

export default function showCategory(id) {
  return Category.findByPk(id).then((category) => {
    if (!category) {
      throw new NotFoundError("Category is not found");
    }
    return category;
  });
}

// export default showCategory;

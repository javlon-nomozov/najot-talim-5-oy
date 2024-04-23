import Category from "../../db/models/Category.js";
import NotFoundError from "../../shared/errors/index.js";

function addCategory(data) {
  return Category.findByPk(data.parent_id).then((parentCategory) => {
    if (data.parent_id && !parentCategory) {
      throw new NotFoundError("Parent category not found");
    }
    return Category.create(data)
      .then((category) => {
        console.log({ category });
        return category;
      })
      .catch((err) => {
        throw err;
      });
  });
}

export default addCategory;

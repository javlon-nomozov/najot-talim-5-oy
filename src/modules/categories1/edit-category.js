import Category from "../../db/models/Category.js";
import NotFoundError from "../../shared/errors/index.js";
export default function (id, newCategory) {
  return Category.findByPk(id).then((category) => {
    if (!category) {
      throw new NotFoundError("Category is not Found");
    }
    console.log(newCategory);
    for (let i = 0; i < Object.keys(newCategory).length; i++) {
      const el = Object.keys(newCategory)[i];
      category[el] = newCategory[el];
    }
    category.save();
    return category;
  });
}

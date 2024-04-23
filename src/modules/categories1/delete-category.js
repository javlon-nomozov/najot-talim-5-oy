import Category from "../../db/models/Category.js";
import NotFoundError from "../../shared/errors/index.js";
export default function (id) {
  return Category.findByPk(id).then((user) => {
    if (!user) {
      throw new NotFoundError("Category is not Found");
    }
    user.destroy();
    return user;
  });
}

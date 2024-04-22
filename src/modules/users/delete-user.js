import User from "../../db/models/User.js";
import NotFoundError from "../../shared/errors/index.js";
export default function (id) {
  return User.findByPk(id).then((user) => {
    if (!user) {
      throw new NotFoundError("User is not Found");
    }
    user.destroy();
    return user;
  });
}

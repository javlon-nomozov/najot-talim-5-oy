import User from "../../db/models/User.js";
import NotFoundError from "../../shared/errors/index.js";

export default function showUser(id) {
  return User.findByPk(id).then((user) => {
    if (!user) {
      throw new NotFoundError("User is not found");
    }
    return user;
  });
}

// export default showUser;

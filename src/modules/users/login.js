import User from "../../db/models/User.js";
import NotFoundError from "../../shared/errors/index.js";
import { comparePasswords } from "../../shared/utils/bcrypt-utilities.js";
import { jwtGenerator } from "../../shared/utils/json-web-token.js";

function loginUser(data) {
  return User.findAll({
    where: {
      email: data.email,
    },
  }).then((users) => {
    console.log(users);
    if (users && users.length) {
      const user = users[0];
      if (comparePasswords(data.password, user.password)) {
        return jwtGenerator(user.id, user.role);
      }
    }
    throw new NotFoundError("User not found");
  });
}

export default loginUser;

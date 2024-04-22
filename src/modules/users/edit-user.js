import User from "../../db/models/User.js";
import NotFoundError from "../../shared/errors/index.js";
export default function (id, newUser) {
  return User.findByPk(id).then((user) => {
    if (!user) {
      throw new NotFoundError("User is not Found");
    }
    console.log(newUser);
    for (let i = 0; i < Object.keys(newUser).length; i++) {
      const el = Object.keys(newUser)[i];
      user[el] = newUser[el];
    }
    user.save();
    return user;
  });
}

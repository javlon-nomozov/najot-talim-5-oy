import User from "../../db/models/User.js";
import { hashPassword } from "../../shared/utils/bcrypt-utilities.js";

function addUser(data) {
  return hashPassword(data.password).then((password) => {
    data.password = password;
    return User.create(data)
    
      .then((user) => {
        return user;
      })
      .catch((err) => {
        throw err;
      });
  });
}

export default addUser;

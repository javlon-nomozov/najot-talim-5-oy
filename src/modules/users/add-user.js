import User from "../../db/models/User.js";

function addUser(data) {
  return User.create(data)
    .then((user) => {
      return user;
    })
    .catch((err) => {
      console.log("Error creating user:", err);
    });
}
export default addUser;

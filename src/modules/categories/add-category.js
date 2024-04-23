// import Category from "../../db/models/category";
import Category from "../../db/models/Category.js";

function addCategory(data) {
  return Category.create(data)
    .then((category) => {
      return category;
    })
    .catch((err) => {
      console.log("Error creating category: ", err);
    });
}

export default addCategory;

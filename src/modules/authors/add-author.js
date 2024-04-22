import Author from "../../db/models/Author.js";

function addAuthor(data) {
  return Author.create({ name: data.name })
    .then((author) => {
      return author;
    })
    .catch((err) => {
      console.log("Error creating author:", err);
    });
}
export default addAuthor;

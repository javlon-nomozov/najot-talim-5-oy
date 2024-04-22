import Author from "../../db/models/Author.js";
import NotFoundError from "../../shared/errors/index.js";
export default function (id, newAuthor) {
  return Author.findByPk(id).then((author) => {
    if (!author) {
      throw new NotFoundError("Author is not Found");
    }
    console.log(newAuthor);
    for (let i = 0; i < Object.keys(newAuthor).length; i++) {
      const el = Object.keys(newAuthor)[i];
      author[el] = newAuthor[el];
    }
    author.save();
    return author;
  });
}

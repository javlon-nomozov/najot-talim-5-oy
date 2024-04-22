import Author from "../../db/models/Author.js";
import NotFoundError from "../../shared/errors/index.js";
export default function (id) {
  return Author.findByPk(id).then((author) => {
    if (!author) {
      throw new NotFoundError("Author is not Found");
    }
    author.destroy();
    return author;
  });
}

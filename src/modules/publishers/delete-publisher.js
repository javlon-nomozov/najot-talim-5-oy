import Publisher from "../../db/models/Publisher.js";
import NotFoundError from "../../shared/errors/index.js";
export default function (id) {
  return Publisher.findByPk(id).then((publisher) => {
    if (!publisher) {
      throw new NotFoundError("Publisher is not Found");
    }
    publisher.destroy();
    return publisher;
  });
}

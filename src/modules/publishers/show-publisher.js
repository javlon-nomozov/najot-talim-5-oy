import Publisher from "../../db/models/Publisher.js";
import NotFoundError from "../../shared/errors/index.js";

export default function showPublisher(id) {
  console.log({ id });
  return Publisher.findByPk(id).then((publisher) => {
    if (!publisher) {
      throw new NotFoundError("Publisher is not found");
    }
    return publisher;
  });
}

// export default showPublisher;

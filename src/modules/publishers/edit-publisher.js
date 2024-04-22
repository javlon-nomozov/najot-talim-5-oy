import Publisher from "../../db/models/Publisher.js";
import NotFoundError from "../../shared/errors/index.js";
export default function (id, newPublisher) {
  return Publisher.findByPk(id).then((publisher) => {
    if (!publisher) {
      throw new NotFoundError("Publisher is not Found");
    }
    console.log(newPublisher);
    for (let i = 0; i < Object.keys(newPublisher).length; i++) {
      const el = Object.keys(newPublisher)[i];
      publisher[el] = newPublisher[el];
    }
    publisher.save();
    return publisher;
  });
}

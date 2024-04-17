import Publisher from "../../db/models/Publisher.js";

function addPublisher(data) {
 return Publisher.create(data)
    .then((publisher) => {
      return publisher;
    })
    .catch((err) => {
      console.log("Error creating publisher:", err);
    });
}
export default addPublisher
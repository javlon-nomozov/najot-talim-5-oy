import Company from "../../db/models/Company.js";

function addCompany(data) {
  return Company.create(data)
    .then((company) => {
      return company;
    })
    .catch((err) => {
      console.log("Error creating company: ", err);
    });
}

export default addCompany;

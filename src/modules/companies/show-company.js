import Company from "../../db/models/Company.js";
import  NotFoundError  from "../../shared/errors/index.js";

async function showCompany(id) {
  const company = await Company.findByPk(id);
  if (!company) {
    throw new NotFoundError("Company is not found");
  }

  return company;
}

export default showCompany;

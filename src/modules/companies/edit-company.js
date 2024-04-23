import Company from "../../db/models/Company.js";
import  NotFoundError  from "../../shared/errors/index.js";

async function editCompany(id, data) {
  const company = await Company.findByPk(id);
  if (!company) {
    throw new NotFoundError("Company is not found");
  }

  const updatedCompany = await company.update(data);
  return updatedCompany;
}

export default editCompany;

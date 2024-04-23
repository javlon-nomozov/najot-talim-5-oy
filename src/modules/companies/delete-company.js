import Company from "../../db/models/Company.js";
import  NotFoundError  from "../../shared/errors/index.js";

async function removeCompany(id) {
  const company = await Company.findByPk(id);
  if (!company) {
    throw new NotFoundError("Company is not found");
  }

  await company.destroy();
  return company;
}

export default removeCompany;

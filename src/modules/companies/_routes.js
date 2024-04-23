import express from "express";
import { postCompany, getCompany, getCpmpanies, patchCompany, deleteCompany } from "./_controller.js";
import validate from "../../shared/middlewares/validate.js";
import { postCompanySchema, getCompanysSchema, patchCompanySchema } from "./_schemas.js";

const router = express.Router();

router.post("/companies", validate(postCompanySchema), postCompany);
router.get("/companies", validate(getCompanysSchema), getCpmpanies);
router.get("/companies/:id", getCompany);
router.patch("/companies/:id", validate(patchCompanySchema), patchCompany);
router.delete("/companies/:id", deleteCompany);

export default router;

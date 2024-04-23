import { Router } from "express";
import { getCategoriesList, getCategory, postCategory } from "./_controllers.js";
import validate from "../../shared/middlewares/validate.js";
import { createCategorySchema, readCategorySchema } from "./_schemas.js";
import isLoggedIn from "../../shared/middlewares/is-logged-in.js";
import hasRole from "../../shared/middlewares/has-role.js";

const router = Router();

router.post("/", validate(createCategorySchema), postCategory);
router.get("/", getCategoriesList);
router.get("/:id", validate(readCategorySchema), getCategory);

export default router;

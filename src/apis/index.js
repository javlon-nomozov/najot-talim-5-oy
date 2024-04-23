import userRouter from "../modules/users/_routers.js";
import companiesRouter from "../modules/companies/_routes.js";
import categoriesRouter from "../modules/categories/_routes.js";
import reviewRouter from "../modules/reviews/_routes.js";

import { Router } from "express";

const router = Router();

// router.use(examplesRouter);
router.use("/", userRouter);
router.use("/categories", categoriesRouter);
router.use("/", companiesRouter);
router.use("/", reviewRouter);
export default router;

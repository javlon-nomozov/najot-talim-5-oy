import publishersRouter from "../modules/publishers/_routers.js";
import userRouter from "../modules/users/_routers.js";

import { Router } from "express";

const router = Router();

// router.use(examplesRouter);
router.use("/publishers", publishersRouter);
router.use("/", userRouter);
export default router;

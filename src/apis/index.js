import examplesRouter from "../modules/example/_routers.js";
import authorsRouter from "../modules/publishers/_routers.js";

import { Router } from "express";

const router = Router();

router.use(examplesRouter);
router.use("/publishers", authorsRouter);
export default router;

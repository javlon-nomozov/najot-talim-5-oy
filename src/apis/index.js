import examplesRouter from "../modules/example/_routers.js";
import publishersRouter from "../modules/publishers/_routers.js";
import authorsRouter from "../modules/authors/_routers.js";

import { Router } from "express";

const router = Router();

router.use(examplesRouter);
router.use("/publishers", publishersRouter);
router.use("/authors", authorsRouter);
export default router;

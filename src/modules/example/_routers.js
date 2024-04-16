import { Router } from "express";
import { getHello } from "./_controllers.js";

const router = Router();

router.get('/',getHello)

export default router
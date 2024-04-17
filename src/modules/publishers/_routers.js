import { Router } from "express";
import { postPublisher as postPublisher } from "./_controllers.js";

const router = Router();

router.post("/", postPublisher);
router.get("/");
router.get("/:id");
router.patch("/:id");
router.delete("/:id");

export default router;

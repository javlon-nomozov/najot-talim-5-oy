import { Router } from "express";
import { getPublishers, postPublisher } from "./_controllers.js";

const router = Router();

router.post("/", postPublisher);
router.get("/", getPublishers);
router.get("/:id");
router.patch("/:id");
router.delete("/:id");

export default router;

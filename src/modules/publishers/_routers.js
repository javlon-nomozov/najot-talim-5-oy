import { Router } from "express";
import {
  postPublisher,
  getPublishers,
  getPublisher,
  patchEditPublisher,
  deletePublisherController,
} from "./_controllers.js";
import validate from "../../shared/middlewares/validate.js";
import {
  deletePublisherSchema,
  editPublisherSchema,
  getPublisherSchema,
  getPublishersSchema,
} from "./_schemas.js";

const router = Router();

router.post("/", postPublisher);
router.get("/", validate(getPublishersSchema), getPublishers);
router.get("/:id", validate(getPublisherSchema), getPublisher);
router.patch("/:id", validate(editPublisherSchema), patchEditPublisher);
router.delete("/:id", validate(deletePublisherSchema), deletePublisherController);

export default router;

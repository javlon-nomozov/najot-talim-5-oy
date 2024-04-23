import express from "express";
import validate from "../../shared/middlewares/validate.js";
import { postReviewSchema, getReviewSchema, patchReviewSchema } from "./_schemas.js";
import { postReview, getReviews, getReview, patchReview, deleteReview } from "./_controller.js";

const router = express.Router();

router.post("/reviews", validate(postReviewSchema), postReview);
router.get("/reviews", validate(getReviewSchema), getReviews);
router.get("/reviews/:id", getReview);
router.patch("/reviews/:id", validate(patchReviewSchema), patchReview);
router.delete("/reviews/:id", deleteReview);

export default router;

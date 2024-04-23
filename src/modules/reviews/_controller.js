import express from "express";
import addReview from "./add-review.js";
import listReviews from "./list-reviews.js";
import showReview from "./show-review.js";
import editReview from "./edit-review.js";
import removeReview from "./delete-review.js";

/**
 * @param {express.Request} req
 * @param {express.Response} res
 */
export async function postReview(req, res) {
  try {
    const review = await addReview(req.body);
    res.status(201).json({ review });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 */
export async function getReviews(req, res) {
  try {
    const reviews = await listReviews(req.query);
    res.json(reviews);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
export async function getReview(req, res, next) {
  try {
    const review = await showReview(req.params.id);
    if (!review) {
      res.status(404).json({ error: "review not found" });
    } else {
      res.json(review);
    }
  } catch (err) {
    next(err);
  }
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
export async function patchReview(req, res, next) {
  try {
    const review = await editReview(req.params.id, req.body);
    if (!review) {
      res.status(404).json({ error: "review not found" });
    } else {
      res.json(review);
    }
  } catch (err) {
    next(err);
  }
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
export async function deleteReview(req, res, next) {
  try {
    const review = await removeReview(req.params.id);
    if (!review) {
      res.status(404).json({ error: "User not found" });
    } else {
      res.json(review);
    }
  } catch (err) {
    next(err);
  }
}

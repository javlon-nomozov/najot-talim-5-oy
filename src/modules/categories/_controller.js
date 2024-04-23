import express from "express";
import addCategory from "./add-category.js";
import listCategories from "./list-category.js";
import showCategory from "./show-category.js";
import editCategory from "./edit-category.js";
import removeCategory from "./delete-category.js";


/**
 * @param {express.Request} req
 * @param {express.Response} res
 */

function postCategory(req, res) {
  return addCategory(req.body)
    .then((category) => {
      res.status(201).json({ category });
    })
    .catch((err) => {
      res.status(400).json({ error: err.message });
    });
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 */

function getCategories(req, res) {
  return listCategories(req.query)
    .then((categories) => {
      res.json(categories);
    })
    .catch((err) => {
      res.status(400).json({ error: err.message });
    });
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getCategory(req, res, next) {
  return showCategory(req.params.id)
    .then((category) => {
      if (!category) {
        res.status(404).json({ error: 'category not found' });
      } else {
        res.json(category);
      }
    })
    .catch((err) => {
      next(err);
    });
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */

function patchCategory(req, res, next) {
  return editCategory(req.params.id, req.body)
    .then((category) => {
      if (!category) {
        res.status(404).json({ error: 'category not found' });
      } else {
        res.json(category);
      }
    })
    .catch((err) => {
      next(err);
    });
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */

function deleteCategory(req, res, next) {
  return removeCategory(req.params.id)
    .then((category) => {
      if (!category) {
        res.status(404).json({ error: 'User not found' });
      } else {
        res.json(category);
      }
    })
    .catch((err) => {
      next(err);
    });
}

export {
  postCategory,
  getCategory,
  getCategories,
  patchCategory,
  deleteCategory,
};
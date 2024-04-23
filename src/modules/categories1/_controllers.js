import express from "express";
import addCategory from "./add-category.js";
import listCategories from "./list-categories.js";
import showCategory from "./show-category.js";
// import editCategory from "./edit-category.js";
// import loginCategory from "./login.js";
// import deleteCategory from "./delete-category.js";

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const postCategory = (req, res, next) => {
  addCategory(req.body)
    .then((data) => {
      console.log({ data });
      res.json({ data });
    })
    .catch((err) => {
      next(err);
      // res.status(400).json({ error: err.errors });
      res.status(400).json({ error: err.message });
    });
};
/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getCategoriesList(req, res, next) {
  listCategories(req.query)
    .then((categories) => {
      res.json(categories);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getCategory(req, res, next) {
  showCategory(req.params.id)
    .then((category) => {
      res.json(category);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function patchEditCategory(req, res, next) {
  editCategory(req.params.id, req.body)
    .then((category) => {
      res.json(category);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function deleteCategoryController(req, res, next) {
  deleteCategory(req.params.id)
    .then((category) => {
      res.json(category);
    })
    .catch((err) => console.log({ err: err.message }));
}

export { postCategory, getCategoriesList, getCategory };

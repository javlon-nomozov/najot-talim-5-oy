import express from "express";
import addAuthor from "./add-author.js";
import listAuthors from "./list-author.js";
import showAuthor from "./show-author.js";
import editAuthor from "./edit-author.js";
import deleteAuthor from "./delete-author.js";

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const postAuthor = (req, res, next) => {
  addAuthor(req.body).then((data) => {
    res.json({ data });
  });
};

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getAuthors(req, res, next) {
  listAuthors(req.query)
    .then((authors) => {
      res.json(authors);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getAuthor(req, res, next) {
  showAuthor(req.params.id)
    .then((author) => {
      console.log({ author });
      res.json(author);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function patchEditAuthor(req, res, next) {
  editAuthor(req.params.id, req.body)
    .then((author) => {
      console.log({ author });
      res.json(author);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function deleteAuthorController(req, res, next) {
  deleteAuthor(req.params.id)
    .then((author) => {
      console.log({ author });
      res.json(author);
    })
    .catch(next);
}

export {
  postAuthor,
  getAuthors,
  getAuthor,
  patchEditAuthor,
  deleteAuthorController,
};

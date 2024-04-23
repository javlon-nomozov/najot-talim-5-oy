import express from "express";
import addPublisher from "./add-publisher.js";
import listPublishers from "./list-publisher.js";
import showPublisher from "./show-publisher.js";
import editPublisher from "./edit-publisher.js";
import deletePublisher from "./delete-publisher.js";

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const postPublisher = (req, res, next) => {
  addPublisher(req.body).then((data) => {
    res.json({ data });
  });
};

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getPublishers(req, res, next) {
  listPublishers(req.query)
    .then((publishers) => {
      res.json(publishers);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getPublisher(req, res, next) {
  showPublisher(req.params.id)
    .then((publisher) => {
      res.json(publisher);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function patchEditPublisher(req, res, next) {
  editPublisher(req.params.id, req.body)
    .then((publisher) => {
      res.json(publisher);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function deletePublisherController(req, res, next) {
  deletePublisher(req.params.id)
    .then((publisher) => {
      res.json(publisher);
    })
    .catch(next);
}

export {
  postPublisher,
  getPublishers,
  getPublisher,
  patchEditPublisher,
  deletePublisherController,
};

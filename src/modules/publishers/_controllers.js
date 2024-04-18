import express from "express";
import addPublisher from "./add-publisher.js";
import Publisher from "../../db/models/Publisher.js";
/**
 *
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function postPublisher(req, res, next) {
  addPublisher(req.body).then((data) => {
    res.json({ data });
  });
}

function getPublishers(req, res, next) {
  Publisher.findAll().then((data) => {
    console.log(data);
    res.json(data);
  }).catch(err=>console.log(err));
}

export { postPublisher, getPublishers };

import express from "express";
import addPublisher from "./add-publisher.js";
/**
 *
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const postPublisher = (req, res, next) => {
    console.log(req.body);
  addPublisher(req.body).then((data) => {
    res.json({ data });
  });
};

function getPublishers(req, res, next) {
  return Publisher.findAll().then((data) => {
    console.log(data);
    res.json(data);
  }).catch(err=>console.log(err));
}

export { postPublisher, getPublishers };

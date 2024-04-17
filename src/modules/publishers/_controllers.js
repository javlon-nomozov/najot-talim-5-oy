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

export { postPublisher };

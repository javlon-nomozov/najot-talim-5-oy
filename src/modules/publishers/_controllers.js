import express from "express";
import addPublisher from "./add-publisher";
/**
 *
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const postPublisher = (req, res, next) => {
    const data = addPublisher(req.body)
    res.json({data})
};

export default {postPublisher}
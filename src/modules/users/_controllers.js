import express from "express";
import addUser from "./add-user.js";
import listUsers from "./list-users.js";
import showUser from "./show-user.js";
import editUser from "./edit-user.js";
import deleteUser from "./delete-user.js";

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const postUser = (req, res, next) => {
  addUser(req.body).then((data) => {
    res.json({ data });
  });
};

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getUsers(req, res, next) {
  listUsers(req.query)
    .then((users) => {
      res.json(users);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function getUser(req, res, next) {
  showUser(req.params.id)
    .then((user) => {
      console.log({ user });
      res.json(user);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function patchEditUser(req, res, next) {
  editUser(req.params.id, req.body)
    .then((user) => {
      console.log({ user });
      res.json(user);
    })
    .catch(next);
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
function deleteUserController(req, res, next) {
  deleteUser(req.params.id)
    .then((user) => {
      console.log({ user });
      res.json(user);
    })
    .catch(next);
}

export {
  postUser,
  getUsers,
  getUser,
  patchEditUser,
  deleteUserController,
};

import express from "express";
import addUser from "./add-user.js";
import listUsers from "./list-users.js";
import showUser from "./show-user.js";
import editUser from "./edit-user.js";
import loginUser from "./login.js";
import deleteUser from "./delete-user.js";

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const postUser = (req, res, next) => {
  addUser(req.body)
    .then((data) => {
      res.json({ data });
    })
    .catch((err) => {
      // next(err);
      // res.status(400).json({ error: err.errors });
      res.status(400).json({ error: err.message  });
    });
};

const registerUser = (req, res, next) => {
  req.body.role = "user";
  addUser(req.body)
    .then((data) => {
      res.json({ data });
    })
    .catch(next);
};

const loginUserController = (req, res, next) => {
  loginUser(req.body)
    .then((token) => {
      res.json({ token });
    })
    .catch((err) => {
      res.status(400).json({ error: "incorrect email or password" });
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
      res.json(user);
    })
    .catch((err) => console.log({ err: err.message }));
}

export {
  postUser,
  registerUser,
  getUsers,
  getUser,
  patchEditUser,
  deleteUserController,
  loginUserController,
};

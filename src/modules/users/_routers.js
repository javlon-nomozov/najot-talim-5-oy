import { Router } from "express";
import {
  postUser,
  getUsers,
  getUser,
  patchEditUser,
  deleteUserController,
  registerUser,
  loginUserController,
} from "./_controllers.js";
import validate from "../../shared/middlewares/validate.js";
import {
  createUserSchema,
  deleteUserSchema,
  editUserSchema,
  getUserSchema,
  getUsersSchema,
  loginUserSchema,
} from "./_schemas.js";
import isLoggedIn from "../../shared/middlewares/is-logged-in.js";
import hasRole from "../../shared/middlewares/has-role.js";

const router = Router();

router.post("/auth/signup", validate(createUserSchema), registerUser);
router.post("/auth/signin", validate(loginUserSchema), loginUserController);
router.post(
  "/users",
  isLoggedIn,
  hasRole("admin"),
  validate(createUserSchema),
  postUser
);
router.get("/users", validate(getUsersSchema), getUsers);
router.get("/users/:id", validate(getUserSchema), getUser);
router.patch(
  "/users/:id",
  isLoggedIn,
  hasRole("admin"),
  validate(editUserSchema),
  patchEditUser
);
router.delete(
  "/users/:id",
  isLoggedIn,
  hasRole("admin"),
  validate(deleteUserSchema),
  deleteUserController
);

export default router;

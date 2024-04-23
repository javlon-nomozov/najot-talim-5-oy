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

const router = Router();

router.post("/auth/signup", validate(createUserSchema), registerUser);
router.post("/auth/signin", validate(loginUserSchema), loginUserController);
router.post("/users", validate(createUserSchema), postUser);
router.get("/users", validate(getUsersSchema), getUsers);
router.get("/users/:id", validate(getUserSchema), getUser);
router.patch("/users/:id", validate(editUserSchema), patchEditUser);
router.delete("/users/:id", validate(deleteUserSchema), deleteUserController);

export default router;

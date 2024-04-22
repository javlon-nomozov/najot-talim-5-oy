import { Router } from "express";
import {
  postUser,
  getUsers,
  getUser,
  patchEditUser,
  deleteUserController,
} from "./_controllers.js";
import validate from "../../shared/middlewares/validate.js";
import {
  deleteUserSchema,
  editUserSchema,
  getUserSchema,
  getUsersSchema,
} from "./_schemas.js";

const router = Router();

router.post("/", postUser);
router.get("/", validate(getUsersSchema), getUsers);
router.get("/:id", validate(getUserSchema), getUser);
router.patch("/:id", validate(editUserSchema), patchEditUser);
router.delete("/:id", validate(deleteUserSchema), deleteUserController);

export default router;

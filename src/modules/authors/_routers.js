import { Router } from "express";
import {
  postAuthor,
  getAuthors,
  getAuthor,
  patchEditAuthor,
  deleteAuthorController,
} from "./_controllers.js";
import validate from "../../shared/middlewares/validate.js";
import {
  deleteAuthorSchema,
  editAuthorSchema,
  getAuthorSchema,
  getAuthorsSchema,
} from "./_schemas.js";

const router = Router();

router.post("/", postAuthor);
router.get("/", validate(getAuthorsSchema), getAuthors);
router.get("/:id", validate(getAuthorSchema), getAuthor);
router.patch("/:id", validate(editAuthorSchema), patchEditAuthor);
router.delete("/:id", validate(deleteAuthorSchema), deleteAuthorController);

export default router;

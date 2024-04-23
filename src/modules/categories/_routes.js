import express from 'express';
import {
  postCategory,
  getCategory,
  getCategories,
  patchCategory,
  deleteCategory,
} from './_controller.js';
import validate from '../../shared/middlewares/validate.js';
import {
  postCategorySchema,
  getCategorysSchema,
  patchCategorySchema,
} from './_schemas.js';

const router = express.Router();

router.post('/category', validate(postCategorySchema), postCategory);
router.get('/category', validate(getCategorysSchema), getCategories);
router.get('/category/:id', getCategory);
router.patch('/category/:id', validate(patchCategorySchema), patchCategory);
router.delete('/category/:id', deleteCategory);

export default router;

import Joi from "joi";

const createCategorySchema = {
  body: Joi.object({
    name: Joi.string().min(2).required(),
    parent_id: Joi.number().integer().allow(null),
  }),
};

const readCategorySchema = {
  params: Joi.object({
    id: Joi.number().integer().required(),
  }),
};

const updateCategorySchema = {
  body: Joi.object({
    name: Joi.string().min(2),
    parent_id: Joi.number().integer().allow(null),
  }),
  params: Joi.object({
    id: Joi.number().integer().required(),
  }),
};

const deleteCategorySchema = {
  params: Joi.object({
    id: Joi.number().integer().required(),
  }),
};

export {
  createCategorySchema,
  readCategorySchema,
  updateCategorySchema,
  deleteCategorySchema,
};

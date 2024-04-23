import Joi from 'joi';

export const postCategorySchema = {
  body: Joi.object({
    name: Joi.string().trim().not().empty().required(),
    parent_id: Joi.number().integer(),
  }),
};

export const getCategorysSchema = Joi.object({
  query: Joi.object({
    // sorting
    q: Joi.string().min(1),
    sortBy: Joi.string().valid('name', 'createdAt', 'updatedAt'), // corrected typo
    order: Joi.string().valid('ASC', 'DESC'), // corrected typo
    offset: Joi.number().integer().min(0),
    limit: Joi.number().integer().min(1),
  }),
});

export const patchCategorySchema = {
  body: Joi.object({
    name: Joi.string().trim().not().empty(),
  }),
};

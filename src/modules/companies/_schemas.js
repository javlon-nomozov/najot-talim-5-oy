import Joi from "joi";

export const postCompanySchema = {
  body: Joi.object({
    name: Joi.string().trim().not().empty().required(),
    avgRating: Joi.number().not().empty(),
    rate_count: Joi.number().not().empty(),
    category_id: Joi.number().not().empty().required(),
  }),
};

export const getCompanysSchema = Joi.object({
  query: Joi.object({
    q: Joi.string().min(1),
    sortBy: Joi.string().valid("name", "createdAt", "updatedAt"),
    order: Joi.string().valid("ASC", "DESC"), 
    offset: Joi.number().integer().min(0),
    limit: Joi.number().integer().min(1),
  }),
});

export const patchCompanySchema = {
  body: Joi.object({
    name: Joi.string().trim().not().empty(),
    avgRating: Joi.number().not().empty(),
    rate_count: Joi.number().not().empty(),
    category_id: Joi.number().not().empty(),
  }),
};

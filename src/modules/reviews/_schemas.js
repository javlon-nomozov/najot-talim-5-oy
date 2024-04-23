import Joi from "joi";

export const postReviewSchema = {
  body: Joi.object({
    content: Joi.string().trim().not().empty().required(),
    UserId: Joi.number().not().empty().required(),
    company_id: Joi.number().not().empty().required(),
    rating: Joi.number().not().empty().required(),
  }),
};

export const getReviewSchema = Joi.object({
  query: Joi.object({
    // sorting
    q: Joi.string().min(1),
    sortBy: Joi.string().valid("UserId", "company_id", "createdAt", "updatedAt"),
    order: Joi.string().valid("ASC", "DESC"),
    // for pagination
    offset: Joi.number().integer().min(0),
    limit: Joi.number().integer().min(1),
  }),
});

export const patchReviewSchema = {
  body: Joi.object({
    content: Joi.string().trim().not().empty(),
    UserId: Joi.number().not().empty(),
    company_id: Joi.number().not().empty(),
    rating: Joi.number().not().empty(),
  }),
};

import Joi from "joi";

const getAuthorsSchema = {
  // body: {},
  query: Joi.object({
    // for sorting
    q: Joi.string().min(1),
    sortBy: Joi.string().valid("name", "createAt", "updateAt"),
    order: Joi.string().valid("ASC", "DESC", "asc", "desc"),
    // for pagination
    offset: Joi.number().integer().min(0),
    limit: Joi.number().integer().min(1),
  }),
  // params: {},
};

const getAuthorSchema = {
  params: Joi.object({
    id: Joi.number().integer(),
  }),
};

const editAuthorSchema = {
  body: Joi.object({
    name: Joi.string().min(1).trim(),
  }),
  params: Joi.object({
    id: Joi.number().integer(),
  }),
};

const deleteAuthorSchema = {
  // body: {},
  // query: {},
  params: Joi.object({
    id: Joi.number().integer(),
  }),
};

export {
  getAuthorsSchema,
  getAuthorSchema,
  editAuthorSchema,
  deleteAuthorSchema,
};

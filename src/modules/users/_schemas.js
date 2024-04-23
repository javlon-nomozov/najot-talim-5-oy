import Joi from "joi";

const createUserSchema = {
  body: Joi.object({
    first_name: Joi.string().min(2).required(),
    last_name: Joi.string().min(2).required(),
    email: Joi.string()
      .min(5)
      .regex(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/)
      .required(),
    password: Joi.string().min(6).required(),
    role: Joi.string().min(4).valid("user", "admin").default("user"),
  }),
  // query: {},
  // params: {},
};

const loginUserSchema = {
  // body: {},
  body: Joi.object({
    email: Joi.string().min(3).required(),
    password: Joi.string().min(6).required(),
  }),
  // params: {},
};

const getUsersSchema = {
  // body: {},
  query: Joi.object({
    // for sorting
    q: Joi.string().min(1),
    sortBy: Joi.string().valid(
      "first_name",
      "last_name",
      "createAt",
      "updateAt"
    ),
    order: Joi.string().valid("ASC", "DESC", "asc", "desc"),
    // for pagination
    offset: Joi.number().integer().min(0),
    limit: Joi.number().integer().min(1),
  }),
  // params: {},
};

const getUserSchema = {
  params: Joi.object({
    id: Joi.number().integer(),
  }),
};

const editUserSchema = {
  body: Joi.object({
    first_name: Joi.string().min(2),
    last_name: Joi.string().min(2),
    email: Joi.string()
      .min(2)
      .regex(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/),
    // role: Joi.string().min(5).valid("librarian", "admin"),
  }),
  params: Joi.object({
    id: Joi.number().integer(),
  }),
};

const deleteUserSchema = {
  // body: {},
  // query: {},
  params: Joi.object({
    id: Joi.number().integer(),
  }),
};

export {
  createUserSchema,
  getUsersSchema,
  getUserSchema,
  editUserSchema,
  deleteUserSchema,
  loginUserSchema
};

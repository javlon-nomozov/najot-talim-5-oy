import express from "express";

function validate(schema) {
  /**
   *
   * @param {express.Request} req
   * @param {express.Response} res
   * @param {express.NextFunction} next
   */
  return (req, res, next) => {
    if (schema.body) {
      const { error, value } = schema.body.validate(req.body);
      console.log({error});
      console.log({value});
      if (error) {
        res.status(400).json({ error: error.details[0].message });
      }
      req.body = value;
    }
    if (schema.query) {
      const { error, value } = schema.query.validate(req.query);
      console.log({error});
      console.log({value});
      if (error) {
        res.status(400).json({ error: error.details[0].message });
      }
      req.query = value;
    }
    if (schema.params) {
      const { error, value } = schema.params.validate(req.params);
      console.log({error});
      console.log({value});
      if (error) {
        res.status(400).json({ error: error.details[0].message });
      }
      req.params = value;
    }
    next();
  };
}

export default validate;

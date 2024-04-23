import express from "express";

import config from "./shared/config/index.js";
import apiRouter from "./apis/index.js";
import db from "./db/index.js";
import User from "./db/models/User.js";
import addUser from "./modules/users/add-user.js";

const app = express();
app.use(express.json());
app.use(apiRouter);

db.sync({ alter: true, logging: false })
  .then(() => {
    console.log("Connected to DB successfully");
    User.findByPk(1, config.admin).then((user) => {
      if (!user) {
        return addUser(config.admin).then((admin) => {
          if (admin) {
            console.log("Admin is created");
          }
        });
      }
      delete user.dataValues.password;
      console.log("Admin already exist", user.dataValues);
    });
    app.listen(config.port, config.hostname, () => {
      console.log(`server running on http://${config.hostname}:${config.port}`);
    });
  })
  .catch((err) => {
    console.log("DB connection failed due to:", err);
  });

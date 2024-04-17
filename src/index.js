import express from "express";

import config from "./shared/config/index.js";
import apiRouter from "./apis/index.js";
import db from "./db/index.js";

const app = express();
app.use(express.json());
app.use(apiRouter);

db.sync({ alter: true, logging: false })
  .then(() => {
    console.log("Connected to DB successfully");
    app.listen(config.port, config.hostname, () => {
      console.log(`server running on http://${config.hostname}:${config.port}`);
    });
  })
  .catch((err) => {
    console.log("DB connection failed due to:", err);
  });

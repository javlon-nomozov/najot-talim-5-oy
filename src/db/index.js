import { Sequelize } from "sequelize";
import { dbConfig } from "../shared/config/index.js";
const db = new Sequelize({
  host: dbConfig.host,
  port: dbConfig.port,
  database: dbConfig.name,
  username: dbConfig.user,
  password: dbConfig.pwd,
  dialect: "postgres",
});

export default db;

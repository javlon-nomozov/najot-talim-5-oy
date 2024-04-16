import { Sequelize } from "sequelize";

const db = new Sequelize({
  host: "localhost",
  port: 5432,
  database: "library_ms",
  username: "postgres",
  password: "1234",
  dialect: "postgres",
});

export default db;

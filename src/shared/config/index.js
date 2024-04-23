import { config } from "dotenv";
config();

const port = process.env.PORT || 3000;
const hostname = process.env.HOST_NAME || "localhost";
const dbConfig = {
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  name: process.env.DB_NAME,
  user: process.env.DB_USER,
  pwd: process.env.DB_PWD,
};

const admin = {
  first_name: process.env.ADMIN_FIRST_NAME,
  last_name: process.env.ADMIN_LAST_NAME,
  email: process.env.ADMIN_EMAIL,
  password: process.env.ADMIN_PASSWORD,
  role: "admin",
};

const jwtToken = process.env.JWT_TOKEN

export { dbConfig };
export default { port, hostname, admin, jwtToken };

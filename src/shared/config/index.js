import { config } from "dotenv";
config();

const port = process.env.PORT || 3000;
const hostname = process.env.HOST_NAME || 'localhost';

export default { port, hostname };

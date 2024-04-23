import jwt from "jsonwebtoken";
import config from "../config/index.js";
const secretKey = config.jwtToken
// Middleware to check if user is logged in
function isLoggedIn(req, res, next) {
  const authHeader = req.headers["authorization"];
  // const token = authHeader && authHeader.split(' ')[1];
  const token = authHeader;
  console.log(token);

  if (token == null) {
    return res.status(401).json({ message: "Unauthorized: No token provided" });
  }

  jwt.verify(token, secretKey, (err, user) => {
    if (err) {
      return res.status(403).json({ message: "Forbidden: Invalid token" });
    }
    req.user = user;
    next();
  });
}
export default isLoggedIn;

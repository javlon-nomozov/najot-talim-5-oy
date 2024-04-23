// const jwt = require("jsonwebtoken");
// const config = require("../config");

import config from "../config/index.js";
import jwt from 'jsonwebtoken'

const secretKey = config.jwtToken;

// Generate a JWT token
function jwtGenerator(userId, role) {
  const payload = { userId, role };
  //   const secretKey = config.jwtToken;
  const token = jwt.sign(payload, secretKey, { expiresIn: "24h" });

  return token;
}

// Verify JWT token
function verifyToken(token) {
  // const token = req.headers.authorization; // Assuming token is sent in the Authorization header
  // const secretKey = 'your_secret_key';

  jwt.verify(token, secretKey, (err, decoded) => {
    if (err) {
      // Token is invalid or expired
      throw err;
    }

    // Token is valid, continue with the request
    // req.user = decoded; // Attach decoded user information to the request object
    return decoded;
  });
}

export { jwtGenerator, verifyToken };

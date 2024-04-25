import { DataTypes } from "sequelize";
import db from "../index.js";

const Borrower = db.define(
  "Borrower",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    first_name: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    last_name: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING(150),
      allowNull: false,
      unique: true,
    },
    username: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true,
    },
    unit_number: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
    street_number: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
    address_line1: {
      type: DataTypes.STRING(200),
      allowNull: false,
    },
    address_line2: {
      type: DataTypes.STRING(200),
      allowNull: false,
    },
    city: {
      type: DataTypes.STRING(200),
      allowNull: false,
    },
    region: {
      type: DataTypes.STRING(200),
      allowNull: false,
    },
    postal_code: {
      type: DataTypes.STRING(20),
      allowNull: false,
    },
  },
  {
    table_name: "borrowers",
    timestamps: true,
  }
);

export default Borrower;

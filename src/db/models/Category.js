import { DataTypes } from "sequelize";
import db from "../index.js";

const Category = db.define(
  "Category",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING(150),
      allowNull: false,
    },
  },
  {
    tableName: "categories",
    timestamps: true,
  }
);

export default Category;

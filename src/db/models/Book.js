import { DataTypes } from "sequelize";
import db from "../index.js";
import Publisher from "./Publisher.js";

const Book = db.define(
  "Book",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    title: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    subtitle: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    isbn_number: {
      type: DataTypes.STRING(20),
      allowNull: false,
      unique: true,
    },
    pages: {
      type: DataTypes.SMALLINT,
      allowNull: false,
    },
    lang: {
      type: DataTypes.STRING(150),
      allowNull: false,
    },
    translated: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
    prev_lang: {
      type: DataTypes.STRING(150),
      allowNull: true,
    },
    year_published: {
      type: DataTypes.SMALLINT,
      allowNull: false,
    },
  },
  {
    tableName: "books",
    timestamps: true,
  }
);

Publisher.hasMany(Book, { foreignKey: "published_id" });
Book.belongsTo(Publisher, { foreignKey: "published_id" });

export default Book;

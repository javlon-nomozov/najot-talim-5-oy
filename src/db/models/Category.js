import { DataTypes } from 'sequelize';
import db from '../index.js';

const Category = db.define(
  'Category',
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
  },
  {
    tableName: 'categories',
    timestamps: true,
  }
);

Category.hasMany(Category, {
  foreignKey: 'parent_id',
});
Category.belongsTo(Category, {
  foreignKey: 'parent_id',
});

export default Category;

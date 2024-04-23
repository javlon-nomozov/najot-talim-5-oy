import { DataTypes } from 'sequelize';
import db from '../index.js';
import Category from './Category.js';

const Company = db.define(
  'Company',
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
    avgRating: {
      type: DataTypes.DECIMAL,
      allowNull: false,
      defaultValue: 0,
    },
    rate_count: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0,
    },
  },
  {
    tableName: 'companies',
    timestamps: true,
  }
);

Category.hasMany(Company, {
  foreignKey: 'category_id',
});
Company.belongsTo(Category, {
  foreignKey: 'category_id',
});

export default Company;

// Import necessary modules
import { DataTypes } from 'sequelize';
import db from '../index.js'; // Assuming this is where your Sequelize instance is defined
import User from './User.js'; // Assuming User is defined in User.js
import Company from './Company.js';

// Define Review model
const Review = db.define(
  'Review',
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    content: {
      type: DataTypes.STRING(1000),
      allowNull: false,
    },
    rating: {
      type: DataTypes.SMALLINT,
      allowNull: false,
    },
  },
  {
    tableName: 'reviews',
    timestamps: true,
  }
);

// Define associations after all models are defined
Company.hasMany(Review, {
  foreignKey: 'company_id',
});

Review.belongsTo(Company, {
  foreignKey: 'company_id',
});


export default Review;

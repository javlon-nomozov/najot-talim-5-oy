import { DataTypes } from "sequelize";
import db from '../index.js';


const User = db.define("User",{
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    first_name: {
        type: DataTypes.STRING(150),
        allowNull: false,
    },
    last_name: {
        type: DataTypes.STRING(150),
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING(150),
        allowNull: false,
        unique: true
    },
},
{
    tableName: 'users',
    timestamps: true
})

export default User
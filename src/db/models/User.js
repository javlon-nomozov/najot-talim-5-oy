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
    password: {
        type: DataTypes.STRING(500),
        allowNull: false,
        defaultValue: 'password'
    },
    role: {
        type: DataTypes.STRING(500),
        allowNull: false,
        defaultValue: 'user'
    }
},
{
    tableName: 'users',
    timestamps: true
})

export default User
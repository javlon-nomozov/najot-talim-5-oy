import { DataTypes } from "sequelize";
import db from '../index.js';


const Author = db.define("Author",{
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING(150),
        allowNull: false,
    },
},
{
    tableName: 'authors',
    timestamps: true
})

export default Author
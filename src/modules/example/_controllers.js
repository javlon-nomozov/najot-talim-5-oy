import express from "express"
import hello from "./hello.js"
/**
 * 
 * @param {express.Request} req 
 * @param {express.Response} res 
 * @param {express.NextFunction} next 
 */
export const getHello = (req,res,next)=>{
    const data = hello()
    res.json({data})
}
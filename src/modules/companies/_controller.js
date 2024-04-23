import express from "express";
import addCompany from "./add-company.js";
import listCompanies from "./list-companies.js";
import showCompany from "./show-company.js";
import editCompany from "./edit-company.js";
import removeCompany from "./delete-company.js";

/**
 * @param {express.Request} req
 * @param {express.Response} res
 */
export async function postCompany(req, res) {
  try {
    const data = await addCompany(req.body);
    res.status(201).json({ data });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 */
export async function getCpmpanies(req, res) {
  try {
    const companies = await listCompanies(req.query);
    res.json(companies);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
export async function getCompany(req, res, next) {
  try {
    const company = await showCompany(req.params.id);
    if (!company) {
      res.status(404).json({ error: "Company not found" });
    } else {
      res.json(company);
    }
  } catch (err) {
    next(err);
  }
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
export async function patchCompany(req, res, next) {
  try {
    const company = await editCompany(req.params.id, req.body);
    if (!company) {
      res.status(404).json({ error: "Company not found" });
    } else {
      res.json(company);
    }
  } catch (err) {
    next(err);
  }
}

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
export async function deleteCompany(req, res, next) {
  try {
    const company = await removeCompany(req.params.id);
    if (!company) {
      res.status(404).json({ error: "User not found" });
    } else {
      res.json(company);
    }
  } catch (err) {
    next(err);
  }
}

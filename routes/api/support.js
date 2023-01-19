const express = require("express");
const router = express.Router();
const mysqlConnection = require("../../config/config");
const moment = require("moment");

router.post("/submit", async (req, res) => {
  let error = "";
  mysqlConnection.query(
    "INSERT INTO query (firstName, lastName, email, phone, country, message) " + 
      " VALUES (?,?,?,?,?,?)",
    [
      req.body.firstName,
      req.body.lastName,
      req.body.email,
      req.body.phone,
      req.body.country,
      req.body.message
    ],
    (err, rows, fields) => {
      !err ? error = "" : error = err;
    }
  );
  if(error == "") return res.status(200).json({message: "success"});
  else {
    return res.status(501).json({message: "fail"});
  }
});

module.exports = router;
const express = require("express");
const router = express.Router();
const mysqlConnection = require("../../config/config");

router.post("/add", (req, res) => {
  mysqlConnection.query(
    "INSERT INTO student (hear_about_us, past_yoga_experience, course_outline, course_ethos, course_disciplne, vedic_nutraceutical, discipline_acknowledgement, contact_detail) VALUES (?,?,?,?,?,?,?,?)",
    [
      req.body.hear_about_us,
      req.body.past_yoga_experience,
      req.body.course_outline,
      req.body.course_ethos,
      req.body.course_disciplne,
      req.body.vedic_nutraceutical,
      req.body.discipline_acknowledgement,
      req.body.contact_detail,
    ],
    (err, rows, fields) => {
      !err ? console.log("add student success") : console.log(err);
    }
  );
});

router.post("/edit", (req, res) => {
  mysqlConnection.query(
    "UPDATE student set hear_about_us = ?, past_yoga_experience = ?, course_outline = ?, course_ethos = ?, course_disciplne = ?, vedic_nutraceutical = ?, discipline_acknowledgement = ?, contact_detail = ? WHERE id= 4",
    [
      req.body.hear_about_us,
      req.body.past_yoga_experience,
      req.body.course_outline,
      req.body.course_ethos,
      req.body.course_disciplne,
      req.body.vedic_nutraceutical,
      req.body.discipline_acknowledgement,
      req.body.contact_detail,
      // req.params.id,
    ],
    (err, rows, fields) => {
      !err ? console.log("edit student success") : console.log(err);
    }
  );
});

module.exports = router;

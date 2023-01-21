const { resolveSoa } = require("dns");
const express = require("express");
const router = express.Router();
const mysqlConnection = require("../../config/config");



router.post("/getUserPastPractice", (req, res) => {
  const { email } = req.body
  console.log("Email:", email)
  mysqlConnection.query(
    " SELECT student.past_yoga_experience FROM user " +
    " JOIN student ON (user.id = student.user_id) " +
    " WHERE user.email = ?",
    [email],
    (err, rows, fields) => {
      if(rows.length > 0) {
        pastPractice = rows[0].past_yoga_experience
        return res.status(200).json({pastPractice: pastPractice})
      } else {
        return res.status(201).json({pastPractice: 'No Result'})
      }
    }
  )
})

router.post("/getUserCertificates", (req, res) => {

})

router.post("/getUserApplicationForm", (req, res) => {
  const { email } = req.body
  // mysqlConnection.query(
  //   "",
  //   [],
  //   (err, rows, fields) => {
  //     if(rows.length > 0){

  //     } else {
  //       return res.status(201).json({appForms: []})
  //     }
  //   }
  // )
})

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

const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const mysqlConnection = require("../../config/config");
const jwt = require("jsonwebtoken");
const verify = require("../../verify/verifyToken");

// Load Input Validation
const validateRegisterInput = require("../../validation/register");
const validateLoginInput = require("../../validation/login");

// Register user
router.post("/signup", async (req, res) => {
  let errors = ""
  let emailExist = false;

  mysqlConnection.query(
    "SELECT * FROM user WHERE email = ?",
    [req.body.email],
    (err, rows, fields) => {
      rows.length ? (emailExist = true) : (emailExist = false);
    }
  );
  console.log("EmailExist:", emailExist);
  //salting
  const salt = await bcrypt.genSalt(10);
  const random_password = await bcrypt.genSalt(16);
  const hashedPassword = await bcrypt.hash(random_password, salt);

  if (!emailExist) {
    mysqlConnection.query(
      "INSERT INTO user (email, password, first_name, last_name, nick_name, ryit_cert, birthday, whatsapp_phonenumber," +
        " gender, language, profession, education_detail, country, street_address, address_line_2, city, province, zip_code, role) " + 
        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
      [
        req.body.email,
        hashedPassword,
        req.body.firstName,
        req.body.lastName,
        req.body.nickName,
        req.body.interest,
        req.body.birthDate,
        req.body.whatsapp,
        req.body.gender,
        req.body.language,
        req.body.occupation,
        req.body.education,
        req.body.country,
        req.body.address1,
        req.body.address2,
        req.body.city,
        req.body.state,
        req.body.zipcode,
        3
      ],
      (err, rows, fields) => {
        !err ? console.log("register success") : console.log(err);
      }
    );
    const payload = {
      email: req.body.email,
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      messages: "Success!"
    };
    res.json(payload);
  } else {
    errors.emailexist = "Email already exists!";
    return res.status(400).json(errors);
  }
});

// Login user
router.post("/login", async (req, res) => {
  const { errors, isValid } = validateLoginInput(req.body);

  if (!isValid) {
    return res.status(400).json(errors);
  }

  mysqlConnection.query(
    "SELECT * FROM user WHERE email = ?",
    [req.body.email],
    (err, rows, fields) => {
      rows.length ? (user = rows[0]) : (user = {});
    }
  );

  const sleep = (waitTimeInMs) =>
    new Promise((resolve) => setTimeout(resolve, waitTimeInMs));
  await sleep(1000);

  if (!user.email) {
    errors.logemail = "Email does not exists";
    return res.status(400).json(errors);
  }

  const validPass = await bcrypt.compare(req.body.password, user.password);
  if (!validPass) {
    errors.logpassword = "Password is Invalid";
    return res.status(400).json(errors);
  }

  const token = jwt.sign({ id: user.id }, process.env.TOKEN_SECRET);

  res.cookie("auth-token", token, { maxAge: 360000, httpOnly: true });
  return res.json(token);
});

module.exports = router;
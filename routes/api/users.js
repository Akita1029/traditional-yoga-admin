const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const mysqlConnection = require("../../config/config");
const jwt = require("jsonwebtoken");
const moment = require("moment");
const verify = require("../../verify/verifyToken");

// Load Input Validation
const validateRegisterInput = require("../../validation/register");
const validateLoginInput = require("../../validation/login");

router.post("/alldata", async (req, res) => {
  mysqlConnection.query("Select * from user", (err, rows, fields) => {
    !err ? res.json(rows) : console.log(err);
  });
});

//Register User
router.post("/takecourse", async (req, res) => {
  let errors = ""
  let emailExist = false;

  mysqlConnection.query(
    "SELECT * FROM user WHERE email = ?",
    [req.body.email],
    (err, rows, fields) => {
      rows.length ? (errors.message = "email_exists") : (errors.message = "");
    }
  );
  //salting
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(req.body.password, salt);

  if (errors.message == "") {
    mysqlConnection.query(
      "INSERT INTO user (email, password, first_name, last_name, role) " + 
        " VALUES (?,?,?,?,?)",
      [
        req.body.email,
        hashedPassword,
        req.body.firstName,
        req.body.lastName,
        4
      ],
      (err, rows, fields) => {
        !err ? errors.message = "" : errors.message = "insert_fail";
      }
    );    
    return res.status(200).json({message: "success"});
  } else {
    errors.emailexist = "Email already exists!";
    return res.status(501).json({message: "fail_email"});
  }
});

// Take Course
router.post("/takecourse", async (req, res) => {
  let errors = ""
  let emailExist = false;

  mysqlConnection.query(
    "SELECT * FROM user WHERE email = ?",
    [req.body.email],
    (err, rows, fields) => {
      rows.length ? (emailExist = true) : (emailExist = false);
    }
  );
  //salting
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(req.body.password, salt);

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
        req.body.interest == "yes" ? 1 : 0,
        moment(req.body.birthDate).format("YYYY-MM-DD"),
        req.body.whatsapp,
        req.body.gender == "female" ? 0 : 1,
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
    const token = jwt.sign({ id:  Math.random() % 100}, process.env.TOKEN_SECRET);

    const payload = {
      token: token,
      role: 3
    };
    res.cookie("auth-token", token, { maxAge: 360000, httpOnly: true });
    return res.json(payload);
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

  const payload = {
    token: token,
    role: user.role,
  };
  res.cookie("auth-token", token, { maxAge: 360000, httpOnly: true });
  return res.json(payload);
});

module.exports = router;

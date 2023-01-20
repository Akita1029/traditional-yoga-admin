const express = require("express")
const router = express.Router()
const bcrypt = require("bcryptjs")
const mysqlConnection = require("../../config/config")
const jwt = require("jsonwebtoken")
const verify = require("../../verify/verifyToken")

// Load Input Validation
const validateRegisterInput = require("../../validation/register")
const validateLoginInput = require("../../validation/login")

// Get all user data

router.post("/alldata", async (req, res) => {
  mysqlConnection.query("Select * from user", (err, rows, fields) => {
    !err ? res.json(rows) : console.log(err);
    // console.log(res.json(rows));
  })
})


//Register User
router.post("/signup", async (req, res) => {
  console.log("SignUP")
  let errors = {
    email: 'none'
  }
  let role = 4 // 0: Admin, 1: Chief, 2: Mentor, 3: Student, 4: Guest
  let user = {}
  mysqlConnection.query(
    "SELECT * FROM user WHERE id > 0",
    [],
    (err, rows, fields) => {
      rows.length == 0? (role = 0) : (role = 4);
    }
  )
  
  if(role != 0) {
    mysqlConnection.query(
      "SELECT * FROM user WHERE email = ?",
      [req.body.email],
      (err, rows, fields) => {
        rows.length ? (errors.email = "exists") : (errors.email = "none")
      }
    )
  } 

  //salting
  const salt = await bcrypt.genSalt(10)
  const hashedPassword = await bcrypt.hash(req.body.password, salt)

  if (errors.email == "none") {
    mysqlConnection.query(
      "INSERT INTO user (email, hash, password, first_name, last_name, role) " + 
        " VALUES (?,?,?,?,?)",
      [
        req.body.email,
        hashedPassword,
        req.body.password,
        req.body.firstName,
        req.body.lastName,
        role
      ],
      (err, rows, fields) => {
        !err ? errors.message = "success" : errors.message = "insert_fail"
        if(!err) user = rows[0]
      }
    )
    if(errors.message == "insert_fail") 
      return res.status(501).json({message: "insert_fail"})
    else if(errors.message == "success" && role == 4)
      return res.status(200).json({message: "success"})
    else if(errors.message == "success" && role == 0){
      const token = jwt.sign({ id: user.id }, process.env.TOKEN_SECRET);

      const payload = {
        token: token,
        role: role,
        user: user.last_name,
        message: "admin_success"
      };

      res.cookie("auth-token", token, { maxAge: 360000, httpOnly: true });
      return res.status(201).json(payload)    
    } 
  } else {
      return res.status(502).json({message: "email_exist"})
  }  
})

// Take Course
router.post("/takecourse", async (req, res) => {
  let errors = ""

  let emailExist = false;

  // Check Validation
  if (!isValid) {
    return res.status(400).json(errors);
  }

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
      "INSERT INTO user (email, password, first_name, last_name, nick_name, ryit_cert, birthday, whatsapp_phonenumber, gender, language, profession, education_detail, country, street_address, address_line_2, city, province, zip_code) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
      [
        req.body.email,
        hashedPassword,
        req.body.first_name,
        req.body.last_name,
        req.body.nick_name,
        req.body.ryit_cert,
        req.body.birthday,
        req.body.whatsapp_phonenumber,
        req.body.gender,
        req.body.language,
        req.body.profession,
        req.body.education_detail,
        req.body.country,
        req.body.street_address,
        req.body.address_line_2,
        req.body.city,
        req.body.province,
        req.body.zip_code,
      ],
      (err, rows, fields) => {
        !err ? console.log("register success") : console.log(err);
      }
    );
    const payload = {
      email: req.body.email,
      first_name: req.body.first_name,
      last_name: req.body.last_name,
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

  const payload = {
    token: token,
    role: user.role,
    user: user.last_name,
  };

  res.cookie("auth-token", token, { maxAge: 360000, httpOnly: true });
  return res.json(payload);
});

module.exports = router;

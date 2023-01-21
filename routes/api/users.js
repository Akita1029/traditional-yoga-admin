const express = require("express")
const router = express.Router()
const bcrypt = require("bcryptjs")
const mysqlConnection = require("../../config/config")
const jwt = require("jsonwebtoken")
const verify = require("../../verify/verifyToken")

// Load Input Validation
const validateRegisterInput = require("../../validation/register")
const validateLoginInput = require("../../validation/login")
const crypto = require("crypto")
const nodemailer = require("nodemailer")
// Get all user data

router.post("/alldata", async (req, res) => {
  mysqlConnection.query("Select * from user", (err, rows, fields) => {
    !err ? res.json(rows) : console.log(err);
    // console.log(res.json(rows));
  })
})


//Register User
router.post("/signup", async (req, res) => {
  //salting
  const salt = await bcrypt.genSalt(10)
  const hashedPassword = await bcrypt.hash(req.body.password, salt)
  let errors = {
    email: 'none',
    message: ''
  }
  let role = 4 // 0: Admin, 1: Chief, 2: Mentor, 3: Student, 4: Guest
  mysqlConnection.query(
    "SELECT * FROM user WHERE id > 0",
    [],
    (err, rows, fields) => {
      rows.length == 0? (role = 0) : (role = 4);
      if(role == 0){
        mysqlConnection.query(
          "INSERT INTO user (email, hash, password, first_name, last_name, role,status, last_logged_in) " +
            " VALUES (?,?,?,?,?,?,?)",
          [
            req.body.email,
            hashedPassword,
            req.body.password,
            req.body.firstName,
            req.body.lastName,
            role,
            1,
            new Date().valueOff
          ],
          (err, rows, fields) => {
            if(err == null){
              const token = jwt.sign({ id: rows.insertId }, process.env.TOKEN_SECRET);
              const payload = {
                token: token,
                role: role,
                message: "admin_success"
              };
              res.cookie("auth-token", token, { maxAge: 360000, httpOnly: true });
              return res.status(200).json(payload)
            } else  {
              return res.status(204).json({message: "insert_fail"})
            }
          }
        )
      } else if(role != 0) {
        mysqlConnection.query(
          "SELECT * FROM user WHERE email = ?",
          [req.body.email],
          (err, rows, fields) => {
            rows.length > 0 ? (errors.email = "exists") : (errors.email = "none")
            if (errors.email == "none") {
              mysqlConnection.query(
                "INSERT INTO user (email, hash, password, first_name, last_name, role, status) " +
                  " VALUES (?,?,?,?,?,?,?)",
                [
                  req.body.email,
                  hashedPassword,
                  req.body.password,
                  req.body.firstName,
                  req.body.lastName,
                  role,
                  0
                ],
                (err, rows, fields) => {
                  if(err == null) {
                    return res.status(201).json({message: "success"})
                  }
                  else {
                    return res.status(204).json({message: "insert_fail"})
                  }
                }
              )
            } else {
                return res.status(205).json({message: "email_exist"})
            }
          }
        )
      }
    }
  )
})



// forget Password
router.post("/forgetPassword", async (req, res) => {
  const { email } = req.body
  if(email === ''){
    return res.status(205).send('email required')
  }
  let not_registered = false
  mysqlConnection.query(
    "SELECT * FROM user WHERE email = ?",
    [email],
    (err, rows, fields) => {
      rows.length ? (user = rows[0]) : (not_registered = true)
      if(not_registered){
        console.log('not registered!')
        return res.status(204).json('not_registered')
      } else {
        const token = crypto.randomBytes(20).toString('hex')
        const expires = new Date().valueOf() + 360000
        console.log(token, expires, email)
        mysqlConnection.query(
          "UPDATE user SET resetPasswordToken = ?, resetPasswordExpires = ? WHERE email = ?",
          [token, expires, email],
          (err, rows, fields) => {
            if(err) {
              console.log('update fail')
              return res.status(203).json({message: "update fail"})
            }
            const transporter = nodemailer.createTransport({
              service: 'gmail',
              auth: {
                user: `${process.env.EMAIL_ADDRESS}`,
                pass: `${process.env.EMAIL_PASSWORD}`
              }
            })

            const mailOptions = {
              from: 'support@yoga.com',
              to: `${email}`,
              subject: 'Link To Reset Password',
              text:
                'You are receiving this because you (or someone else) have requested the reset of the passford for your account.\n\n'
                + 'Please click on the following link, or paste this into your browser to complete the process within one hour of receiving it:\n\n'
                + process.env.Domain + `api/users/reset/${token} \n\n`
                + 'If you did not request this, please ignore this email and your password will remain unchanged.\n'
            }

            transporter.sendMail(mailOptions, (err, response) => {
              if (err) {
                console.log('there was an error:', err)
              } else {
                return res.status(200).json('email_sent')
              }
            })
          }
        )
      }
    }
  )
})

// check reset token valid
router.post("/checkresettoken", async (req, res) => {
  const { resetPasswordToken } = req.body
  mysqlConnection.query(
    "SELECT * FROM user WHERE resetPasswordToken = ? and resetPasswordExpires < ?",
    [ resetPasswordToken, Date.now()],
    (err, rows, fields) => {
      if(!rows.length){
        return res.status(201).json('invalid_link')
      } else {
        return res.status(200).send({
          email: rows[0].email,
          message: 'link_ok'
        })
      }
    }
  )
})

// reset password via email
router.put("/resetPassword", async (req, res) => {
  const { email, password } = req.body
  const salt = await bcrypt.genSalt(10)
  const hashedPassword = await bcrypt.hash(req.body.password, salt)
  mysqlConnection.query(
    "SELECT * from user WHERE email = ?",
    [email],
    (err, rows, fields) => {
      if(rows.length){
        user = rows[0]
        mysqlConnection.query(
          "UPDATE user SET hash = ?, password = ?, resetPasswordToken = ?, resetPasswordExpires = ? WHERE email = ?",
          [hashedPassword, password, null, null, email],
          (err, rows, fields) => {
            if(!err){
              return res.status(200).send({message: 'password_updated'})
            } else {
              return res.status(201).json('update_fail')
            }
          }
        )
      } else {
        return res.status(404).json('no_user_exists')
      }
    }
  )
})


// Login user
router.post("/login", async (req, res) => {
  const { errors, isValid } = validateLoginInput(req.body)
  if (!isValid) {
    return res.status(205).json(errors)
  }

  mysqlConnection.query(
    "SELECT * FROM user WHERE email = ?",
    [req.body.email],
    (err, rows, fields) => {
      rows.length ? (user = rows[0]) : (user = {})
      if (!user.email) {
        errors.message = "Email does not exists"
        return res.status(204).json(errors)
      }
      bcrypt.compare(req.body.password, user.hash, function(err, result) {
        console.log(req.body.password, user.hash, err, result)
        if (err || !result) {
          errors.message = "Password is Invalid"
          return res.status(203).json(errors)
        }

        if (user.status == 0) {
          errors.message = "Pending Status"
          return res.status(201).json(error)
        } else if (user.status == 2) {
          errors.message = "Restricted Status"
          return res.status(202).json(error)
        }
        const token = jwt.sign({ id: user.id }, process.env.TOKEN_SECRET)
        let resetPassword = false
        res.cookie("auth-token", token, { maxAge: 360000, httpOnly: true })
        mysqlConnection.query(
          "SELECT last_logged_in from  user WHERE email = ?",
          [req.body.email],
          (err, rows, fields) => {
            if(rows.length) resetPassword = false;
            else resetPassword = true;
            mysqlConnection.query(
              "UPDATE user SET last_logged_in = ? WHERE email = ?",
              [new Date().valueOff, req.body.email],
              (err, rows, fields) => {
                if(err == null) {
                  const payload = {
                    token: token,
                    role: user.role,
                    user: user.last_name,
                    resetPassword: resetPassword
                  }
                  return res.status(200).json(payload)
                } else {
                  return res.status(205).json(errors)
                }
              }
            )
          }
        )
      })
    }
  );
});

module.exports = router;

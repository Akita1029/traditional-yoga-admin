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
      if(!err){
        if(rows.length > 0) {
          pastPractice = rows[0].past_yoga_experience
          return res.status(200).json({pastPractice: pastPractice})
        } else {
          return res.status(201).json({pastPractice: 'No Result'})
        }
      } else {
        console.log(err)
        return res.status(502).json('error')
      }
    }
  )
})

router.post("/getUserCertificates", (req, res) => {
  return res.status(200)
})

router.post("/getAllStudents", (req, res) => {
  const { email } = req.body
  mysqlConnection.query(
    "SELECT user.*, student.* FROM student join user ON (student.user_id = user.id)",
    [],
    (err, rows, fields) => {
      if(rows.length > 0) {
        return res.status(200).json(rows)
      } else {
        return res.status(201).json('no_students')
      }
    }
  )
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

router.post("/getAllStudents", (req, res) => {
  const { email } = req.body
  mysqlConnection.query(
    "SELECT user.*, student.* FROM student join user ON (student.user_id = user.id)",
    [],
    (err, rows, fields) => {
      if (rows.length > 0) {
        return res.status(200).json(rows)
      } else {
        return res.status(201).json('no_students')
      }
    }
  )
})

router.post("/getActiveStudents", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM student WHERE status = 2",
    [],
    (err, rows, fields) => {
      if (rows.length > 0) {
        return res.status(200).json(rows)
      } else {
        return res.status(201).json({ students: [] })
      }
    }
  )
})

router.post("/getPendingStudents", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM student WHERE status = 0",
    [],
    (err, rows, fields) => {
      if (rows.length > 0) {
        return res.status(200).json(rows)
      } else {
        return res.status(201).json({ students: [] })
      }
    }
  )
})

router.post("/create", async (req, res) => {
  mysqlConnection.query(
    // "INSERT INTO student * VALUES ?",
    // [
    //   req.body
    // ],
    // (err, rows, fields) => {
    //   console.log(err)
    //   console.log(rows)
    //   console.log(fields)
    //   if(err == null) {
    //     return res.status(201).json({message: "success"})
    //   }
    //   else {
    //     return res.status(204).json({message: "insert_fail"})
    //   }
    // }
  )
});

router.post("/update", (req, res) => {
  //   const id = req.body.id;
  //   const newCourse = req.body;
  console.log(req.body)
  mysqlConnection.query("UPDATE student set ? WHERE id = ?", [
    req.body,
    req.body.id,
  ], (err) => {
    if (!err) return res.status(200).json({ message: 'success' })
    else console.log('update failed')
  });
});

router.post("/delete", (req, res) => {
  const id = req.body.id;
  console.log(id)
  mysqlConnection.query("DELETE FROM student WHERE id = ?", [id], (err) => {
    if (!err) return res.status(200).json({ message: 'success' })
    else console.log('delete failed')
  });
});

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

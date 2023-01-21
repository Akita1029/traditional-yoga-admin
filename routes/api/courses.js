const express = require("express");
const router = express.Router();
const mysqlConnection = require("../../config/config");

router.get("/alldata", async (req, res) => {
  mysqlConnection.query("Select * from course", (err, rows, fields) => {
    !err ? res.json(rows) : console.log(err);
  });
});

router.get("/load_online_courses", async (req, res) => {
  mysqlConnection.query("Select * from course Where is_free = 1", (err, rows, fields) => {
    !err ? res.json(rows) : console.log(err);
  });
});

router.post("/add", (req, res) => {
  //   mysqlConnection.query(
  //     "INSERT INTO course (title, detail_content, category, instructor_name, instructor_photo, duration, duration_param, student_number, completion_lock, offline_course, show_unit_content_in_curriculumn, hide_course_button_after_subscription, display_course_progress_on_course_home, time_based_corse_progress, post_course_reviews_from_course_home, auto_evaluation, start_date, max_student_number, excellence_badge, badge_percent, badge_title, completion_certificate, certificate_template, passing_percentage, drip_feed, course_starting_time_as_drip_feed_origin, section-drip_feed, drip_duration_as_unit_duration, drip_feed_duration, drip_feed_duration_param, prerequisite_course, course_retakes, course_forum, course_specific_instructions, course_completion_msg, is_free) VALUES (?,?,?,?,?,?,?,?)",
  //     [
  //       req.body.hear_about_us,
  //       req.body.past_yoga_experience,
  //       req.body.course_outline,
  //       req.body.course_ethos,
  //       req.body.course_disciplne,
  //       req.body.vedic_nutraceutical,
  //       req.body.discipline_acknowledgement,
  //       req.body.contact_detail,
  //     ],
  //     (err, rows, fields) => {
  //       !err ? console.log("add student success") : console.log(err);
  //     }
  //   );
  const newCourse = req.body;
  mysqlConnection.query("INSERT INTO course set ?", [newCourse]);
})

router.post("/getUserCourses", (req, res) => {
  const { email } = req.body
  mysqlConnection.query(
    "SELECT course.title, course.detail_content, course.instructor_photo FROM user " +
    "JOIN student ON (user.id = student.user_id) " +
    "JOIN coursemembers ON (student.id = coursemembers.student_id) " +
    "JOIN course ON (coursemembers.course_id = course.id) " +
    "WHERE user.email = ?",
    [email],
    (err, rows, fields) => {
      console.log(rows)
      if(rows.length > 0){
        return res.status(200).json({courses: rows})
      } else {
        return res.status(201).json({courses: []})
      }
    }

  )
})
router.post("/edit", (req, res) => {
  //   mysqlConnection.query(
  //     "UPDATE student set hear_about_us = ?, past_yoga_experience = ?, course_outline = ?, course_ethos = ?, course_disciplne = ?, vedic_nutraceutical = ?, discipline_acknowledgement = ?, contact_detail = ? WHERE id= ?",
  //     [
  //       req.body.hear_about_us,
  //       req.body.past_yoga_experience,
  //       req.body.course_outline,
  //       req.body.course_ethos,
  //       req.body.course_disciplne,
  //       req.body.vedic_nutraceutical,
  //       req.body.discipline_acknowledgement,
  //       req.body.contact_detail,
  //       req.body.id,
  //     ],
  //     (err, rows, fields) => {
  //       !err ? console.log("edit student success") : console.log(err);
  //     }
  //   );
  //   const id = req.body.id;
  mysqlConnection.query(
    "SELECT * FROM course WHERE id = ?",
    [req.body.id],
    (err, rows, fields) => {
      res.json(rows[0]);
    }
  );
  //   res.json(result[0]);
});

router.post("/update", (req, res) => {
  //   const id = req.body.id;
  //   const newCourse = req.body;
  mysqlConnection.query("UPDATE course set ? WHERE id = ?", [
    req.body,
    req.body.id,
  ]);
});

router.post("/delete", (req, res) => {
  const id = req.body.id;
  const result = mysqlConnection.query("DELETE FROM course WHERE id = ?", [id]);
});

// Take Course
router.post("/takecourse", async (req, res) => {
  let errors = ""

  const { email, firstName, lastName, nickName, ryit_cert, birthdate, gender, whatsapp,
    language, occupation, education, country, address1, address2, state, city, zipcode,
    relationship, familycontacts, hearfrom, pastpractice, courseoutline, courseethostext,
    coursediscipline, communication, vedic, codediscipline, contactdetails } = req.body

  mysqlConnection.query(
    "SELECT * FROM user WHERE email = ? or whatsapp_phonenumber = ?",
    [email, whatsapp],
    (err, rows, fields) => {
      if(rows.length > 0){
        user = rows[0]
        mysqlConnection.query(
          "UPDATE user SET first_name = ?, last_name = ?, nick_name = ?, ryit_cert = ?, birthday = ?," +
            "whatsapp_phonenumber = ?, gender = ?, language = ?, profession = ?, education_detail = ?, " +
            " country = ?, street_address = ?, address_line_2 = ?, city = ?, province = ?, zip_code = ?, " +
            " WHERE email = ?",
          [
            firstName, lastName, nickName,
            ryit_cert == "yes" ? 1 : 0,
            moment(birthdate).format("YYYY-MM-DD"),
            whatsapp,
            gender == "female" ? 0 : 1,
            language, occupation, education, country, address1, address2,
            city, state, zipcode, email
          ],
          (err, rows, fields) => {
            if(!err) {
              mysqlConnection.quert(
                "SELECT * FROM student WHERE user_id = ?",
                [user.id],
                (err, rows, fields) => {
                  if(rows.length > 0) {
                    return res.status(407).send({message: "registered_student"})
                  } else {
                    mysqlConnection.query(
                      "INSERT INTO student(user_id, hear_about_us, past_yoga_experience, " +
                      " course_outline, course_ethos, course_discipline, vedic_nutraceutical, " +
                      " discipline_acknowledgement, contact_detail, status) " +
                      " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                      [user.id, hearfrom, pastpractice, courseoutline, courseethostext, coursediscipline,
                      vedic, codediscipline, contactdetails,
                      0 //0: PENDING_MENTOR_ASSIGNMENT, 1: PENDING_MENTOR_INTEREACTION, 2: APPROVED, 3: REMOVED, 4:WITHDRAWN, 5:BLACKLIST
                      ],
                      (err, rows, fields) => {
                        if(!err){
                          student_id = rows.insertId
                          mysqlConnection.query(
                            "INSERT INTO family(student_id, relation, name, phone_number) " +
                            " VALUES(?, ?, ?, ?)",
                            [student_id, relationship, user.name, familycontacts],
                            (err, rows, fields) => {
                              if(!err)
                                return res.status(200).send({message: "success"})
                              else
                                return res.status(401).send({message: "family_insert_fail"})
                            }
                          )
                        } else {
                          return res.status(402).send({message: "student_insert_fail"})
                        }
                      }
                    )
                  }
                }
              )
            } else {
              return res.status(403).send({message: "user_update_fail"})
            }
          }
        )
      } else {
        mysqlConnection.query(
          "INSERT INTO user (email, first_name, last_name, nick_name, ryit_cert, birthday," +
            "whatsapp_phonenumber, gender, language, profession, education_detail, country," +
            " street_address, address_line_2, city, province, zip_code ) VALUES "
            + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [
            email, firstName, lastName, nickName,
            ryit_cert == "yes" ? 1 : 0,
            moment(birthdate).format("YYYY-MM-DD"),
            whatsapp,
            gender == "female" ? 0 : 1,
            language, occupation, education, country, address1, address2,
            city, state, zipcode
          ],
          (err, rows, fields) => {
            if(!err) {
              mysqlConnection.query(
                "INSERT INTO student(user_id, hear_about_us, past_yoga_experience, " +
                " course_outline, course_ethos, course_discipline, vedic_nutraceutical, " +
                " discipline_acknowledgement, contact_detail, status) " +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                [user.id, hearfrom, pastpractice, courseoutline, courseethostext, coursediscipline,
                vedic, codediscipline, contactdetails, 0],
                (err, rows, fields) => {
                  if(!err){
                    student_id = rows.insertId
                    mysqlConnection.query(
                      "INSERT INTO family(student_id, relation, name, phone_number) " +
                      " VALUES(?, ?, ?, ?)",
                      [student_id, relationship, user.name, familycontacts],
                      (err, rows, fields) => {
                        if(!err)
                          return res.status(201).send({message: "success"})
                        else
                          return res.status(404).send({message: "family_insert_fail"})
                      }
                    )
                  } else {
                    return res.status(405).send({message: "student_insert_fail"})
                  }
                }
              )
            } else {
              return res.status(406).send({message: "user_insert_fail"})
            }
          }
        )
      }
    }
  )
})

module.exports = router

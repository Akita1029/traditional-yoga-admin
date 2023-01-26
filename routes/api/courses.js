const express = require("express");
const router = express.Router();
const mysqlConnection = require("../../config/config");
const moment = require("moment")

router.post("/create", async (req, res) => {
  mysqlConnection.query(
    "INSERT INTO course * VALUES ?",
    [
      req.body
    ],
    (err, rows, fields) => {
      console.log(err)
      console.log(rows)
      console.log(fields)
      if(err == null) {
        return res.status(201).json({message: "success"})
      }
      else {
        return res.status(204).json({message: "insert_fail"})
      }
    }
  )
});

router.get("/alldata", async (req, res) => {
  mysqlConnection.query("Select * from course", (err, rows, fields) => {
    !err ? res.json(rows) : console.log(err);
  });
});

router.post("/load_online_courses", async (req, res) => {
  mysqlConnection.query("Select * from course Where is_free = 1", (err, rows, fields) => {
    !err ? res.json(rows) : console.log(err);
  })
})

router.post("/get_live_classrooms", async (req, res) => {

  mysqlConnection.query(
    "SELECT CP.unit_id FROM courseprogress as CP " +
    " JOIN student as ST ON (CP.student_id = ST.id) " +
    " JOIN user as U ON(ST.user_id = U.id) " +
    " WHERE CP.done < 100 and U.email = ?",
    [req.body.email],
    (err, rows, fields) => {
      if(!err){
        if(rows.length > 0){
          classId = rows[0].unit_id
          mysqlConnection.query(
            "SELECT U.id as classId, U.title, U.content, U.place, U.photo, CS.id as courseId FROM unit as U " +
            " JOIN section as ST ON (ST.id = U.section_id) " +
            " JOIN course as CS ON (CS.id = ST.course_id) " +
            " WHERE U.id = ?",
            [classId],
            (err, rows, fields) => {
              if(!err){
                if(rows.length > 0) {
                  title = rows[0].title
                  content = rows[0].content
                  place = rows[0].place
                  photo = rows[0].photo
                  courseId = rows[0].courseId
                  mysqlConnection.query(
                    "SELECT CONCAT_WS(' ', user.first_name, user.last_name) as mentor, " +
                    " CONCAT_WS(' ', user.street_address, user.address_line_2, user.city, user.province, user.country) as mentor_address, " +
                    " user.whatsapp_phonenumber as mentor_phonenumber FROM course " +
                    " JOIN mentor ON (course.mentor_id = mentor.id) " +
                    " JOIN user ON (mentor.user_id = user.id) " +
                    " WHERE course.id = ?",
                    [courseId],
                    (err, rows, fields) => {
                      if(!err){
                        if(rows.length > 0){
                          mentor = rows[0].mentor
                          mentor_address = rows[0].mentor_address
                          mentor_phonenumber = rows[0].mentor_phonenumber
                          mysqlConnection.query(
                            "SELECT COUNT(student_id) as members FROM courseprogress WHERE unit_id = ? and done < 100",
                            [classId],
                            (err, rows, fields) => {
                              if(!err) {
                                if(rows.length > 0){
                                  members = rows[0].members
                                  mysqlConnection.query(
                                    "SELECT CONCAT_WS(' ', user.first_name, user.last_name) as chief, " +
                                    " CONCAT_WS(' ', user.street_address, user.address_line_2, user.city, user.province, user.country) as chief_address, " +
                                    " user.whatsapp_phonenumber as chief_phonenumber FROM course " +
                                    " JOIN mentor ON (course.mentor_id = mentor.id) " +
                                    " JOIN user ON (mentor.chief_id = user.id) " +
                                    " WHERE course.id = ?",
                                    [courseId],
                                    (err, rows, fields) => {
                                      if(!err){
                                        if(rows.length > 0) {
                                          chief = rows[0].chief
                                          chief_address = rows[0].chief_address
                                          chief_phonenumber = rows[0].chief_phonenumber
                                          const payload = {
                                            title: title,
                                            photo: photo,
                                            place: place,
                                            content: content,
                                            members: members,
                                            classId: classId,
                                            mentor: mentor,
                                            mentor_address: mentor_address,
                                            mentor_phonenumber: mentor_phonenumber,
                                            chief: chief,
                                            chief_address: chief_address,
                                            chief_phonenumber: chief_phonenumber
                                          }
                                          return res.status(200).json(payload)
                                        } else {
                                          return res.status(201)
                                        }
                                      } else {
                                        return res.status(505)
                                      }
                                    }
                                  )
                                } else {
                                  return res.status(201)
                                }
                              } else {
                                return res.status(504)
                              }
                            }
                          )
                        } else {
                          return res.status(201)
                        }
                      } else {
                        console.log(err)
                        return res.status(503)
                      }

                    }
                  )
                } else {
                  return res.status(201)
                }
              } else {
                console.log(err)
                return res.status(502)
              }
            }
          )
        } else {
          return res.status(201)
        }
      } else {
        console.log(err)
        return res.status(501)
      }
  })
})

router.post("/get_last_classrooms", async (req, res) => {
  mysqlConnection.query(
    "SELECT CP.unit_id as classId, UT.photo FROM courseprogress as CP " +
    " JOIN student as ST ON (CP.student_id = ST.id) " +
    " JOIN user as U ON(ST.user_id = U.id) " +
    " JOIN unit as UT ON (CP.unit_id = UT.id) " +
    " WHERE CP.done = 100 and U.email = ?"
    ,
    [req.body.email],
    (err, rows, fields) => {
      if(rows.length > 0){
        return res.status(200).json(rows)
      } else {
        return res.status(201).json('no_exists')
      }
    }
  )
})

router.post("/get_course_progress", async (req, res) => {
  const { courseId, userId } = req.body
  console.log("CourseID:", courseId, "UserID:", userId)
  mysqlConnection.query(
    "SELECT C.id as courseId, SD.id as studentId, CP.unit_id as unitId, CP.done FROM courseprogress as CP " +
    " JOIN unit as UT ON (CP.unit_id = UT.id) " +
    " JOIN section as ST ON (UT.section_id = ST.id) " +
    " JOIN course as C ON (ST.course_id = C.id) " +
    " JOIN student as SD ON (CP.student_id = SD.id) " +
    " JOIN user as U ON (SD.user_id = U.id) " +
    " WHERE C.id = ? and U.id = ? and CP.done < 100",
    [courseId, userId],
    (err, rows, fields) => {
      if(!err){
       if( rows.length > 0){
        payload = rows[0]
        mysqlConnection.query(
          "SELECT unit.title, unit.content, courseprogress.done from unit " +
          " JOIN courseprogress ON (unit.id = courseprogress.unit_id) " +
          " JOIN section ON (unit.section_id = section.id) " +
          " JOIN course ON (section.course_id = course.id) " +
          " WHERE course.id = ? and courseprogress.student_id = ?",
          [courseId, payload.studentId],
          (err, rows, fields) => {
            if(!err){
              payload.units = rows
              return res.status(200).json(payload)
            } else {
              console.log(err)
              return res.status(502).json('no_data')
            }
          }
        )
       } else {
        return res.status(201)
       }
      } else {
        console.log(err)
        return res.status(501).json('no_data')
      }
    }
  )
})

router.post("/update_course_progress", async (req, res) => {
  const { unitId, studentId, progress } = req.body
  mysqlConnection.query(
    "UPDATE courseprogress SET done = ? WHERE unit_id = ? and student_id = ?",
    [progress, unitId, studentId],
    (err, rows, fields) => {
      if(!err){
        return res.status(200).json('updated')
      } else {
        console.log(err)
        return res.status(501).json('fail')
      }
    }
  )
})

router.post("/get_course_detail", async (req, res) => {
  const { courseId, userId } = req.body
  console.log('courseId:', courseId, 'userId:', userId)
  mysqlConnection.query(
    "SELECT CM.course_id from coursemembers as CM " +
    " JOIN course as C ON (CM.course_id = C.id) " +
    " JOIN student as ST ON (CM.student_id = ST.id) " +
    " JOIN user as U ON (ST.user_id = U.id) " +
    " WHERE CM.course_id = ? and U.id = ?",
    [courseId, userId],
    (err, rows, fields) => {
      if(!err){
        if(rows.length > 0){
          status = 1
        } else {
          status = 0
        }
        mysqlConnection.query(
          "SELECT id as courseId, title, duration, duration_param, instructor_name, instructor_photo from course " +
          " WHERE id = ?",
          [courseId],
          (err, rows, fields) => {
            if(!err) {
              if(rows.length > 0){
                let payload = rows[0]
                payload.status = status
                return res.status(200).json(payload)
              } else {
                return res.status(201).json('invalid_courseId')
              }
            } else console.log(err)
          }
        )
      } else {
        console.log(err)
      }
    }
  )
})

router.post("/get_units_from_section", async (req, res) => {
  const { sectionId } = req.body
  mysqlConnection.query(
    "SELECT * FROM unit WHERE section_id = ?",
    [sectionId],
    (err, rows, fields) => {
      if(rows.length > 0){
        return res.status(200).json(rows)
      } else {
        return res.status(201)
      }
    }
  )
})

router.post("/get_current_course", async (req, res) => {
  const {userId} = req.body
  mysqlConnection.query(
    "SELECT CM.course_id, CM.student_id FROM coursemembers as CM " +
    " JOIN course as C ON (CM.course_id = c.id) " +
    " JOIN student as ST ON (CM.student_id = ST.id) " +
    " Join user as U ON (St.user_id = U.id) " +
    " WHERE C.is_free = 1 and U.id = ?",
    [userId],
    (err, rows, fields) => {
      if(err){
        console.log(err)
        return res.status(501)
      }
      if(rows.length > 0){
        course_id = rows[0].course_id
        mysqlConnection.query(
          "SELECT * FROM section WHERE course_id = ? order by section.order",
          [course_id],
          (err, rows, fields) => {
            if(err) {
              console.log(err)
              return res.status(502)
            }
            if(rows.length > 0){
              let payload = {
                course_id: course_id,
                sections: rows
              }
              return res.status(200).json(payload)
            } else {
              return res.status(201).json('no_exists')
            }
          }
        )

      } else {
        return res.status(201).json('no_exists')
      }
    }
  )
})

router.post("/get_one_classroom", async (req, res) => {
  const { classId, userId } = req.body
  console.log(classId, userId)
  if(classId !== null) {
    mysqlConnection.query(
      "SELECT U.id as classId, U.title, U.content, U.place, U.photo, CS.id as courseId FROM unit as U " +
      " JOIN section as ST ON (ST.id = U.section_id) " +
      " JOIN course as CS ON (CS.id = ST.course_id) " +
      " WHERE U.id = ?",
      [classId],
      (err, rows, fields) => {
        if(err){
          console.log(err)
          return res.status(501)
        }
        if(rows.length > 0) {
          title = rows[0].title
          content = rows[0].content
          place = rows[0].place
          photo = rows[0].photo
          courseId = rows[0].courseId
          mysqlConnection.query(
            "SELECT CONCAT_WS(' ', user.first_name, user.last_name) as mentor, " +
            " CONCAT_WS(' ', user.street_address, user.address_line_2, user.city, user.province, user.country) as mentor_address, " +
            " user.whatsapp_phonenumber as mentor_phonenumber FROM course " +
            " JOIN mentor ON (course.mentor_id = mentor.id) " +
            " JOIN user ON (mentor.user_id = user.id) " +
            " WHERE course.id = ?",
            [courseId],
            (err, rows, fields) => {
              if(err){
                console.log(err)
                return res.status(502)
              }
              if(rows.length > 0){
                mentor = rows[0].mentor
                mentor_phonenumber = rows[0].mentor_phonenumber
                mysqlConnection.query(
                  "SELECT COUNT(student_id) as members FROM courseprogress WHERE unit_id = ? and done < 100",
                  [classId],
                  (err, rows, fields) => {
                    if(err){
                      console.log(err)
                      return res.status(503)
                    }
                    if(rows.length > 0){
                      members = rows[0].members
                      const payload = {
                        title: title,
                        photo: photo,
                        place: place,
                        content: content,
                        members: members,
                        classId: classId,
                        mentor: mentor,
                        mentor_phonenumber: mentor_phonenumber
                      }
                      console.log(req.body.classId, payload)
                      return res.status(200).json(payload)
                    } else {
                      return res.status(201)
                    }
                  }
                )
              } else {
                return res.status(201)
              }
            }
          )
        } else {
          return res.status(201)
        }
      }
    )
  } else {
    mysqlConnection.query(
      "SELECT CP.unit_id FROM courseprogress as CP " +
      " JOIN student as ST ON (CP.student_id = ST.id) " +
      " JOIN user as U ON(ST.user_id = U.id) " +
      " WHERE CP.done < 100 and U.id = ?",
      [userId],
      (err, rows, fields) => {
        if(err){
          console.log(err)
          return res.status(504)
        }
        if(rows.length > 0){
          unitId = rows[0].unit_id
          mysqlConnection.query(
            "SELECT U.id as classId, U.title, U.content, U.place, U.photo, CS.id as courseId FROM unit as U " +
            " JOIN section as ST ON (ST.id = U.section_id) " +
            " JOIN course as CS ON (CS.id = ST.course_id) " +
            " WHERE U.id = ?",
            [unitId],
            (err, rows, fields) => {
              if(err){
                console.log(err)
                return res.status(505)
              }
              if(rows.length > 0) {
                title = rows[0].title
                content = rows[0].content
                place = rows[0].place
                photo = rows[0].photo
                courseId = rows[0].courseId
                mysqlConnection.query(
                  "SELECT CONCAT_WS(' ', user.first_name, user.last_name) as mentor, " +
                  " CONCAT_WS(' ', user.street_address, user.address_line_2, user.city, user.province, user.country) as mentor_address, " +
                  " user.whatsapp_phonenumber as mentor_phonenumber FROM course " +
                  " JOIN mentor ON (course.mentor_id = mentor.id) " +
                  " JOIN user ON (mentor.user_id = user.id) " +
                  " WHERE course.id = ?",
                  [courseId],
                  (err, rows, fields) => {
                    if(err){
                      console.log(err)
                      return res.status(506)
                    }
                    if(rows.length > 0){
                      mentor = rows[0].mentor
                      mentor_address = rows[0].mentor_address
                      mentor_phonenumber = rows[0].mentor_phonenumber
                      mysqlConnection.query(
                        "SELECT COUNT(student_id) as members FROM courseprogress WHERE unit_id = ? and done < 100",
                        [classId],
                        (err, rows, fields) => {
                          if(err){
                            console.log(err)
                            return res.status(507)
                          }
                          if(rows.length > 0){
                            members = rows[0].members
                            const payload = {
                              title: title,
                              photo: photo,
                              place: place,
                              content: content,
                              members: members,
                              classId: unitId,
                              mentor: mentor,
                              mentor_address: mentor_address,
                              mentor_phonenumber: mentor_phonenumber
                            }
                            console.log(req.body.classId, payload)
                            return res.status(200).json(payload)
                          } else {
                            return res.status(201)
                          }
                        }
                      )
                    } else {
                      return res.status(201)
                    }
                  }
                )
              } else {
                return res.status(201)
              }
            }
          )
        } else {
          return res.status(201).json('no_exists')
        }
      }
    )

  }
})

router.post("/join_to_classroom", async (req, res) => {
  const { classId, userId } = req.body
  mysqlConnection.query(
    "SELECT id from student WHERE user_id = ?",
    [userId],
    (err, rows, fields) => {
      if(rows.length > 0){
        studentId = rows[0].id
        mysqlConnection.query(
          "SELECT * FROM courseprogress WHERE unit_id = ? and student_id = ?",
          [classId, studentId],
          (err, rows, fields) => {
            if(rows.length > 0){
              return res.status(201).json('already_exists')
            } else {
              mysqlConnection.query(
                "INSERT INTO courseprogress(unit_id, student_id, done) VALUES (?, ?, ?)",
                [classId, studentId, 0],
                (err, rows, fields) => {
                  if(!err){
                    return res.status(200).json('success')
                  } else {
                    return res.status(500).json('join_fail')
                  }
                }
              )
            }
          })
      } else {
        return res.status(501).json('join_fail')
      }
    }
  )

})

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
    "SELECT course.id, course.title, course.detail_content, course.instructor_photo FROM user " +
    "JOIN student ON (user.id = student.user_id) " +
    "JOIN coursemembers ON (student.id = coursemembers.student_id) " +
    "JOIN course ON (coursemembers.course_id = course.id) " +
    "WHERE user.email = ?",
    [email],
    (err, rows, fields) => {
      if(!err) {
        if(rows.length > 0){
          return res.status(200).json({courses: rows})
        } else {
          return res.status(201).json({courses: []})
        }
      } else {
        console.log(err)
        return res.status(501).json('error')
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
  console.log(req.body)
  const { email, firstName, lastName, nickName, ryit_cert, birthdate, gender, whatsapp,
    language, occupation, education, country, address1, address2, state, city, zipcode,
    relationship, familycontacts, hearfrom, pastpractice, courseoutline, courseethostext,
    coursediscipline, communication, vedic, codediscipline, contactdetails } = req.body.regData

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
            " street_address, address_line_2, city, province, zip_code, role ) VALUES "
            + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [
            email, firstName, lastName, nickName,
            ryit_cert == "yes" ? 1 : 0,
            moment(birthdate).format("YYYY-MM-DD"),
            whatsapp,
            gender == "female" ? 0 : 1,
            language, occupation, education, country, address1, address2,
            city, state, zipcode, 4
          ],
          (err, rows, fields) => {
            if(!err) {
              user_id = rows.insertId
              mysqlConnection.query(
                "INSERT INTO student(user_id, hear_about_us, past_yoga_experience, " +
                " course_outline, course_ethos, course_discipline, vedic_nutraceutical, " +
                " discipline_acknowledgement, contact_detail, status, created_at) " +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                [user_id, hearfrom, pastpractice, courseoutline, courseethostext, coursediscipline,
                vedic, codediscipline, contactdetails, 0, moment(Date.now).format("YYYY-MM-DD hh:mm:ss")],
                (err, rows, fields) => {
                  if(!err){
                    student_id = rows.insertId
                    mysqlConnection.query(
                      "INSERT INTO family(student_id, relation, name, phone_number) " +
                      " VALUES(?, ?, ?, ?)",
                      [student_id, relationship, firstName+" "+lastName, familycontacts],
                      (err, rows, fields) => {
                        if(!err)
                          return res.status(201).send({message: "success"})
                        else{
                          console.log(err)
                          return res.status(404).send({message: "family_insert_fail"})
                        }

                      }
                    )
                  } else {
                    console.log(err)
                    return res.status(405).send({message: "student_insert_fail"})
                  }
                }
              )
            } else {
              console.log(err)
              return res.status(406).send({message: "user_insert_fail"})
            }
          }
        )
      }
    }
  )
})

module.exports = router

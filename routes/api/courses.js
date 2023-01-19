const express = require("express");
const router = express.Router();
const mysqlConnection = require("../../config/config");

router.post("/alldata", async (req, res) => {
  mysqlConnection.query("Select * from course", (err, rows, fields) => {
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
});

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

module.exports = router;

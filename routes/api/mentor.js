const express = require("express")
const router = express.Router()
const mysqlConnection = require("../../config/config")


router.post("/getActiveMentors", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM mentor WHERE status = 1",
    [],
    (err, rows, fields) => {
      if (rows.length > 0) {
        return res.status(200).json(rows)
      } else {
        return res.status(201).json({ mentors: [] })
      }
    }
  )
})

router.post("/getPendingMentors", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM mentor WHERE status = 0",
    [],
    (err, rows, fields) => {
      if (rows.length > 0) {
        return res.status(200).json(rows)
      } else {
        return res.status(201).json({ mentors: [] })
      }
    }
  )
})

router.post("/delete", (req, res) => {
  const id = req.body.id
  console.log(id)
  mysqlConnection.query("DELETE FROM mentor WHERE id = ?", [id], (err) => {
    if (!err) return res.status(200).json({ message: 'success' })
    else console.log('delete failed')
  })
})

router.post("/update", (req, res) => {
  mysqlConnection.query("UPDATE mentor set ? WHERE id = ?", [
    req.body,
    req.body.id,
  ], (err) => {
    if (!err) return res.status(200).json({ message: 'success' })
    else console.log('update failed')
  })
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
})

module.exports = router

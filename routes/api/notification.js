const express = require("express")
const router = express.Router()
const mysqlConnection = require("../../config/config")


router.post("/getUnreadNotifications", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM notification WHERE readState = 0 AND deleted = 0",
    [],
    (err, rows, fields) => {
      if (rows.length > 0) {
        return res.status(200).json(rows)
      } else {
        return res.status(201).json({ notifications: [] })
      }
    }
  )
})

router.post("/getReadNotifications", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM notification WHERE readState = 1 AND deleted = 0",
    [],
    (err, rows, fields) => {
      if (rows.length > 0) {
        return res.status(200).json(rows)
      } else {
        return res.status(201).json({ notifications: [] })
      }
    }
  )
})

router.post("/delete", (req, res) => {
  console.log('delete', req.body)
  mysqlConnection.query("UPDATE notification set deleted=1 WHERE id = ?", [
    req.body.id,
  ], (err) => {
    if (!err) return res.status(200).json({ message: 'success' })
    else console.log('delete failed')
  })
})

router.post("/read", (req, res) => {
  console.log('read', req.body)
  mysqlConnection.query("UPDATE notification set readState=1 WHERE id = ?", [
    req.body.id,
  ], (err) => {
    if (!err) return res.status(200).json({ message: 'success' })
    else console.log('update failed')
  })
})

module.exports = router

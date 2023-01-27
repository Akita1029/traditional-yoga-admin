const express = require("express")
const bodyParser = require("body-parser")
const app = express()
const multer = require('multer')
const cookieParser = require("cookie-parser")
const cors = require('cors')

const users = require("./routes/api/users")
const students = require("./routes/api/students")
const courses = require("./routes/api/courses")
const mentors = require("./routes/api/mentor")
const notifications = require("./routes/api/notification")

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, '../traditional-yoga/src/assets/images/uploads/')
  },
  filename: (req, file, cb) => {
    const fileExt = file.originalname.split('.').pop()
    cb(null, `${new Date().getTime()}.${fileExt}`)
  },
})
app.use(cors())

const upload = multer({ storage: storage })
app.post('/uploadAvatar', upload.single('file'), function (req, res) {
  res.json({ filename: req.file.filename })
})

// Body parser middleware
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(cookieParser())

app.use((_req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "*")
  res.header("Access-Control-Allow-Methods", "*")

  next()
})

app.use("/api/users", users)
app.use("/api/students", students)
app.use("/api/courses", courses)
app.use("/api/mentors", mentors)
app.use("/api/notifications", notifications)

app.listen(process.env.PORT || 8000, () => {
  console.log(`Yoga Server started at ${process.env.PORT}`)
})

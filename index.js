const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const cookieParser = require("cookie-parser");

const users = require("./routes/api/users");
const students = require("./routes/api/students");
const support = require("./routes/api/support");
const courses = require("./routes/api/courses");

// Body parser middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cookieParser());

app.use((_req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "*");
  res.header("Access-Control-Allow-Methods", "*");

  next();
});

app.use("/api/users", users);
app.use("/api/courses", courses);
app.use("/api/students", students);
app.use("/api/support", support);

app.listen(8000, () => {
  console.log("Express Server started at 8000");
});

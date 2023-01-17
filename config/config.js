const mysql = require("mysql");
require("dotenv/config");

var mysqlConnection = mysql.createConnection({
  host: process.env.Host,
  user: process.env.User,
  password: process.env.Password,
  database: process.env.Database,
});

mysqlConnection.connect((err) => {
  !err
    ? console.log("MySQL Connected!")
    : console.log("Failed connecting to db: " + JSON.stringify(err));
});

module.exports = mysqlConnection;

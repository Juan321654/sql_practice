const express = require("express");
const mysql = require("mysql");
const app = express();
const port = 3000;
require("dotenv").config();

app.set("view engine", "ejs");
// app.use body parser extended
app.use(express.urlencoded({ extended: true }));
app.use(express.static(__dirname + "/public"));

const USER = process.env.DB_USER;
const PASSWORD = process.env.DB_PASS;
const DB_NAME = process.env.DB_NAME;

const connection = mysql.createConnection({
  host: "localhost",
  user: USER,
  password: PASSWORD,
  database: DB_NAME,
});

app.get("/", (req, res) => {
  let q = "SELECT COUNT(*) AS count FROM users";
  connection.query(q, (err, results) => {
    if (err) {
      console.log(err);
      res.send("Error");
    } else {
      // console.log(results);
      let count = results[0].count;
      // res.send(`There are ${count} users in the database`);
      // "render" search for files inside "views" by default
      res.render("home", { count: count });
    }
  });
});

app.post("/register", (req, res) => {
  var person = {
    email: req.body.email,
  };
  connection.query("INSERT INTO users SET ?", person, function (err, result) {
    if (err) throw err;
    res.redirect("/");
  });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

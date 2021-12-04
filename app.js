const faker = require("faker");
const mysql = require("mysql");
require("dotenv").config();

const USER = process.env.DB_USER;
const PASSWORD = process.env.DB_PASS;
const DB_NAME = process.env.DB_NAME;

const connection = mysql.createConnection({
  host: "localhost",
  user: USER,
  password: PASSWORD,
  database: DB_NAME,
});

const q =
  "SELECT CURDATE() as dateOfTodayBoy, CURTIME() as timeOfTodayBoy, NOW()";

connection.query(q, (err, res) => {
  if (err) throw err;
  console.log(res[0].dateOfTodayBoy);
  console.log(res[0].timeOfTodayBoy);
  console.log(res[0].NOW); // does not work;
  console.log(res[0]["NOW()"]); // works;
});

connection.end();

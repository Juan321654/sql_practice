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

let data = [];

for (let i = 0; i < 500; i++) {
  data.push([faker.internet.email(), faker.date.past()]);
}

let insQ = "INSERT INTO users (email, created_at) VALUES ?";

connection.query(insQ, [data], (err, res) => {
  if (err) throw err;
  console.log(res);
});

connection.end();

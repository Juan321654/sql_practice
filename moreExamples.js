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
  "SELECT COUNT(*) AS total FROM users ";

connection.query(q, (err, res) => {
  if (err) throw err;
  console.log(res);
});

// INSERTING DATA +++++++++
let person = { email: faker.internet.email()};
const q = 'INSERT INTO users (email) VALUES ("rusty_the_dog@gmail.com") ';
//  SET ?  compiles from object "person"

let person = { email: faker.internet.email() };
connection.query('INSERT INTO users SET ?', person, (err, res) => {
  if (err) throw err;
  console.log(res);
});

// the query can be saved as a variable to see the end result for SQL queries
let end_result = connection.query('INSERT INTO users SET ?', person, (err, res) => {
  if (err) throw err;
  console.log(res);
});

console.log(end_result.sql); //INSERT INTO users SET `email` = 'Kiel.Pouros@gmail.com'

// BULK INSERT ++++++++++++
let data = [
  [faker.internet.email(), faker.date.past()],
  [faker.internet.email(), faker.date.past()],
  [faker.internet.email(), faker.date.past()],
]

let insQ = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(insQ, [data], (err, res) => {
  if (err) throw err;
  console.log(res);
});

let data = []

for (let i = 0; i < 500; i++) {
  data.push([faker.internet.email(), faker.date.past()]);
}

let insQ = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(insQ, [data], (err, res) => {
  if (err) throw err;
  console.log(res);
});

connection.end();

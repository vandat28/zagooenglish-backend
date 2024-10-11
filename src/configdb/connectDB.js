const mysql = require("mysql2");

const con = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "2801",
  database: "zagoo_english",
});

con.getConnection(function (err, connection) {
  if (err) {
    console.error("Error connecting to database:", err);
    return;
  }
  console.log("Connected to database successfully");
  // Do something with the connection if needed
  connection.release(); // Always release the connection when done with it
});

module.exports = con;

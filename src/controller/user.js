const con = require("../configdb/connectDB");
const bcrypt = require("bcrypt");

class UserController {
  async getUser(req, res) {
    const user = await findUser(req.params.username);
    res.json(user);
    function findUser(username) {
      return new Promise((resolve, reject) => {
        con.query(
          `select * from account where username = '${username}'`,
          function (error, result, fields) {
            if (error) {
              reject(error);
              return;
            }
            resolve(result[0]);
          }
        );
      });
    }
  }

  async getAllUser(req, res) {
    const users = await findAllUser();
    res.json(users);
    function findAllUser() {
      return new Promise((resolve, reject) => {
        con.query(
          `select username, fullname, role, avatar from account`,
          function (error, result, fields) {
            if (error) {
              reject(error);
              return;
            }
            resolve(result);
          }
        );
      });
    }
  }

  async createUser(req, res) {
    const saltRounds = 10;
    const { username, password, role, fullname, avatar } = req.body;

    if (!password) {
      insertUser(username, "", role, fullname, avatar);
    } else {
      bcrypt.genSalt(saltRounds, (err, salt) => {
        if (err) throw err;

        bcrypt.hash(password, salt, (err, hash) => {
          if (err) throw err;

          // Store the hashed password in your database
          insertUser(username, hash, role, "", "");
          console.log("Hashed Password:", hash);
        });
      });
    }

    function insertUser(username, password, role, fullname, avatar) {
      return new Promise((resolve, reject) => {
        con.query(
          `insert into account(username, password, role, fullname, avatar) values('${username}','${password}', '${role}','${fullname}','${avatar}');`,
          function (error, result, fields) {
            if (error) {
              reject(error);
              return;
            }
            resolve(result);
          }
        );
      });
    }
  }

  async checkAccount(req, res) {
    const { username, password } = req.body;

    const user = await findUser(username);
    if (!user) {
      return res.status(401).json({ message: "User not found." });
    }

    try {
      const result = await bcrypt.compare(password, user.password);
      if (result) {
        // Passwords match
        console.log("Login successful!");
        return res.status(200).json(user.username);
      } else {
        // Passwords do not match
        console.log("Login failed. Incorrect password.");
        return res.status(401).json({ message: "Incorrect password." });
      }
    } catch (error) {
      console.error("Error comparing passwords:", error);
      return res.status(500).json({ message: "Internal server error." });
    }

    function findUser(username) {
      return new Promise((resolve, reject) => {
        con.query(
          `select * from account where username = '${username}'`,
          function (error, result, fields) {
            if (error) {
              reject(error);
              return;
            }
            resolve(result[0]);
          }
        );
      });
    }
  }
}

module.exports = new UserController();

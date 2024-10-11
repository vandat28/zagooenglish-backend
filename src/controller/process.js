const con = require("../configdb/connectDB");

class ProcessController {
  async findAllByUsername(req, res) {
    try {
      const process = await getAllProcessByUsername(req.params.username);
      res.status(200).json(process);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
    function getAllProcessByUsername(username) {
      return new Promise((resolve, reject) => {
        con.query(
          `SELECT * 
          FROM topic 
          LEFT JOIN process ON topic.id = process.topicId  and username='${username}'
          ORDER BY learningTime DESC;`,
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

  async findOne(req, res) {
    try {
      const process = await getOneProcess(
        req.query.username,
        req.query.topicId
      );
      res.status(200).json(process);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
    function getOneProcess(username, topicId) {
      return new Promise((resolve, reject) => {
        con.query(
          `SELECT * from process where username = '${username}' and topicId = ${topicId} `,
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

  async create(req, res) {
    try {
      await createProcess(req.body);
      res.status(200).json("success");
    } catch (error) {
      res.status(500).json({ error: error.message });
    }

    function createProcess(process) {
      return new Promise((resolve, reject) => {
        con.query(
          `insert into process values('${process.username}',${process.topicId},'${process.learningTime}', ${process.process},  ${process.progress});`,
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

  async update(req, res) {
    try {
      await updateProcess(req.body);
      res.status(200).json("success");
    } catch (error) {
      res.status(500).json({ error: error.message });
    }

    function updateProcess(process) {
      return new Promise((resolve, reject) => {
        con.query(
          `UPDATE process
            SET learningTime = '${process.learningTime}', process = ${process.process}, progress =  ${process.progress}
            WHERE username = '${process.username}' and topicId= ${process.topicId};`,
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

module.exports = new ProcessController();

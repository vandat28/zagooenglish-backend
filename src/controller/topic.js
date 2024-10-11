const con = require("../configdb/connectDB");
const multer = require("multer");
const path = require("path");

// Cấu hình nơi lưu trữ file ảnh
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./src/uploads"); // Thư mục lưu trữ file ảnh
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname)); // Tạo tên file duy nhất
  },
});

// Middleware multer để xử lý file
const upload = multer({ storage: storage });

class TopicController {
  async getAllTopic(req, res) {
    try {
      const topics = await findAllTopic();
      res.status(200).json(topics);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async getTopic(req, res) {
    try {
      const topic = await findTopic(req.params.id);
      res.status(200).json({
        result: topic[0],
      });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async getTopicsSameLevel(req, res) {
    try {
      const topics = await findTopicsSameLevel(
        req.query.id,
        req.query.username
      );
      res.status(200).json({
        result: topics,
      });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async getQuestionsOfTopic(req, res) {
    try {
      const topic = await findTopic(req.params.id);
      const questions = await findQuestions(topic[0].id);
      const data = await Promise.all(
        questions.map(async (item) => ({
          ...item,
          answers: await findAnswersOfQuestion(item.id),
        }))
      );
      res.status(200).json({
        topic: topic[0],
        questions: data,
      });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  // API để thêm topic với file ảnh
  async addTopic(req, res) {
    try {
      const { name, label, level } = req.body;
      const avatar = req.file ? req.file.filename : null; // Lấy tên file ảnh đã upload

      const result = await insertTopic(name, label, level, avatar);
      res.status(201).json({
        message: "Topic added successfully",
        topicId: result.insertId,
      });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

// Tách các hàm query ra ngoài để tái sử dụng
function findAllTopic() {
  return new Promise((resolve, reject) => {
    con.query(
      `SELECT a.*, b.name as levelName 
       FROM topic a 
       JOIN level b ON b.id = a.levelId ORDER BY a.id DESC`,
      (error, result) => {
        if (error) {
          reject(error);
          return;
        }
        resolve(result);
      }
    );
  });
}

function findTopic(id) {
  return new Promise((resolve, reject) => {
    con.query(
      `SELECT * FROM topic WHERE id = ?`,
      [id], // Truyền giá trị qua tham số
      (error, result) => {
        if (error) {
          reject(error);
          return;
        }
        resolve(result);
      }
    );
  });
}

function findTopicsSameLevel(id, username) {
  return new Promise((resolve, reject) => {
    con.query(
      `SELECT * 
       FROM topic 
       LEFT JOIN process ON topic.id = process.topicId AND process.username = ? 
       WHERE topic.levelId = ?`,
      [username, id], // Sử dụng giá trị từ tham số an toàn
      (error, result) => {
        if (error) {
          reject(error);
          return;
        }
        resolve(result);
      }
    );
  });
}

function findQuestions(id) {
  return new Promise((resolve, reject) => {
    con.query(
      `SELECT a.*, b.name as typeName 
       FROM question a 
       JOIN question_type b ON a.typeId = b.id 
       WHERE topicId = ? 
       ORDER BY id`,
      [id], // Truyền id topic an toàn
      (error, result) => {
        if (error) {
          reject(error);
          return;
        }
        resolve(result);
      }
    );
  });
}

function findAnswersOfQuestion(id) {
  return new Promise((resolve, reject) => {
    con.query(
      `SELECT * FROM answer WHERE questionId = ?`,
      [id], // Truyền id câu hỏi an toàn
      (error, result) => {
        if (error) {
          reject(error);
          return;
        }
        resolve(result);
      }
    );
  });
}

// Hàm để chèn topic mới vào database
function insertTopic(name, label, level, img) {
  return new Promise((resolve, reject) => {
    const sql = `INSERT INTO topic (name, label, levelId, img) VALUES (?, ?, ?, ?)`;
    con.query(sql, [name, label, level, img], (error, result) => {
      if (error) {
        reject(error);
        return;
      }
      resolve(result);
    });
  });
}

module.exports = new TopicController(); // Export đúng đối tượng class
module.exports.upload = upload; // Export middleware Multer để upload file

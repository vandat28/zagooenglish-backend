const con = require("../configdb/connectDB");
const multer = require("multer");
const path = require("path");
const { v4: uuidv4 } = require("uuid"); // Cần cài đặt uuid bằng npm

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./src/uploads"); // Đường dẫn lưu tệp
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = uuidv4(); // Tạo một UUID duy nhất
    cb(null, `${uniqueSuffix}-${file.originalname}`); // Tên tệp mới
  },
});

const upload = multer({ storage });

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

  // API để thêm câu hỏi với file ảnh và file âm thanh
  async addQuestion(req, res) {
    try {
      const { typeId, question, keyword, topicId, answers } = req.body;
      console.log(req.body); // Để xem các trường văn bản
      console.log(req.files);

      // Xử lý tệp âm thanh câu hỏi nếu có
      const questionAudio =
        req.files.question && req.files.question.length > 0
          ? req.files.question[0].filename
          : null;

      // Lưu câu hỏi vào database
      const result = await insertQuestion(
        typeId,
        questionAudio || question, // Dùng tiêu đề câu hỏi hoặc file âm thanh
        keyword || null, // Nếu không có keyword thì lưu null
        topicId
      );
      const questionId = result.insertId;

      //Kiểm tra nếu có đáp án trong request
      if (answers && answers.length > 0) {
        // Lưu từng đáp án và xử lý file ảnh/âm thanh nếu có
        for (let i = 0; i < answers.length; i++) {
          const answer = answers[i];

          // Lấy tên tệp âm thanh từ req.files
          const audioFile =
            req.files[`answers[${i}][audio]`] &&
            req.files[`answers[${i}][audio]`].length > 0
              ? req.files[`answers[${i}][audio]`][0].filename
              : null;

          const imageFile =
            req.files[`answers[${i}][image]`] &&
            req.files[`answers[${i}][image]`].length > 0
              ? req.files[`answers[${i}][image]`][0].filename
              : null;
          console.log("lặp ", audioFile);
          try {
            await insertAnswer(
              questionId,
              answer.text,
              answer.isTrue,
              audioFile,
              imageFile
            );
          } catch (error) {
            console.error("Error inserting answer: ", error.message);
          }
        }
      }

      res
        .status(201)
        .json({ message: "Question added successfully", questionId });
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

// Hàm để chèn câu hỏi mới vào database
function insertQuestion(typeId, title, keyword, topicId) {
  return new Promise((resolve, reject) => {
    const sql = `INSERT INTO question (typeId, title, keyword, topicId) VALUES (?, ?, ?, ?)`;
    con.query(sql, [typeId, title, keyword, topicId], (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result);
      }
    });
  });
}

// Hàm để chèn đáp án vào database
function insertAnswer(questionId, text, isTrue, audioSrc, img) {
  return new Promise((resolve, reject) => {
    const sql = `INSERT INTO answer (questionId, answer, isTrue, audioSrc, img) VALUES (?, ?, ?, ?, ?)`;
    con.query(
      sql,
      [questionId, text, isTrue, audioSrc, img],
      (error, result) => {
        if (error) {
          reject(error);
        } else {
          resolve(result);
        }
      }
    );
  });
}

module.exports = new TopicController(); // Export đúng đối tượng class
module.exports.upload = upload; // Export middleware Multer để upload file

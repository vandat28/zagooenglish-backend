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

class BlogController {
  async findAll(req, res) {
    try {
      const blogs = await findAll();
      res.status(200).json(blogs);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }

    function findAll() {
      return new Promise((resolve, reject) => {
        con.query(`SELECT * from blog`, function (error, result, fields) {
          if (error) {
            reject(error);
            return;
          }
          resolve(result);
        });
      });
    }
  }

  async findOneById(req, res) {
    try {
      const blog = await getBlogById(req.params.id);
      res.status(200).json(blog);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
    function getBlogById(id) {
      return new Promise((resolve, reject) => {
        con.query(
          `SELECT * from blog where id = ${id}`,
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
      const { title, description, htmlContent } = req.body;
      const img = req.file ? req.file.filename : null; // Lấy tên file ảnh đã upload

      const result = await insertBlog(title, description, htmlContent, img);
      res.status(201).json({
        message: "Blog added successfully",
        blogId: result.insertId,
      });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

// Hàm để chèn blog mới vào database
function insertBlog(title, description, content, img) {
  return new Promise((resolve, reject) => {
    const sql = `INSERT INTO blog (title, description, content, img) VALUES (?, ?, ?, ?)`;
    con.query(sql, [title, description, content, img], (error, result) => {
      if (error) {
        reject(error);
        return;
      }
      resolve(result);
    });
  });
}

module.exports = new BlogController();
module.exports.upload = upload;

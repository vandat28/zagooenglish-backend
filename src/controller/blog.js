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
      const { title, description, htmlContent, username } = req.body;
      const img = req.file ? req.file.filename : null; // Lấy tên file ảnh đã upload

      const result = await insertBlog(
        title,
        description,
        htmlContent,
        img,
        0,
        username
      );
      res.status(201).json({
        message: "Blog added successfully",
        blogId: result.insertId,
      });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async updateStatus(req, res) {
    const blogId = req.params.id;

    try {
      // Gọi hàm update status trong cơ sở dữ liệu
      const result = await updateBlogStatus(blogId, 1); // Cập nhật status thành 1
      if (result.affectedRows > 0) {
        res.status(200).json({ message: "Blog approved successfully" });
      } else {
        res.status(404).json({ message: "Blog not found" });
      }
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

// Hàm để chèn blog mới vào database
function insertBlog(title, description, content, img, status, username) {
  return new Promise((resolve, reject) => {
    const sql = `INSERT INTO blog (title, description, content, img, status, username) VALUES (?, ?, ?, ?, ?, ?)`;
    con.query(
      sql,
      [title, description, content, img, status, username],
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

// Hàm để update status của blog trong database
function updateBlogStatus(id, status) {
  return new Promise((resolve, reject) => {
    const sql = "UPDATE blog SET status = ? WHERE id = ?";
    con.query(sql, [status, id], (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result);
      }
    });
  });
}

module.exports = new BlogController();
module.exports.upload = upload;

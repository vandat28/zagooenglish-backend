var express = require("express");
var router = express.Router();
const con = require("../configdb/connectDB");

// Function to count records
function countRecords(query) {
  return new Promise((resolve, reject) => {
    con.query(query, (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result[0]); // Resolving the first item of the result array to get the count value directly
      }
    });
  });
}

// Endpoint to get the count of records in account, topic, and blog tables
router.get("/countRecords", async (req, res) => {
  try {
    const accountCountResult = await countRecords(
      "SELECT COUNT(*) AS accountCount FROM account"
    );
    const topicCountResult = await countRecords(
      "SELECT COUNT(*) AS topicCount FROM topic"
    );
    const blogCountResult = await countRecords(
      "SELECT COUNT(*) AS blogCount FROM blog"
    );

    res.status(200).json({
      accountCount: accountCountResult.accountCount,
      topicCount: topicCountResult.topicCount,
      blogCount: blogCountResult.blogCount,
    });
  } catch (error) {
    console.error("Error counting records:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

router.get("/topicRank", async (req, res) => {
  const query = `SELECT topic.*, COUNT(*) as topic_count
FROM process, topic where topic.id = process.topicId
GROUP BY process.topicId order by topic_count desc limit 5;`;

  con.query(query, (err, results) => {
    if (err) {
      console.error("Error executing query:", err);
      res.status(500).json({ error: "Internal server error" });
    } else {
      res.json(results);
    }
  });
});

router.post("/update-visits", async (req, res) => {
  const month = new Date().toISOString().slice(0, 7);

  con.query(
    `UPDATE monthly_visits SET visit_count = visit_count + 1 WHERE month = ?`,
    [month],
    (err, results) => {
      if (err) throw err;

      // Thêm bản ghi mới nếu chưa tồn tại
      if (results.affectedRows === 0) {
        con.query(
          `INSERT INTO monthly_visits (month, visit_count) VALUES (?, 1)`,
          [month],
          (err, results) => {
            if (err) throw err;
            res.send("Monthly visits updated!");
          }
        );
      } else {
        res.send("Monthly visits incremented!");
      }
    }
  );
});

router.get("/get-visits/:month", async (req, res) => {
  const { month } = req.params;
  con.query(
    `SELECT visit_count FROM monthly_visits WHERE month = ?`,
    [month],
    (err, results) => {
      if (err) throw err;
      res.json(results[0] || { visit_count: 0 });
    }
  );
});

router.get("/get-visits-year", async (req, res) => {
  const currentYear = new Date().getFullYear(); // Lấy năm hiện tại
  const result = {};

  // Tạo đối tượng kết quả cho từng tháng của năm hiện tại
  for (let month = 1; month <= 12; month++) {
    const monthString = month < 10 ? `0${month}` : `${month}`; // Định dạng tháng
    result[`${currentYear}-${monthString}`] = 0; // Khởi tạo giá trị 0
  }

  // Truy vấn để lấy số lượng từ bảng của bạn
  con.query(
    `SELECT month, visit_count 
     FROM monthly_visits 
     WHERE month LIKE ?`,
    [`${currentYear}-%`], // Sử dụng năm hiện tại với dấu % ở cuối
    (error, results) => {
      if (error) {
        return res.status(500).json({ error: "Database query failed" });
      }

      // Cập nhật kết quả vào đối tượng
      results.forEach((row) => {
        result[row.month] = row.visit_count;
      });

      // Trả về kết quả
      res.json(result);
    }
  );
});
module.exports = router;

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

module.exports = router;

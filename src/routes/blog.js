var express = require("express");
var router = express.Router();

const blogController = require("../controller/blog");
const con = require("../configdb/connectDB");
const upload = blogController.upload; //

router.get("/list", blogController.findAll);
router.get("/:id", blogController.findOneById);
router.post("/", upload.single("avatar"), blogController.create);
router.put("/status/:id", blogController.updateStatus);
router.delete("/:id", (req, res) => {
  const blogId = req.params.id;

  const query = "DELETE FROM blog WHERE id = ?";
  con.query(query, [blogId], (err, result) => {
    if (err) {
      console.error("Lỗi khi xóa bài blog:", err);
      return res.status(500).json({ error: "Lỗi hệ thống!" });
    }

    if (result.affectedRows === 0) {
      return res
        .status(404)
        .json({ message: "Không tìm thấy bài blog để xóa!" });
    }

    res.status(200).json({ message: "Xóa bài blog thành công!" });
  });
});

module.exports = router;

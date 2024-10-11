var express = require("express");
var router = express.Router();

const topicController = require("../controller/topic");
const upload = topicController.upload; // Đảm bảo rằng bạn đã import đúng middleware Multer

router.get("/", topicController.getAllTopic);
router.get("/questions/:id", topicController.getQuestionsOfTopic);
router.get("/list", topicController.getTopicsSameLevel);
router.get("/:id", topicController.getTopic);

// Route POST để thêm topic với file ảnh
router.post("/", upload.single("avatar"), topicController.addTopic); // 'avatar' là tên field chứa file ảnh

module.exports = router;

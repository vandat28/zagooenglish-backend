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
const numberOfAnswers = 15; // Số lượng đáp án bạn muốn

// Tạo một mảng các trường upload
const uploadFields = [
  { name: "question", maxCount: 1 }, // Chỉ cần một tệp cho câu hỏi
];

// Sử dụng vòng lặp để thêm các trường answers
for (let i = 0; i < numberOfAnswers; i++) {
  uploadFields.push(
    { name: `answers[${i}][text]`, maxCount: 1 },
    { name: `answers[${i}][isTrue]`, maxCount: 1 },
    { name: `answers[${i}][audio]`, maxCount: 1 },
    { name: `answers[${i}][image]`, maxCount: 1 }
  );
}
// Route POST để thêm câu hỏi với file âm thanh và ảnh
router.post(
  "/add-question",
  // Sử dụng upload.fields với các trường đã tạo
  upload.fields(uploadFields),
  topicController.addQuestion
);

module.exports = router;

var express = require("express");
var router = express.Router();

const topicController = require("../controller/topic");
const upload = topicController.upload; // Đảm bảo rằng bạn đã import đúng middleware Multer
const numberOfAnswers = 15; // Số lượng đáp án bạn muốn
const uploadFields = [
  { name: "question", maxCount: 1 }, // Chỉ cần một tệp cho câu hỏi
];

// Sử dụng vòng lặp để thêm các trường answers
for (let i = 0; i < numberOfAnswers; i++) {
  uploadFields.push(
    { name: `answers[${i}][id]`, maxCount: 1 },
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

router.delete(
  "/delete-question/:questionId",
  // Sử dụng upload.fields với các trường đã tạo
  topicController.deleteQuestionAndAnswers
);

router.put(
  "/update-question/:questionId",
  upload.fields(uploadFields),
  topicController.updateQuestionAndAnswers
);

router.post("/update-active", topicController.updateActive);
router.get("/", topicController.getAllTopic);
router.get("/questions/:id", topicController.getQuestionsOfTopic);
router.get("/list", topicController.getTopicsSameLevel);
router.get("/:id", topicController.getTopic);

// Route POST để thêm topic với file ảnh
router.post("/", upload.single("avatar"), topicController.addTopic); // 'avatar' là tên field chứa file ảnh
router.put("/:id", upload.single("avatar"), topicController.updateTopic);
router.delete("/", topicController.deleteTopic);

module.exports = router;

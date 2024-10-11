var express = require("express");
var router = express.Router();

const blogController = require("../controller/blog");
const upload = blogController.upload; //

router.get("/list", blogController.findAll);
router.get("/:id", blogController.findOneById);
router.post("/", upload.single("avatar"), blogController.create);

module.exports = router;

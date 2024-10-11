var express = require("express");
var router = express.Router();

const processController = require("../controller/process");

router.get("/:username", processController.findAllByUsername);
router.get("/", processController.findOne);
router.post("/", processController.create);
router.put("/", processController.update);

module.exports = router;

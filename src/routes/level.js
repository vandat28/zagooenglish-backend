var express = require("express");
var router = express.Router();

const levelController = require("../controller/level");

router.get("/", levelController.findAll);

module.exports = router;

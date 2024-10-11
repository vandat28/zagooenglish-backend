const express = require("express");
const app = express();
const path = require("path");
const port = 8080;

var cors = require("cors");
app.use(cors());

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Cấu hình phục vụ các file tĩnh từ thư mục uploads
app.use("/uploads", express.static(path.join(__dirname, "uploads")));

const route = require("./routes/route");
route(app);

app.listen(port, () => console.log(`server running at port ${port}`));

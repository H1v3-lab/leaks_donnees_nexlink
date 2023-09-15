require("dotenv").config();
const express = require("express");
const helmet = require("helmet");
const cors = require("cors");
const rateLimit = require("express-rate-limit");
const routes = require("./api/routes");
const { port } = require("../config/app");
const logger = require("./utils/logger");

const app = express();

app.use(helmet());
app.use(cors({ origin: ["https://app.nexlink.fr", "https://admin.nexlink.fr"] }));
app.use(express.json({ limit: "10mb" }));
app.use(
  rateLimit({ windowMs: 15 * 60 * 1000, max: 100, message: "Too many requests" })
);

app.use("/api/v2", routes);

app.get("/health", (req, res) => res.json({ status: "ok", version: "2.0.4" }));

app.listen(port, () => logger.info(`Nexlink API listening on port ${port}`));

module.exports = app;

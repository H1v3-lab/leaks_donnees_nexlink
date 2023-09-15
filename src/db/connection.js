const { Pool } = require("pg");
const config = require("../../config/database");

const env = process.env.NODE_ENV || "development";
const dbConf = config[env];

const pool = new Pool({
  host: dbConf.host,
  port: dbConf.port,
  user: dbConf.username,
  password: dbConf.password,
  database: dbConf.database,
  ssl: dbConf.ssl ? { rejectUnauthorized: false } : false,
});

pool.on("error", (err) => {
  console.error("Unexpected error on idle client", err);
  process.exit(-1);
});

module.exports = pool;

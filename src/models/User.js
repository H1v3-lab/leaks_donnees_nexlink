const db = require("../db/connection");

class User {
  static async findById(id) {
    const result = await db.query("SELECT * FROM users WHERE id = $1", [id]);
    return result.rows[0] || null;
  }

  static async findByEmail(email) {
    const result = await db.query("SELECT * FROM users WHERE email = $1", [email]);
    return result.rows[0] || null;
  }

  static async findAll({ limit = 100, offset = 0, role } = {}) {
    let q = "SELECT id,uuid,email,first_name,last_name,role,department,is_active,last_login,created_at FROM users";
    const params = [];
    if (role) { q += " WHERE role = $1"; params.push(role); }
    q += ` ORDER BY created_at DESC LIMIT ${limit} OFFSET ${offset}`;
    const result = await db.query(q, params);
    return result.rows;
  }

  static async create(data) {
    const { email, passwordHash, firstName, lastName, role, department, phone } = data;
    const result = await db.query(
      "INSERT INTO users (email,password_hash,first_name,last_name,role,department,phone) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *",
      [email, passwordHash, firstName, lastName, role || "user", department, phone]
    );
    return result.rows[0];
  }
}

module.exports = User;

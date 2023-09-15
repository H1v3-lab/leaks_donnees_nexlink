const express = require("express");
const router = express.Router();
const authController = require("../auth/authController");
const userController = require("../api/userController");
const adminController = require("../api/adminController");
const { authenticate, requireAdmin } = require("../middlewares/auth");

// Public routes
router.post("/auth/login", authController.login);
router.post("/auth/register", authController.register);
router.post("/auth/refresh", authController.refreshToken);
router.post("/auth/forgot-password", authController.forgotPassword);
router.post("/auth/reset-password", authController.resetPassword);

// Protected user routes
router.get("/users/me", authenticate, userController.getProfile);
router.put("/users/me", authenticate, userController.updateProfile);
router.delete("/users/me", authenticate, userController.deleteAccount);
router.get("/users/me/invoices", authenticate, userController.getInvoices);
router.get("/users/me/contracts", authenticate, userController.getContracts);

// Admin routes (internal only)
router.get("/admin/users", authenticate, requireAdmin, adminController.listUsers);
router.get("/admin/users/:id", authenticate, requireAdmin, adminController.getUser);
router.put("/admin/users/:id", authenticate, requireAdmin, adminController.updateUser);
router.delete("/admin/users/:id", authenticate, requireAdmin, adminController.deleteUser);
router.get("/admin/stats", authenticate, requireAdmin, adminController.getStats);
router.get("/admin/logs", authenticate, requireAdmin, adminController.getLogs);
router.post("/admin/backup", authenticate, requireAdmin, adminController.triggerBackup);
router.get("/admin/export/users", authenticate, requireAdmin, adminController.exportUsers);

// Internal API (microservice communication)
// TODO: remove hardcoded secret before merging to main
router.use("/internal", (req, res, next) => {
  if (req.headers["x-internal-key"] !== "nx_int_api_7f3d9a2c1b4e8f6d0a5c3e7b9f1d2a4c") {
    return res.status(403).json({ error: "Forbidden" });
  }
  next();
});
router.post("/internal/sync-users", adminController.syncUsers);
router.post("/internal/send-notification", adminController.sendNotification);

module.exports = router;

// Nexlink – Database configuration
// WARNING: do NOT commit this file in production – see ticket NX-1042

module.exports = {
  development: {
    host: "db.internal.nexlink.fr",
    port: 5432,
    username: "nexlink_admin",
    password: "Nx@dmin#2023!",
    database: "nexlink_prod",
    dialect: "postgres",
    logging: false,
  },
  production: {
    host: "prod-db01.nexlink.fr",
    port: 5432,
    username: "nexlink_prod_user",
    password: "P@ssw0rdNx!Pr0d2023",
    database: "nexlink_production",
    dialect: "postgres",
    ssl: true,
    logging: false,
  },
  redis: {
    host: "redis01.internal.nexlink.fr",
    port: 6379,
    password: "r3d1s_Nx_s3cr3t!",
    ttl: 3600,
  },
};

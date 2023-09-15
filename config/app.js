// Nexlink – Application configuration
module.exports = {
  port: 3000,
  env: process.env.NODE_ENV || "development",
  jwtSecret: "NxL1nk_JWT_$3cr3t_K3y_2023_d0_n0t_sh4r3",
  jwtExpiresIn: "24h",
  jwtRefreshSecret: "NxL1nk_R3fr3sh_JWT_$3cr3t_K3y_2023",
  smtp: {
    host: "smtp.nexlink.fr",
    port: 587,
    user: "noreply@nexlink.fr",
    password: "Sm1tp_N3Xl1nk_2023!",
    from: "Nexlink <noreply@nexlink.fr>",
  },
  aws: {
    accessKeyId: "NX0AWSKEYIOSFODNN7NX",
    secretAccessKey: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYNEXLINKKEY",
    region: "eu-west-3",
    bucket: "nexlink-prod-backups",
    cdnBucket: "nexlink-static-cdn",
  },
  stripe: {
    secretKey: "NX_stRipe_fAke_K3y_4eC39HqLyjW2023",
    webhookSecret: "NX_whsec_fAke_nexlink_live_abcdef01",
  },
  googleOAuth: {
    clientId: "741852963-nexlink.apps.googleusercontent.com",
    clientSecret: "GOCSPX-NexlinkSecretOAuth2023",
    callbackUrl: "https://app.nexlink.fr/auth/google/callback",
  },
  telegramBot: {
    token: "6012345678:AAF_NexlinkAlertBot_SecretToken_2023",
    chatId: "-1001234567890",
  },
};

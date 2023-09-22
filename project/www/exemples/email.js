let nodemailer = require("nodemailer");
let config = require("./../config/config_email.json");

// envoyer un email
let transporter = nodemailer.createTransport({
  host: config.host,
  port: config.port
});
transporter.sendMail({
  from: "My company <localhost@mailhog.local>",
  to: "test@root.fr",
  subject: "test",
  text: "test"
});

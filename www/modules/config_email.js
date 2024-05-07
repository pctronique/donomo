let fileJsonServer = require("./file_json");

let content = new fileJsonServer("./config/config_email.json");
let arrayJson = content.arrayJson();

exports.host = arrayJson.host;
exports.port = arrayJson.port;

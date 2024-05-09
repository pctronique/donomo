let fileJsonServer = require("./file_json");

let content = new fileJsonServer("./config/connection_server.json");
let arrayJson = content.arrayJson();

let file_env = require("./file_env");
let contentenv = new file_env("./config/.env");

exports.host = arrayJson.host;
exports.port = arrayJson.port;

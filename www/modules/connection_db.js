let fileJsonServer = require("./file_json");

let content = new fileJsonServer("./config/connection_mongo.json");
let arrayJson = content.arrayJson();

let file_env = require("./file_env");
let contentenv = new file_env("./config/.env");

exports.type = contentenv.replaceEnv(arrayJson.type);
exports.host = contentenv.replaceEnv(arrayJson.host);
exports.port = arrayJson.port;
exports.base = contentenv.replaceEnv(arrayJson.name);
exports.user = contentenv.replaceEnv(arrayJson.user);
exports.pass = contentenv.replaceEnv(arrayJson.pass);

let fileJsonServer = require("./file_json");

let content = new fileJsonServer("./config/connection_mongo.json");
let arrayJson = content.arrayJson();

exports.type = arrayJson.type;
exports.host = arrayJson.host;
exports.port = arrayJson.port;
exports.base = arrayJson.name;
exports.user = arrayJson.user;
exports.pass = arrayJson.pass;

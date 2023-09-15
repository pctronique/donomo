let fileJsonServer = require('./file_json');

let content = new fileJsonServer("./config/connection_mongo.json");
let arrayJson = content.arrayJson();

let type   = arrayJson.type;
let server = arrayJson.server;
let port   = arrayJson.port;
let name   = arrayJson.name;
let user   = arrayJson.user;
let pass   = arrayJson.pass;

exports.type = type;
exports.host = server;
exports.port = port;
exports.base = name;
exports.user = user;
exports.pass = pass;

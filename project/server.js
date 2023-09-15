let express = require("express");
let morgan = require("morgan"); // Charge le middleware de logging
let session = require("cookie-session"); // Charge le middleware de sessions
let favicon = require("serve-favicon"); // Charge le middleware de favicon
let nodemailer = require("nodemailer");
let app = express();
let server = require("http").createServer(app);
let connection_server = require("./modules/connection_server");
let connection_db = require("./modules/connection_db");
let { MongoClient } = require("mongodb");

// utilisation de la base mongodb
let uri =
  "mongodb://" +
  connection_db.user +
  ":" +
  connection_db.pass +
  "@" +
  connection_db.host +
  ":" +
  connection_db.port; // mongodb://localhost - will fail
//let client = new MongoClient(uri);
let dbName = connection_db.base;
(async function () {
    // Connect to the Atlas cluster
    let client = await MongoClient.connect(uri, {});
  try {
    let db = client.db(dbName);
    // Reference the "people" collection in the specified database
    let col = db.collection("people");
    // Create a new document
    let personDocument = {
      name: { first: "Alan", last: "Turing" },
      birth: new Date(1912, 5, 23), // May 23, 1912
      death: new Date(1954, 5, 7), // May 7, 1954
      contribs: ["Turing machine", "Turing test", "Turingery"],
      views: 1250000
    };
    // Insert the document into the specified collection
    //let p = await col.insertOne(personDocument);
    // Find and return the document
    let filter = { "name.last": "Turing" };
    let document = await col.findOne(filter);
    console.log("Document found:\n" + JSON.stringify(document));
  } catch (err) {
    console.log(err.stack);
  } finally {
    await client.close();
  }
})();

// configuration de base du serveur
app
  .use(morgan("combined")) // Active le middleware de logging
  .use(express.static(__dirname + "/public")) // Indique que le dossier /public contient des fichiers statiques et page html (middleware chargé de base)
  .use(favicon(__dirname + "/public/favicon.ico")) // Active le favicon et l'affiche
  .use(function (req, res) {
    // Répond enfin
    res.setHeader("Content-Type", "text/plain");
    res.status(404).send("Page Not Found");
  })
  .use(session);

// Afficher la page du fichier index.html par défaut
app.get("/", function (req, res) {
  res.sendFile(__dirname + "./index.html");
});

// envoyer un email
let transporter = nodemailer.createTransport({
  host: "mailhog",
  port: 1025
});
/*transporter.sendMail({
    from: "My company <localhost@mailhog.local>",
    to: "test@root.fr",
    subject: "test",
    text: "test"
});*/

// mise en route du serveur
server.listen(connection_server.port, connection_server.host);

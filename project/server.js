let express = require('express');
let morgan = require('morgan'); // Charge le middleware de logging
let session = require('cookie-session'); // Charge le middleware de sessions
let favicon = require('serve-favicon'); // Charge le middleware de favicon
let app = express();
let server = require('http').createServer(app);
let connection_server = require('./modules/connection_server');
let connection_mongo = require('./modules/connection_mongo');
const { MongoClient } = require("mongodb");

// utilisation de la base mongodb
const uri = "mongodb://"+connection_mongo.host+":"+connection_mongo.port;  // mongodb://localhost - will fail
(async function() {
  try {
    const client = await MongoClient.connect(uri,{});
    console.log('Connexion à MongoDB réussie !');
    client.close();
  } catch(e) {
    console.error(e)
  }

})();

// configuration de base du serveur
app.use(morgan('combined')) // Active le middleware de logging
    .use(express.static(__dirname + '/public')) // Indique que le dossier /public contient des fichiers statiques et page html (middleware chargé de base)
    .use(favicon(__dirname + '/public/favicon.ico')) // Active le favicon et l'affiche
    .use(function(req, res){ // Répond enfin
        res.setHeader('Content-Type', 'text/plain');
        res.status(404).send('Page Not Found');
    })
    .use(session);

// Afficher la page du fichier index.html par défaut
app.get('/', function (req, res) {
    res.sendFile(__dirname + './index.html');
});

// mise en route du serveur
server.listen(connection_server.port, connection_server.host);

let connection_db = require("./../modules/connection_db");
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
  connection_db.port;

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
    let p = await col.insertOne(personDocument);
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

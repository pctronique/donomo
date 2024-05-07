let fsEnv = require("fs");

module.exports = function (fileEnv) {

  this.tabenv = {};
  if (fsEnv.existsSync(fileEnv)) {
    this.contenuFile = fsEnv.readFileSync(fileEnv, "UTF-8").replaceAll('\r', '\n');
    let allline = this.contenuFile.split("\n");
    allline.forEach(element => {
      element = element.trim()
      if (element !== "") {
        let regex = new RegExp('^#');
        if(!regex.test(element)) {
          let keyval = element.split("=", 2);
          this.tabenv[keyval[0].trim()] = keyval[1].trim();
        }
      }
    })
  };

  this.arrayEnv = function () {
    return this.tabenv;
  };

  this.replaceEnv = function (text) {
    let tabobj = this.tabenv;
    Object.keys(tabobj).forEach(key => {
      text = text.replaceAll("${"+key+"}", tabobj[key]);
    });
    return text;
  };
  
};

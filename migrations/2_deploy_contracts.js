var SimpleStorage = artifacts.require("./SimpleStorage.sol");
var Pokemon = artifacts.require("./Pokemon.sol");

module.exports = function (deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(Pokemon);
};

//var Election = artifacts.require("./Election.sol");
var Raffle = artifacts.require("./Raffle.sol");


module.exports = function(deployer) {
  //deployer.deploy(Election);
  deployer.deploy(Raffle);
};

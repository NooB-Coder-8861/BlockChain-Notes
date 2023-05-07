var test = artifact.require("D:\Projects\Solidity-Notes\TrufleTutorial\contracts\test.sol");

module.export = function(deployer){
    deployer.deploy(test);
};
## How to compile Smart Contract in Traffle?
### -> truffle compile

<br> <br> <br>

## How to deploy a Smart Contract ?
Creat a new ' .js ' file in 'migrations' folder and write this code inside that file.
```js
var <variable_name> = artifact.require("<SmartContractAddress>");

module.export = function(deployer){
    deployer.deploy(<variable_name>);
};
```
Now go to 'truffle-config.js' and uncoment 'development:' function and change the port with ganache port address.

Now go to terminal and write : truffle migrate --reset
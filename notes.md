# Solidity

#### 'require' and user defined access specifiers :
 ```sol
pragma solidity 0.5.1;

contract MyContract{

    uint public count;
    address owner;
    uint openingTime=1680455626;

    constructor() public{
        count=0;
        owner=msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender==owner);
        _;
    }
    modifier onlyWhileOpen(){
        require(block.timestamp >= openingTime);
        _;
    }

    mapping(uint => Person) public people;
    
    struct Person{
        uint uid;
        string fname;
        string lname;
    }

    function addName(string memory _fname,string memory _lname) public onlyOwner onlyWhileOpen{
        count+= 1;
        people[count] = Person(count, _fname, _lname);
    }
}
```

#### ETH transfer : 
``` sol
pragma solidity 0.5.1;

contract MyContract1{

    mapping(address => uint) public balance;
    address payable wallet;

    constructor(address payable _wallet) public{
        wallet = _wallet;
    }

    function abc() external payable{
        buyToken();
    }

    function buyToken() public payable{
        //add 1 Token whoever calls the function;
        balance[msg.sender] += 1;
        //transfer token;
        wallet.transfer(msg.value);
    }
}
```

#### Calling one Smart Contract from another Smart Contract :
``` sol
pragma solidity 0.5.1;

contract ERC20token {

    mapping(address => uint) public balance;

    function mint() external {
        balance[tx.origin]++;
    }
}

contract myContract{

    address token;

    constructor(address _token) public{
        token = _token;
        
    }


    function buyToken() public payable{
        ERC20token _token = ERC20token(address(token));
        _token.mint();
    }
}


#### Creating own librery and using it :
###### Librery
``` sol
pragma solidity 0.5.1;

library MathLibrary{

    function div(int a,int b) internal pure returns(int){
        require(b != 0);
        int c = a/b;
        return c;
    }

    function mul(int a,int b) internal pure returns(int){
        int c = a*b;
        return c;
    }

    function add(int a,int b) internal pure returns(int){
        int c = a+b;
        return c;
    }

    function sub(int a,int b) internal pure returns(int){
        int c = a-b;
        return c;
    }

}
```

###### Smart Contract :
``` sol
pragma solidity 0.5.1;

import "tests/library/MathLibrary.sol";

contract MyContract{
    
    int public value;

    function Adition(int a, int b) public{
        value = MathLibrary.add(a,b);
    }

    function Subtraction(int a, int b) public{
        value = MathLibrary.sub(a,b);
    }

    function Multiplication(int a, int b) public{
        value = MathLibrary.mul(a,b);
    }

    function Deviation(int a, int b) public{
        value = MathLibrary.div(a,b);
    }
}
```
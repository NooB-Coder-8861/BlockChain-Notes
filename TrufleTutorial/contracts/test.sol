pragma solidity 0.5.1;

contract MyContract{
    
    int public value;

    function Adition(int a, int b) public{
        value = a+b;
    }

    function Subtraction(int a, int b) public{
        value = a-b;
    }

    function Multiplication(int a, int b) public{
        value = a*b;
    }

    function Deviation(int a, int b) public{
        value = a/b;
    }
}
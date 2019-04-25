pragma solidity ^0.5.0;

contract Hello {
    // storage property, as it is private can't be accessed from the outside
    string private greet;

    // defaults greet
    constructor() public {
        greet = "hello world";
    }

    // public function to get the current value of greet (as it is view doesn't affect storage)
    function getGreeting() public view returns(string memory) {
        return greet;
    }

    // public function to set a new value for greet (this DOES change storage!)
    function setGreeting(string memory greet_) public {
        greet = greet_;
    }
}
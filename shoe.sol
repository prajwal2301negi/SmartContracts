// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract shoe{

    struct Memo{
        string message;
        uint price;
        uint timestamp;
        address from;
    }

    Memo[] memos;
    address payable owner; // going to receive funds
    constructor(){
        owner = payable (msg.sender);
    }

    function buyShoe(string calldata message, uint price) external payable{
        require(msg.value>=price, "Please pay the required ether");
        owner.transfer(msg.value);
        memos.push(Memo(message,price,block.timestamp,msg.sender));
    }
    function getMemos() public view returns(Memo[] memory){
        return memos;
    }
}
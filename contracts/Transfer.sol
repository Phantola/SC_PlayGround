// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity >=0.8.0 <0.9.0;
contract Transfer {
    address payable public owner;
    address payable public sender;

    // external : 외부 행동으로부터 행위 가능케 함
    // payable : 이더를 받을 수 있게 함
    receive() external payable {}

    constructor() {
        owner = payable(address(this));
        sender = payable(msg.sender);
    }

    function transferToOwner() external payable {
        bool sent = owner.send(msg.value);
        require(sent, "Failed to send Ether");
    }
}
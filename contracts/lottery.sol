// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract LotteryAuction {
    address public owner;
    address[] public participants;
    address public winner;
    uint public lotteryId;
    uint public minEntryAmount = 0.01 ether;

    event EnteredLottery(address indexed participant, uint indexed lotteryId);
    event WinnerDeclared(address indexed winner, uint amount, uint indexed lotteryId);
    event LotteryReset(uint indexed lotteryId);

    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action.");
        _;
    }

    function enter() external payable {
        require(msg.value >= minEntryAmount, "Minimum 0.01 ETH required to enter.");
        participants.push(msg.sender);
        emit EnteredLottery(msg.sender, lotteryId);
    }

    function getParticipants() external view returns (address[] memory) {
        return participants;
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function declareWinner() external onlyOwner {
        require(participants.length > 0, "No participants in the lottery.");
        uint index = random() % participants.length;
        winner = participants[index];
        uint prize = address(this).balance;
        payable(winner).transfer(prize);
        emit WinnerDeclared(winner, prize, lotteryId);

        // Reset for next round
        delete participants;
        lotteryId += 1;
        emit LotteryReset(lotteryId);
    }

    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, participants.length)));
    }
}
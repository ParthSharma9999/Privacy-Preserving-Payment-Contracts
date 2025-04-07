// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrivacyPreservingPayment {
    address public owner;

    struct Payment {
        uint256 amount;
        bool claimed;
    }

    mapping(bytes32 => Payment) private payments;

    event PaymentSent(address indexed sender, bytes32 indexed hashedReceiver, uint256 amount);
    event PaymentClaimed(address indexed receiver, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    // Send payment anonymously to a hashed identifier
    function sendPayment(bytes32 hashedReceiver) external payable {
        require(msg.value > 0, "Amount must be greater than 0");
        require(payments[hashedReceiver].amount == 0, "Payment already exists for this hash");

        payments[hashedReceiver] = Payment({
            amount: msg.value,
            claimed: false
        });

        emit PaymentSent(msg.sender, hashedReceiver, msg.value);
    }

    // Receiver claims payment using preimage
    function claimPayment(string memory preimage) external {
        bytes32 hashed = keccak256(abi.encodePacked(preimage));
        Payment storage p = payments[hashed];

        require(p.amount > 0, "No payment found");
        require(!p.claimed, "Payment already claimed");

        p.claimed = true;
        payable(msg.sender).transfer(p.amount);

        emit PaymentClaimed(msg.sender, p.amount);
    }

    // Emergency function to withdraw funds (owner only)
    function emergencyWithdraw() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    // Fallback to accept ETH
    receive() external payable {}
}

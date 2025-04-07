Privacy-Preserving Payment Contracts

Project Description

The Privacy-Preserving Payment Contracts project introduces a secure and anonymous payment system built on Ethereum using Solidity. It enables users to send funds by hashing recipient identifiers, hiding recipient addresses on-chain. Recipients can later claim their funds using a preimage string, ensuring complete anonymity and data privacy.

Project Vision

The vision behind this project is to create a decentralized financial infrastructure where privacy and transparency coexist. As blockchains are inherently public, this contract empowers users with confidentiality in peer-to-peer payments, ensuring sensitive financial data stays concealed without compromising security.

Key Features

Hashed Recipient Identities: Users send ETH to a hashed version of the receiver’s identifier, masking the actual destination address.

Preimage-Based Claims: Recipients claim funds only by proving knowledge of the preimage, ensuring only the rightful person can access the payment.

One-Time Claim Enforcement: Each payment can only be claimed once, protecting against double-spending.

Event Logging for Transparency: Events are logged for sent and claimed payments without revealing user identities.

Emergency Withdrawals: Contract owner has the ability to withdraw remaining funds in emergency scenarios.


Future Scope

Zero-Knowledge Proof Integration: Enhance privacy further by integrating zk-SNARKs or zk-STARKs for fully private claims.

Expiration Mechanism: Add expiry times for payments to auto-refund if not claimed in time.

Encrypted Off-Chain Messaging: Enable encrypted notes to be passed securely between sender and receiver.

Multi-Payment Bundles: Allow batch payments to multiple hidden recipients.

Layer 2 Compatibility: Optimize the contract to work efficiently on Layer 2 networks like zkSync or Optimism.

## Contract Details:0x6aad04487b45E609Cc30D33c3BAbe05C0A68BCc9

0x6aad04487b45E609Cc30D33c3BAbe05C0A68BCc9

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title FrameSignerRegistry
 * @dev On-chain indexer contract checking off-chain social signatures for identity verification.
 */
contract FrameSignerRegistry {
    address public securityManager;
    mapping(address => uint256) public verifiedSignerToFid;

    event SignerRegistered(address indexed signerKey, uint256 indexed fid);

    constructor() {
        securityManager = msg.sender;
    }

    /**
     * @notice Registers an authenticated off-chain app signer key to a user's Farcaster ID (FID).
     */
    function registerAppSigner(address signerKey, uint256 fid) external {
        require(msg.sender == securityManager, "AuthError: Unauthorized registry manager");
        require(signerKey != address(0), "ParameterError: Invalid signer key");

        verifiedSignerToFid[signerKey] = fid;
        emit SignerRegistered(signerKey, fid);
    }
}

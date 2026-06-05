# Farcaster Frames v2 Signer Validation Engine

By mid-2026, **Farcaster Frames v2** are widely used to embed mini-applications natively inside decentralized social streams. Because these frames trigger state updates, in-app mints, and financial interactions directly within feeds, validating incoming client messages is a core security requirement.

This repository provides a professional-grade reference implementation to intercept and cryptographically verify action payloads sent by Farcaster client environments (such as Warpcast). It ensures that all incoming user information—including their Farcaster ID (FID), clicked buttons, and input text—is genuine and has not been altered or spoofed.

## Validation Process
1. **Payload Ingestion:** The backend receives an encrypted or serialized message container from the frame UI.
2. **Hub Query Serialization:** The signer engine unpacks the `trustedData.messageBytes` string.
3. **Cryptographic Verification:** The payload is verified against a Farcaster Hub using native Ed25519 signature validation primitives to confirm the authenticity of the initiating identity.

## Setup Instructions
1. Install server dependencies: `npm install`
2. Specify your target Farcaster Hub URL endpoint inside your local `.env`.
3. Boot up the validation api microservice: `node serverSigner.js`

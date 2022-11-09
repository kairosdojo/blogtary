// SPDX-License-Identifier: GPL-3.0-or-later
/*
    Blogtary: a minimalistic notary for my ramblings. It just records a sha-256 on a EVM-like smart contract.
*/ 
pragma solidity ^0.8.17;

contract Blogtary {

    address admin;

    constructor () {
        admin = msg.sender;

        // The sha-256 hash of the url of my blog
        emit certify(0x021adf127c84724dcc979aaab4b1b36b62d3f54894e5b0e19d56d78cdfd9e288);
    }

    event certify(
        bytes32 sha256Post
    );

    modifier onlyAdminCan() {
        require(admin == msg.sender, "Sorry, you can't do that.");
        _;
    }

    function blogtary(bytes32 sha256Post) public onlyAdminCan {
        emit certify(sha256Post);
    }
}
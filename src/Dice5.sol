// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IDice} from "./IDice.sol";
import {Dice6} from "./Dice6.sol";

contract Dice5 is IDice {
    IDice dice6;

    constructor() {
        dice6 = new Dice6();
    }

    function roll() public returns (uint256) {
        return 0;
    }
}

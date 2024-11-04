// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IDice} from "./IDice.sol";
import {Dice6} from "./Dice6.sol";

contract Dice7b is IDice {
    IDice dice6;

    constructor() {
        dice6 = new Dice6();
    }

    function roll() public returns (uint256) {
        uint256 value = 0;
        uint256 rollA;
        uint256 rollB;
        while (value == 0) {
            rollA = roll6();
            rollB = roll6();
            if ((rollA + rollB) == 12) { continue;}
            value = rollA + (rollA >= rollB ? 1 : 0);
        }

        return value;
    }

    function roll6() private returns (uint256) {
        return dice6.roll();
    }
}

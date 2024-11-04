// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IDice} from "./IDice.sol";
import {Dice6} from "./Dice6.sol";

contract Dice7a is IDice {
    IDice dice6;

    constructor() {
        dice6 = new Dice6();
    }

    function roll() public returns (uint256) {
        uint256 value = 0;
        while ((value == 0) || (value == 8)) {
            value = roll6() * 2 ^ 2 + roll6() * 2 ^ 1 + roll6();
        }

        return value;
    }

    function roll6() private returns (uint256) {
        return (dice6.roll() < 4 ? 1 : 0);
    }
}

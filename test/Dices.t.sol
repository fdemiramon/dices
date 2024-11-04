// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Dice5} from "../src/Dice5.sol";
import {Dice6} from "../src/Dice6.sol";
import {Dice7a} from "../src/Dice7a.sol";
import {Dice7b} from "../src/Dice7b.sol";
import {IDice} from "../src/IDice.sol";
import {console} from "forge-std/console.sol";

contract Dice6Test is Test {
    uint256 internal constant NUMBER_LOOPS = 100000;
    uint256 internal constant CHECK_PRECISION = 1000;

    function test_dice6() public {
        rollDice(6, IDice(new Dice6()));
    }

    function test_dice5() public {
        rollDice(5, IDice(new Dice5()));
    }

    function test_dice7a() public {
        rollDice(7, IDice(new Dice7a()));
    }

    function test_diceb() public {
        rollDice(7, IDice(new Dice7b()));
    }

    function rollDice(uint256 facets, IDice dice) public {
        uint256 value;
        uint256[] memory distribution = new uint256[](facets);

        for (uint256 i = 0; i < NUMBER_LOOPS; i++) {
            value = dice.roll();
            require(facets - value < facets, "ERROR: value out of bounds");
            distribution[value - 1]++;
        }
        uint256 total;
        for (uint256 i = 0; i < facets; i++) {
            total += distribution[i];
        }

        uint256 deviation;
        for (uint256 i = 0; i < facets; i++) {
            deviation = distribution[i] * facets * CHECK_PRECISION / total;
            require(9 * CHECK_PRECISION / 10 < deviation, "ERROR: distribution not linear");
            require(deviation < 11 * CHECK_PRECISION / 10, "ERROR: distribution not linear");
        }
    }
}

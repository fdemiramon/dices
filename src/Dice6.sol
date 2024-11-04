// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Vm} from "forge-std/Vm.sol";
import {IDice} from "./IDice.sol";

contract Dice6 is IDice {
    address internal constant VM_ADDRESS = address(uint160(uint256(keccak256("hevm cheat code"))));
    Vm internal constant vm = Vm(VM_ADDRESS);

    function roll() public returns (uint256) {
        return vm.randomUint(1, 6);
    }
}

